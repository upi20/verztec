CREATE TABLE `books` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`author` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`file_full` VARCHAR(255) NOT NULL,
	`file_trial` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`tags` VARCHAR(255) NOT NULL,
	`total_page` VARCHAR(255) NOT NULL,
	`cover` VARCHAR(255) NOT NULL,
	`saved` int(11) NOT NULL,
	`liked` int(11) NOT NULL,
	`subscriber` int(11) NOT NULL,
	`seen` int(11) NOT NULL,
	PRIMARY KEY (`id`)
)


CREATE TABLE `videos` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`file_full` VARCHAR(255) NOT NULL,
	`file_trial` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`tags` VARCHAR(255) NOT NULL,
	`duration` int(11) NOT NULL,
	`cover` VARCHAR(255) NOT NULL,
	`saved` int(11) NOT NULL,
	`liked` int(11) NOT NULL,
	`subscriber` int(11) NOT NULL,
	`seen` int(11) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `audiobooks` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`author` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`file_full` VARCHAR(255) NOT NULL,
	`file_trial` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`tags` VARCHAR(255) NOT NULL,
	`total_page` VARCHAR(255) NOT NULL,
	`duration` int(11) NOT NULL,
	`cover` VARCHAR(255) NOT NULL,
	`saved` int(11) NOT NULL,
	`liked` int(11) NOT NULL,
	`subscriber` int(11) NOT NULL,
	`seen` int(11) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `podcast` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`speaker` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`file_full` VARCHAR(255) NOT NULL,
	`file_trial` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`tags` VARCHAR(255) NOT NULL,
	`total_page` VARCHAR(255) NOT NULL,
	`duration` int(11) NOT NULL,
	`cover` VARCHAR(255) NOT NULL,
	`saved` int(11) NOT NULL,
	`liked` int(11) NOT NULL,
	`subscriber` int(11) NOT NULL,
	`seen` int(11) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `article` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`author` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`file_full` VARCHAR(255) NOT NULL,
	`file_trial` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`tags` VARCHAR(255) NOT NULL,
	`cover` VARCHAR(255) NOT NULL,
	`saved` int(11) NOT NULL,
	`liked` int(11) NOT NULL,
	`subscriber` int(11) NOT NULL,
	`seen` int(11) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `transaction` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`transaction_id` VARCHAR(255) NOT NULL,
	`status` int(1) NOT NULL,
	`datetime` DATETIME NOT NULL,
	`member` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`amount` int(11) NOT NULL,
	`product` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `individual` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`status` int(1) NOT NULL,
	`date_of_birth` date NOT NULL,
	`place_of_birth` VARCHAR(255) NOT NULL,
	`church_name` VARCHAR(255) NOT NULL,
	`organization` VARCHAR(255) NOT NULL,
	`country` VARCHAR(255) NOT NULL,
	`gender` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`address` text NOT NULL,
	`city` text NOT NULL,
	`since` DATETIME NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`packet` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
)

CREATE TABLE `organization` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`church_name` VARCHAR(255) NOT NULL,
	`organization` VARCHAR(255) NOT NULL,
	`country` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(255) NOT NULL,
	`filled` int(11) NOT NULL,
	`max` int(11) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`address` text NOT NULL,
	`city` text NOT NULL,
	`since` DATETIME NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`packet` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
)