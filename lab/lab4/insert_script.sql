#use zoo;

#insert into roles values(1, 'cashier', 1500);
#insert into zoo.roles values (null, 'breadwinner', 1700),
#							 (null, 'vet', '2500'),
#                             (null, 'cleaner', '1500');

#load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/medicine.tbl' into table medicine lines terminated by '\r\n';
#load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/meal.tbl' into table meal lines terminated by '\r\n';

#update meal set expiration_date='2019-05-07' where meal_id=1;
#update meal set amount=190.5 where meal_id=4;

#delete from medicine where (expiration_date<'2021-04-09');
