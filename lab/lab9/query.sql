use zoo;
# середній вік працівників зоопарку
select avg(age) as average_age from staff;

# тварини з найменшою вагою серед їх виду
select kind, min(weight) from animal
group by kind
;

# кількість тварин кожного виду
select kind, count(kind) from animal
group by kind
;

# кількість, та середній вік працівників із високою кваліфікацією
select count(staff_id) as high_qualified_num, avg(age) as average_age
from (
select * from staff
where experience = '''high'''
) as s1
;

# всі рядки roles, якщо нема хоч 1 зарплати меншої за 1000
select * from roles
where not exists
(select salary from roles where salary<1000)
;


# всі тварини з healing, які їдять банани
select animal_id, kind, name
from(
select distinct animal.animal_id, animal.kind, meal.name from feeding_schedule
inner join feeding on feeding_schedule.feeding_id =  feeding.feeding_id
inner join animal on animal.animal_id = feeding_schedule.animal_id
inner join meal on meal.meal_id = feeding.meal_id
) as s1
where s1.name = '''banana'''
and animal_id =
any(
select animal_id from healing
)
;


select kind,full_name,date_time
from (
select	animal.kind, staff.full_name, healing.date_time
from healing
inner join animal on healing.animal_id = animal.animal_id
inner join staff_role on healing.staff_role_id = staff_role.staff_role_id
inner join staff on staff_role.staff_id = staff.staff_id
) as s1
where date_time = '2020-04-19 6:00:00';

select kind as animal, full_name as staff_name, location_name,date_time
from(
select animal.kind, staff.full_name, location.location_name,cleaning.date_time
from animal
inner join location on animal.location_id = location.location_id
inner join cleaning on location.clean_id = cleaning.clean_id
inner join staff_role on cleaning.staff_role_id = staff_role.staff_role_id
inner join staff on staff_role.staff_id = staff.staff_id 
) as s2
where date_time BETWEEN '2020-04-19 10:00:00' and '2020-05-19 10:00:00';


select kind,weight,weight-(select std(weight) from animal) as norm_weight, (to_days('2019-05-11')-to_days(birth_date))/365 as age_years
from animal
where (to_days('2019-05-11')-to_days(birth_date))/365 > 1
;

select * from staff;




