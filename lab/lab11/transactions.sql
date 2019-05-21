use zoo;
set autocommit=0;

start transaction;
savepoint sp1;
insert into animal values(21, 'brown bear', '2000-01-23', 1, 534, 3, 'male'),
						(22, 'brown bear', '2003-02-20', 1, 472, 3, 'female'),
						(23, 'brown bear', '2011-01-00', 1, 303, 3, 'female');
insert into meal values(6, 'salmon', 300, 'fish', 'fish corporation', '2019-08-00');

savepoint sp2;
insert into feeding values(11, 6, 10),
						(12, 6, 5);
insert into feeding_schedule values(null, 11, 18, '06:00:00', 1),
								(null, 11, 19, '06:00:00', 1),
                                (null, 12, 20, '06:00:00', 1),
                                (null, 11, 18, '19:00:00', 2),
                                (null, 11, 19, '19:00:00', 2),
                                (null, 12, 20, '19:00:00', 2);
commit;

select * from animal;
