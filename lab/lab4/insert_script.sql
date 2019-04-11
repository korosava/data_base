use zoo;


insert into roles values ('breadwinner', 1700),
						('cashier', 1500),
						('vet', '2500'),
						('cleaner', '1500');
                        
insert into staff values ('jack Jones Jameson', '40', '765-333-2227', 'boston_baker_st_20', 'jack@zmail.com', 'male', 'high'),
						('Tom Tomes Tompson', '41', '735-363-2237', 'boston_baker_st_21', 'tom@zmail.com', 'male', 'high'),
                        ('Brad Brades Bradeson', '30', '762-333-2227', 'boston_baker_st_10', 'brad@zmail.com', 'male', 'mid'),
                        ('Scott Scotess Scoteson', '35', '765-333-1227', 'boston_baker_st_11', 'scott@zmail.com', 'male', 'mid');
                        
insert into staff_role values(1, 1),
							(2, 2),
                            (3, 3),
                            (4, 4);

insert into	cleaning values(4, '2020-04-19 8:00:00'),
							(4, '2020-04-19 8:00:00'),
                            (4, '2020-04-19 10:00:00'),
                            (4, '2020-04-19 10:00:00');
                            
insert into location values('north', 1),
							('south', 2),
                            ('west', 3),
                            ('east', 4);
                            
insert into feeding values(1, 1),
							(2, 0.5),
                            (3, 5),
                            (4, 2);



                        

#load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/medicine.tbl' into table medicine lines terminated by '\r\n';
#load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/meal.tbl' into table meal lines terminated by '\r\n';
# 

#update meal set expiration_date='2019-05-07' where meal_id=1;
#update meal set amount=190.5 where meal_id=4;

#delete from medicine where (expiration_date<'2022-04-09');

#use zoo;
#insert into feeding values (feedingfeeding),();