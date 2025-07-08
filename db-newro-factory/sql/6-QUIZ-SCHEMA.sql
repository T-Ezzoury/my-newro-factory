-- ===================================
-- USER MANAGEMENT SCHEMA
-- ===================================
USE `newro-factory-db`;
SELECT 'Creating quiz table...' AS message;

-- Création de la table user avec les champs demandés
CREATE TABLE `quiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE `quiz_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `question_id` int NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_quiz_fk` (`quiz_id`),
  KEY `quiz_question_question_fk` (`question_id`),
  CONSTRAINT `quiz_question_quiz_fk` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_question_question_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE
);
