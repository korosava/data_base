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

select * from healing;



