use zoo;

/*/
# персонал із віком між low_age та high_age
drop procedure if exists pr1;
delimiter //
CREATE PROCEDURE pr1 (in low_age int, in high_age int)
BEGIN
	SELECT full_name, mail FROM staff
    where age between low_age and high_age;
END//
delimiter ;

call pr1(20,30);
/**/


/*/
# процедура зберігає середню вагу в змінну, яку їй передають
drop procedure if exists pr2;
delimiter //
CREATE PROCEDURE pr2 (out avg_weight float)
BEGIN
	SELECT avg(weight) into avg_weight FROM animal;
END//
delimiter ;
call pr2(@avg_weight);
select @avg_weight as avg_animals_weight;
/**/


/*/
#<=======================_get_animals_password_=======================>
drop procedure if exists pr3;
delimiter //
create procedure pr3 (in pass varchar(16))
begin
	if (pass = '''pass''') then
		select * from animal;
	else
		select 'bad password';
    end if;
end// 
delimiter ;
#call pr3('''pass''');


/* /
# повертає вагу тварин, нормовану відносно найбільшої ваги
drop function if exists fn1;
delimiter //
create function fn1(weight float) returns float deterministic
begin
	declare max_weight int;
    set max_weight = (select max(animal.weight) from animal);
	return weight/max_weight;
end;
//
delimiter ;
select animal_id, kind, fn1(weight) as norm_weight from animal;
/**/


/* /
drop procedure if exists staff_info;
delimiter //
# процедура, повертає інформацію про працівників, якщо введено правильний пароль
create procedure staff_info(in password1 tinyblob)
begin
	declare decrypted_key char(64);
	set decrypted_key = aes_decrypt(password1, 'private_key');
	if (decrypted_key = 'pass') then
		select * from staff;
	else
		select "permission denied, incorrect password" as error1;
	end if;
end //
delimiter ;
call staff_info(aes_encrypt('pass', 'private_key'));
/**/


/**/
drop procedure if exists meal_info;
delimiter //
create procedure meal_info(in in_meal_name varchar(32))
begin
	select animal.animal_id, animal.kind as animal_kind, meal_name, (meal_amount/(feeding.portion*2)) as meal_on_days from feeding_schedule
    inner join animal on animal.animal_id = feeding_schedule.animal_id
    inner join feeding on feeding.feeding_id = feeding_schedule.feeding_id
    inner join 
    (select meal.meal_id, meal.name as meal_name, meal.amount as meal_amount from meal where meal.name = in_meal_name)
    as m1 on m1.meal_id = feeding.meal_id
    ;
end //
delimiter ;
start transaction;
call meal_info('''nut''');
call meal_info('''banana''');
commit;
