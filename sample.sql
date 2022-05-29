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