use zoo;
set autocommit=0;

start transaction;
insert into animal values(18, 'brown bear', '2000-01-23', 1, 534, 3, 'male'),
						(19, 'brown bear', '2003-02-20', 1, 472, 3, 'female'),
						(20, 'brown bear', '2011-01-00', 1, 303, 3, 'female');
insert into meal values(5, 'salmon', 300, 'fish', 'fish corporation', '2019-08-00');
insert into feeding values(9, 5, 10),
						(10, 5, 5);
insert into feeding_schedule values(null, 9, 18, '06:00:00', 1),
								(null, 9, 19, '06:00:00', 1),
                                (null, 10, 20, '06:00:00', 1),
                                (null, 9, 18, '19:00:00', 2),
                                (null, 9, 19, '19:00:00', 2),
                                (null, 10, 20, '19:00:00', 2);
commit;

select * from animal;
