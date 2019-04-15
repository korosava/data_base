use zoo;
/*/
# <==============================_CREATE_TABLES==============================>
drop table staff_1, staff_2;

create table staff_1
as select full_name, age, experience from staff
where age <= 35;

create table staff_2
as select full_name, age, experience from staff
where age <= 45;
//

# <==============================_OPERATE_TABLES==============================>

select * from staff_2 
where experience in (select experience from staff_1);

select * from staff_2 
where experience not in (select experience from staff_1);

select * from staff_1, staff_2;

select * from staff_2
union select * from staff_1;
/**/


