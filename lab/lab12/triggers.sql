use zoo;
/* /
delimiter //
# міняє внесене значення - нормує вагу відносно кількості тварин даного типу
drop trigger if exists tg1 //
create trigger tg1 before insert
on animal for each row
begin
	declare normer int default (select count(animal_id) from animal);
	set new.weight = new.weight/normer;
end //
//
delimiter ;
set autocommit=0;
start transaction;
insert into animal values(null, '''brown bear''', '2000-01-23', 1, 534, 3, 'male'),
						(null, '''brown bear''', '2003-02-20', 1, 472, 3, 'female'),
						(null, '''brown bear''', '2011-01-00', 1, 303, 3, 'female');
select * from animal where kind = '''brown bear''';
rollback;
/**/


/*/
delimiter //
# не дозволяє змінити попереднє значення полів kind, gender, та birth_date
drop trigger if exists tg2 //
create trigger tg2 before update
on animal for each row
begin
	#set new.kind = old.kind;
    #set new.gender = old.gender;
    set new.birth_date = old.birth_date;
end //
//
delimiter ;
update animal set kind = '''dirty dog''', gender='''crunchy robot''' where animal_id=1;
select * from animal;
/**/


/*/
delimiter //
# не дозволяє змінити зарплату працівника на більш ніж 25% за запит
drop trigger if exists tg3 //
create trigger tg3 before update
on roles for each row
begin
	if new.salary/old.salary > 0.25 then
		set new.salary = old.salary; 
    end if;
end //
//
delimiter ;

update roles set salary=20000 where role_id = 1;
select * from roles;
/**/


/*/
set autocommit=0;
start transaction;
delimiter //
# не дозволяє змінити зарплату працівника на більш ніж 25% за запит
drop trigger if exists tg4 //
create trigger tg4 before delete
on location for each row
begin
	update animal set animal.location_id = 1 where animal.location_id = old.location_id;
end //
//
delimiter ;
select animal.animal_id, animal.kind, location_name, location.location_id from location
inner join animal on location.location_id = animal.location_id;
delete from location where location_id = 2;
select animal.animal_id, animal.kind, location_name, location.location_id from location
inner join animal on location.location_id = animal.location_id;
rollback;
/**/