CREATE DATABASE IF NOT EXISTS devspace;
USE devspace;

CREATE TABLE IF NOT EXISTS profiles (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  profile_id int NOT NULL AUTO_INCREMENT,
  username varchar(50),
  slug varchar(100),
  fullname varchar(100),
  position varchar(200),
  description varchar(2000),
  social_media varchar(50),
  photo varchar(200),
  cv varchar(200),
  preferred_technologies varchar(50),
  skills varchar(50),
  phone varchar(9),
  email varchar(100),
  language varchar(2),
);