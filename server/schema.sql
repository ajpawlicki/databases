DROP DATABASE IF EXISTS chat;

CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS `Users`;
    
CREATE TABLE `Users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Username` VARCHAR(15) NULL DEFAULT NULL,
  `id_User_User` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Usernames stored by User ID';

-- ---
-- Table 'Messages'
-- Chronological sorting of messages with message ID, corresponding user ID, and room ID in which message was posted.
-- ---

DROP TABLE IF EXISTS `Messages`;
    
CREATE TABLE `Messages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Message` VARCHAR(140) NULL DEFAULT NULL,
  `UserID` INTEGER NULL DEFAULT NULL,
  `RoomID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Chronological sorting of messages with message ID, correspon';

-- ---
-- Table 'Rooms'
-- 
-- ---

DROP TABLE IF EXISTS `Rooms`;
    
CREATE TABLE `Rooms` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'User_User'
-- Friendships between users
-- ---

DROP TABLE IF EXISTS `User_User`;
    
CREATE TABLE `User_User` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `User ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Friendships between users';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Users` ADD FOREIGN KEY (id_User_User) REFERENCES `User_User` (`id`);
ALTER TABLE `Users` ADD FOREIGN KEY (id_User_User) REFERENCES `User_User` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (UserID) REFERENCES `Users` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (RoomID) REFERENCES `Rooms` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `User_User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`Username`,`id_User_User`,`id_User_User`) VALUES
-- ('','','','');
-- INSERT INTO `Messages` (`id`,`Message`,`User ID`,`Room ID`,`id_Users`,`id_Rooms`) VALUES
-- ('','','','','','');
-- INSERT INTO `Rooms` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `User_User` (`id`,`User ID`,`User ID`) VALUES
-- ('','','');

-- CREATE DATABASE IF NOT EXISTS chat;

-- USE chat;



-- CREATE TABLE users (
--   id INT AUTO_INCREMENT,
--   username VARCHAR(20),
--   PRIMARY KEY (id)
-- );

-- CREATE TABLE rooms (
--   id INT AUTO_INCREMENT,
--   roomname VARCHAR (20),
--   createdAt date,
--   PRIMARY KEY (id)
-- );

-- CREATE TABLE messages (
--   /* Describe your table here.*/
--   id INT NOT NULL AUTO_INCREMENT,
--   user VARCHAR(255),
--   message VARCHAR(255),
--   roomname VARCHAR(255),
--   createdAt datetime,

--   PRIMARY KEY (id),
--   FOREIGN KEY (user)
--   REFERENCES users(id),
--   FOREIGN KEY (roomname)
--   REFERENCES rooms(id)
-- );

-- CREATE TABLE user_user (
--   id INT AUTO_INCREMENT,
--   user_ID INT,
--   friend_ID INT,

--   PRIMARY KEY (id),
--   FOREIGN KEY (user_id) 
--   REFERENCES users(id),
--   FOREIGN KEY (friend_ID) 
--   REFERENCES users(id)
-- );


/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

