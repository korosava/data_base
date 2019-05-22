use zoo;


/*/
create index health_index1 on animal (animal_id, healthy);
create index name_index1 on meal (meal_id, `name`);
show index from animal;
show index from meal;
/**/


/*/
# всі тварини з healing, котрі їдять горіхи
explain
select animal_id, kind, name
from(
select distinct animal.animal_id, animal.kind, meal.name from feeding_schedule
inner join feeding on feeding_schedule.feeding_id =  feeding.feeding_id
inner join animal on animal.animal_id = feeding_schedule.animal_id
inner join meal on meal.meal_id = feeding.meal_id
) as s1
where s1.name = '''nut'''
and animal_id =
any(
select animal_id from healing
)
;
/**/


/**/
# показує хворих тварин, їх їжу та локацію
analyze table animal;
explain
select straight_join animal_id, kind as animal_kind, name as meal_name, location_name
from(
select distinct animal.animal_id, animal.kind, animal.healthy, meal.name, location_name from feeding_schedule
inner join feeding on feeding_schedule.feeding_id =  feeding.feeding_id
inner join animal on animal.animal_id = feeding_schedule.animal_id
inner join meal on meal.meal_id = feeding.meal_id
inner join location on location.location_id = animal.location_id
) as s1
where s1.healthy = 1 
;
/**/




