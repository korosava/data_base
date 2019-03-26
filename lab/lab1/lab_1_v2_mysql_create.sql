CREATE TABLE `animal` (
	`Animal_id` VARCHAR(255) NOT NULL,
	`kind` VARCHAR(255) NOT NULL,
	`number` INT NOT NULL AUTO_INCREMENT,
	`age` DECIMAL NOT NULL AUTO_INCREMENT,
	`healthy` BOOLEAN NOT NULL AUTO_INCREMENT,
	`Meal_id` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`weight` FLOAT NOT NULL,
	PRIMARY KEY (`Animal_id`)
);

CREATE TABLE `stuff` (
	`Stuff id` VARCHAR(255) NOT NULL,
	`WorkData id` VARCHAR(255) NOT NULL,
	`PersonalData id` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Stuff id`)
);

CREATE TABLE `meal` (
	`Meal_id` VARCHAR(255) NOT NULL,
	`kind` VARCHAR(255) NOT NULL,
	`all_amount` FLOAT NOT NULL,
	`Animal_id` VARCHAR(255) NOT NULL,
	`portion` FLOAT NOT NULL,
	`Budget_id` FLOAT NOT NULL,
	PRIMARY KEY (`Meal_id`)
);

CREATE TABLE `budget` (
	`Budget id` VARCHAR(255) NOT NULL,
	`money_cost` DECIMAL NOT NULL,
	PRIMARY KEY (`Budget id`)
);

CREATE TABLE `Personal data` (
	`PersonalData id` VARCHAR(255) NOT NULL,
	`full name` VARCHAR(255) NOT NULL,
	`age` INT NOT NULL,
	`phone number` VARCHAR(255) NOT NULL,
	`home address` VARCHAR(255) NOT NULL,
	`mail` VARCHAR(255) NOT NULL,
	`gender` VARCHAR(255) NOT NULL,
	`experience` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`PersonalData id`)
);

CREATE TABLE `work data` (
	`WorkData id` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`task` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`schedule` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	`Budget id` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`WorkData id`)
);

ALTER TABLE `animal` ADD CONSTRAINT `animal_fk0` FOREIGN KEY (`Meal_id`) REFERENCES `meal`(`Meal_id`);

ALTER TABLE `stuff` ADD CONSTRAINT `stuff_fk0` FOREIGN KEY (`WorkData id`) REFERENCES `work data`(`WorkData id`);

ALTER TABLE `stuff` ADD CONSTRAINT `stuff_fk1` FOREIGN KEY (`PersonalData id`) REFERENCES `Personal data`(`PersonalData id`);

ALTER TABLE `meal` ADD CONSTRAINT `meal_fk0` FOREIGN KEY (`Animal_id`) REFERENCES `animal`(`Animal_id`);

ALTER TABLE `meal` ADD CONSTRAINT `meal_fk1` FOREIGN KEY (`Budget_id`) REFERENCES `budget`(`Budget id`);

ALTER TABLE `work data` ADD CONSTRAINT `work data_fk0` FOREIGN KEY (`Budget id`) REFERENCES `budget`(`Budget id`);

