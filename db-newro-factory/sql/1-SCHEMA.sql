drop schema if exists `newro-factory-db`;
  create schema if not exists `newro-factory-db`;
  use `newro-factory-db`;

  drop table if exists intern;
  drop table if exists promotion;
  drop table if exists question;
  drop table if exists answer;
  drop table if exists chapter;

  create table promotion (
    id                        bigint not null auto_increment,
    name                      varchar(255),
    constraint pk_promotion primary key (id))
  ;

  create table intern (
    id                        bigint not null auto_increment,
    first_name                      varchar(255),
    last_name                      varchar(255),
    arrival                timestamp NULL,
    formation_over              timestamp NULL,
    promotion_id                bigint default NULL,
    constraint pk_intern primary key (id))
  ;

  alter table intern add constraint fk_intern_promotion_1 foreign key (promotion_id) references promotion (id) on delete restrict on update restrict;
  create index ix_intern_promotion_1 on intern (promotion_id);

 CREATE TABLE `chapter` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(500) NOT NULL,
	`parent_path` varchar(500) NOT NULL DEFAULT '/',
	PRIMARY KEY (`id`)
);

CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `statement` text NOT NULL,
  `chapter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`)
);

CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(1) NOT NULL,
  `text` varchar(500) NOT NULL,
  `valid_answer` tinyint(1) NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ANSWER_ibfk_1_idx` (`question_id`),
  CONSTRAINT `ANSWER_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
);
