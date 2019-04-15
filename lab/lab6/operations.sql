/*/
# проекція, вибираю деякі стовпці
create view staff_3 as select distinct staff_id,full_name,age,experience from staff;
select * from staff_3;

# селекція, вибираю рядки за умовою
select * from staff_3 where age < 37;

# натуральне з'єднання, селект стовпів з 2-х+ табл за спільною ознакою
select staff_role_id, role_id, staff_3.staff_id, full_name, age, experience from staff_role, staff_3
where staff_3.staff_id = staff_role.staff_id

# select + натуральне з'єднання
select staff_role_id, role_id, staff_3.staff_id, full_name, age, experience from staff_role, staff_3
where staff_3.staff_id = staff_role.staff_id
and age < 37;
/**/