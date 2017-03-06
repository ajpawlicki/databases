DROP DATABASE IF EXISTS chat;

CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  id int NOT NULL AUTO_INCREMENT,
  userid int NOT NULL,
  text varchar(200) NOT NULL,
  roomid int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(40) NOT NULL,
  PRIMARY KEY (id)
);
    
CREATE TABLE rooms (
  id int NOT NULL AUTO_INCREMENT,
  roomname VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

-- foreign keys

ALTER TABLE messages ADD FOREIGN KEY (userid) REFERENCES users (id);
ALTER TABLE messages ADD FOREIGN KEY (roomid) REFERENCES rooms (id);

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

/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

