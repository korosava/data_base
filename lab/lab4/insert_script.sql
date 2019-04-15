use zoo;
/*/
# <============================================_PRIMARY_TABLES======================================>

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/medicine.tbl' into table medicine lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/meal.tbl' into table meal lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/roles.tbl' into table roles lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staff.tbl' into table staff lines terminated by '\n';


# <============================================_FK_TABLES======================================>

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staff_role.tbl' into table staff_role lines terminated by '\n';                          
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaning.tbl' into table cleaning lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/location.tbl' into table location lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/feeding.tbl' into table feeding lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/animal.tbl' into table animal lines terminated by '\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/healing.tbl' into table healing lines terminated by '\n';
/**/


/*/
# <============================================_FK_TABLES======================================>

update meal set expiration_date='2019-05-07' where meal_id=1;
update meal set amount=190.5 where meal_id=4;
delete from medicine where (expiration_date<'2022-04-09');
insert into staff_role values(null, 1, 1),
							(null, 2, 2),
                            (null, 3, 3),
                            (null, 4, 4);
/**/