

#    запитати про unique і відношення (багато-1)   #


drop database `zoo`;
CREATE SCHEMA `zoo` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE `zoo`.`medicine` (
	`medicine_id` INT NOT NULL AUTO_INCREMENT,
	`kind` VARCHAR(255) NOT NULL,
	`producer` VARCHAR(255) NOT NULL,
	`expiration_date` DATE NOT NULL,
	PRIMARY KEY (`medicine_id`)
);

CREATE TABLE `zoo`.`meal` (
	`meal_id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`amount` FLOAT NOT NULL,
	`kind` VARCHAR(255) NOT NULL,
	`producer` VARCHAR(255) NOT NULL,
	`expiration_date` DATE NOT NULL,
	PRIMARY KEY (`meal_id`)
);

CREATE TABLE `zoo`.`roles` (
	`role_id` INT NOT NULL AUTO_INCREMENT,
	`role` VARCHAR(255) NOT NULL,
	`salary` FLOAT NOT NULL,
	PRIMARY KEY (`role_id`)
);

CREATE TABLE `zoo`.`staff` (
	`staff_id` INT NOT NULL AUTO_INCREMENT,
	`full_name` VARCHAR(255) NOT NULL,
	`age` INT NOT NULL,
	`phone_number` VARCHAR(255) NOT NULL,
	`home_address` VARCHAR(255) NOT NULL,
	`mail` VARCHAR(255) NOT NULL,
	`gender` VARCHAR(255) NOT NULL,
	`experience` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`staff_id`)
);


CREATE TABLE `zoo`.`staff_role` (
	`staff_role_id` INT NOT NULL AUTO_INCREMENT,
	`role_id` INT NOT NULL,
	`staff_id` INT NOT NULL,
	PRIMARY KEY (`staff_role_id`)
    ,
    constraint role_fk foreign key (role_id)
    references zoo.roles (role_id) on delete cascade on update cascade
    ,
    constraint staff_fk foreign key (staff_id)
    references zoo.staff (staff_id) on delete cascade on update cascade
);

CREATE TABLE `zoo`.`cleaning` (
	`clean_id` INT NOT NULL AUTO_INCREMENT,
	`staff_role_id` INT NOT NULL,
    `date_time` DATETIME NOT NULL,
	PRIMARY KEY (`clean_id`)
    ,
    constraint staff_role_fk_3 foreign key (staff_role_id)
    references zoo.staff_role (staff_role_id) on delete cascade on update cascade
);

CREATE TABLE `zoo`.`location` (
	`location_id` INT NOT NULL AUTO_INCREMENT,
	`location_name` VARCHAR(255) NOT NULL,
    `clean_id` INT NOT NULL,
	PRIMARY KEY (`location_id`)
    ,
    constraint clean_fk_1 foreign key (clean_id)
    references zoo.cleaning (clean_id) on delete cascade on update cascade
);

CREATE TABLE `zoo`.`feeding` (
	`feeding_id` INT NOT NULL AUTO_INCREMENT,
	`meal_id` INT NOT NULL,
	`portion` FLOAT NOT NULL,
	`date_time` DATETIME NOT NULL,
	`staff_role_id` INT NOT NULL,
	PRIMARY KEY (`feeding_id`)
    ,
    constraint meal_fk foreign key (meal_id)
    references zoo.meal (meal_id) on delete no action on update cascade
    ,
    constraint staff_role_fk_2 foreign key (staff_role_id)
    references zoo.staff_role (staff_role_id) on delete cascade on update cascade
);

CREATE TABLE `zoo`.`animal` (
	`animal_id` INT NOT NULL AUTO_INCREMENT,
	`kind` VARCHAR(255) NOT NULL,
	`birth` DATE NOT NULL,
	`healthy` BOOLEAN NOT NULL,
	`weight` FLOAT NOT NULL,
    `location_id` INT NOT NULL,
    `feeding_id` INT NOT NULL,
	PRIMARY KEY (`animal_id`)
    ,
    constraint location_fk_1 foreign key (location_id)
    references zoo.location (location_id) on delete cascade on update cascade
    ,
    constraint feeding_fk_1 foreign key (feeding_id)
    references zoo.feeding (feeding_id) on delete cascade on update cascade
);

CREATE TABLE `zoo`.`healing` (
	`heal_id` INT NOT NULL AUTO_INCREMENT,
	`medicine_id` INT NOT NULL,
	`animal_id` INT NOT NULL,
	`staff_role_id` INT NOT NULL,
    `date_time` DATETIME NOT NULL,
	PRIMARY KEY (`heal_id`)
    ,
    constraint medicine_fk foreign key (medicine_id)
    references zoo.medicine (medicine_id) on delete no action on update cascade
    ,
    constraint animal_fk_2 foreign key (animal_id)
    references zoo.animal (animal_id) on delete cascade on update cascade
    ,
    constraint staff_role_fk_1 foreign key (staff_role_id)
    references zoo.staff_role (staff_role_id) on delete cascade on update cascade
    ,
    constraint unique(animal_id,date_time,staff_role_id)
);



#ALTER TABLE `staff_Role` ADD CONSTRAINT `staff_Role_fk0` FOREIGN KEY (`role_id`) REFERENCES `Role`(`role_id`);
#ALTER TABLE `staff_Role` ADD CONSTRAINT `staff_Role_fk1` FOREIGN KEY (`staff_id`) REFERENCES `staff`(`staff_id`);
#ALTER TABLE `Feeding` ADD CONSTRAINT `Feeding_fk0` FOREIGN KEY (`animal_id`) REFERENCES `Animal`(`animal_id`);
#ALTER TABLE `Feeding` ADD CONSTRAINT `Feeding_fk1` FOREIGN KEY (`meal_id`) REFERENCES `Meal`(`meal_id`);
#ALTER TABLE `Feeding` ADD CONSTRAINT `Feeding_fk2` FOREIGN KEY (`staff_role_id`) REFERENCES `staff_Role`(`staff_role_id`);
#ALTER TABLE `Healing` ADD CONSTRAINT `Healing_fk0` FOREIGN KEY (`medicine_id`) REFERENCES `Medicine`(`medicine_id`);
#ALTER TABLE `Healing` ADD CONSTRAINT `Healing_fk1` FOREIGN KEY (`animal_id`) REFERENCES `Animal`(`animal_id`);
#ALTER TABLE `Healing` ADD CONSTRAINT `Healing_fk2` FOREIGN KEY (`staff_role_id`) REFERENCES `staff_Role`(`staff_role_id`);
#ALTER TABLE `Cleaning` ADD CONSTRAINT `Cleaning_fk0` FOREIGN KEY (`location_id`) REFERENCES `Locations`(`location_id`);
#ALTER TABLE `Cleaning` ADD CONSTRAINT `Cleaning_fk1` FOREIGN KEY (`staff_role_id`) REFERENCES `staff_Role`(`staff_role_id`);
