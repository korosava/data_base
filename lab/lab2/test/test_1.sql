#drop database `test_zoo`;
CREATE SCHEMA `test_zoo` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE `zoo`.`animal` (
  `animal_id` INT NOT NULL AUTO_INCREMENT,
  `kind` VARCHAR(128) NOT NULL,
  `age` FLOAT NOT NULL,
  `healthy` BINARY NOT NULL DEFAULT 1,
  `weight` FLOAT NOT NULL,
  PRIMARY KEY (animal_id)
  );

CREATE TABLE `zoo`.`meal` (
`meal_id` INT NOT NULL AUTO_INCREMENT,
`kind` VARCHAR(64) NOT NULL,
`age` FLOAT NOT NULL,
`healthy` BINARY NOT NULL DEFAULT 1,
`weight` FLOAT NOT NULL,
PRIMARY KEY (`meal_id`)
);

CREATE TABLE `zoo`.`feeding`(
`feed_id` INT NOT NULL AUTO_INCREMENT,
`animal_id` INT NOT NULL,
`meal_id` INT NOT NULL,
`portion` FLOAT NOT NULL,
`timing` TIME NOT NULL,
primary key (feed_id),

constraint animal_to_feed foreign key (animal_id)
references zoo.animal (animal_id) on delete cascade on update cascade,

constraint feed foreign key (meal_id)
references zoo.meal (meal_id) on delete cascade on update cascade
);

