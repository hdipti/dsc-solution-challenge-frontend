CREATE SCHEMA `sc2021` ;

drop table sc2021.author;
drop table sc2021.post;
drop table sc2021.comment;
drop table sc2021.candidate;
drop table sc2021.login;

CREATE TABLE IF NOT EXISTS sc2021.`author` (
  `author_Id` INT UNSIGNED unsigned NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`author_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS sc2021.`post` (
  `post_Id` INT UNSIGNED unsigned NOT NULL AUTO_INCREMENT,
  `author_Id` INT UNSIGNED unsigned NOT NULL,
  `post_date` datetime NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'draft',
  `post_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_Id`),
  CONSTRAINT fk_author_Id
    FOREIGN KEY (`author_Id` ) 
        REFERENCES `author` (`author_Id` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS sc2021.`comment` (
  `comment_Id` INT UNSIGNED unsigned NOT NULL AUTO_INCREMENT,
  `post_Id` INT UNSIGNED unsigned NOT NULL,
  `comment_count` INT UNSIGNED unsigned NOT NULL,
  `comment_author` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_date` datetime NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `like_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`comment_Id`),
  CONSTRAINT fk_post_Id
  FOREIGN KEY (`post_Id`) 
	REFERENCES `post`(`post_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS sc2021.`candidate` (
  `candidate_Id` INT UNSIGNED unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`candidate_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS sc2021.`login` (
  `login_Id` INT UNSIGNED unsigned NOT NULL AUTO_INCREMENT,
  `candidate_Id` INT UNSIGNED unsigned NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`login_Id`),
  CONSTRAINT fk_candidate_Id
  FOREIGN KEY (`candidate_Id`) 
	REFERENCES `candidate`(`candidate_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


