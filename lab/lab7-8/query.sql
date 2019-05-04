use zoo;


# <==============================_INTERSECTION_==============================>
select * from healing inner join medicine on healing.medicine_id = medicine.medicine_id where expiration_date>'2021-04-08';
select * from healing, medicine where healing.medicine_id = medicine.medicine_id;

select animal.kind, medicine.kind, staff.full_name, roles.role from healing
inner join medicine on healing.medicine_id = medicine.medicine_id
inner join animal on healing.animal_id = animal.animal_id
inner join staff_role on healing.staff_role_id = staff_role.staff_role_id
inner join staff on staff.staff_id = staff_role.staff_id
inner join roles on roles.role_id = staff_role.role_id;


# <==============================_INTERSECTION_+_FIRST_TABLE_==============================>
select * from staff_role left join healing on healing.staff_role_id = staff_role.staff_role_id;


# <==============================_INTERSECTION_+_LAST_TABLE_==============================>
select * from healing right join staff_role on healing.staff_role_id = staff_role.staff_role_id;


# <==============================_NESTED_JOINS_==============================>
select full_name, feeding_time, animal_id from staff
inner join (
	select feeding_time, staff_id, animal_id from staff_role
	left join feeding_schedule on feeding_schedule.staff_role_id = staff_role.staff_role_id
	where feeding_time is null
) as j1 on staff.staff_id = j1.staff_id;


select full_name, mail, experience, role from roles
inner join (
	select full_name, mail, experience, role_id from staff_role
    inner join staff on staff_role.staff_id = staff.staff_id
	where staff.full_name like '''j%n'''
)as j1 on j1.role_id = roles.role_id;


select count(*) as staff_num from staff where home_address like '''b%baker%'''
union
select count(*) from staff where age > 20;


## треба давати всім as "alias", щоб звернутись до них вище
#  тварин якого виду найменше і скільки їх
select kind, min(animal_kind_num) as min_animal_kind from
(
select animal.kind, count(animal.kind) as animal_kind_num from animal
group by animal.kind
) as s1
;

# скільки тварин годує кожен працівник
select full_name, role, count(full_name) as animal_num
from(
select distinct animal.animal_id, staff.full_name, roles.role from feeding_schedule
inner join animal on feeding_schedule.animal_id = animal.animal_id
inner join staff_role on staff_role.staff_role_id = feeding_schedule.staff_role_id
inner join roles on staff_role.role_id = roles.role_id
inner join staff on staff.staff_id = staff_role.staff_id
) as s1
group by full_name
;


# найбільша вага тварини серед її виду за зростонням, та в якій локації вона живе
select kind, max(weight), location_name from animal
inner join location on animal.location_id = location.location_id
group by kind
order by weight asc
;


