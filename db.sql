CREATE DATABASE IF NOT EXISTS devspace;
USE devspace;

CREATE TABLE IF NOT EXISTS profiles (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  profile_id smallint NOT NULL AUTO_INCREMENT,
  username varchar(50),
  slug varchar(100),
  fullname varchar(100),
  position varchar(150),
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

CREATE TABLE IF NOT EXISTS experiences (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  experience_id smallint NOT NULL AUTO_INCREMENT,
  user_id FOREIGN KEY REFERENCES profiles(id),
  experience_name varchar(200),
  slug varchar(200),
  center varchar(100),
  center_url varchar(200),
  center_icon varchar(200),
  experience_type ENUM('study', 'job'),
  date_started DATE,
  date_ended DATE,
  location varchar(100),
  job_type ENUM('onsite', 'remote', 'hybrid'),
  description varchar(2000)
  technologies varchar(50),
  projects varchar(50),
  categories varchar(50),
  language varchar(2)
);

CREATE TABLE IF NOT EXISTS projects (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  project_id smallint NOT NULL AUTO_INCREMENT,
  user_id FOREIGN KEY REFERENCES profiles(id),
  project_name varchar(200),
  slug varchar(200),
  description varchar(200),
  technologies varchar(50),
  categories varchar(50),
  web_url varchar(200),
  github_url varchar(400),
  github_api_url varchar(400),
  photo_url varchar(200),
  language varchar(2)
);

CREATE TABLE IF NOT EXISTS codesnippets(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codesnippet_id smallint NOT NULL AUTO_INCREMENT,
  description varchar(2000),
  code varchar(4000) NOT NULL,
  date_created DATE NOT NULL,
  project_id FOREIGN KEY REFERENCES projects(id),
  technologies varchar(50),
  categories varchar(50),
  language varchar(2)
);

CREATE TABLE IF NOT EXISTS social (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  social_name varchar(100),
  slug varchar(100),
  link varchar(200),
  icon_url varchar(200)
);

CREATE TABLE IF NOT EXISTS technologies (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  technology_name varchar(100),
  slug varchar(100),
  icon_url varchar(200)
);

CREATE TABLE IF NOT EXISTS categories (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  category_id int NOT NULL AUTO_INCREMENT,
  category_name varchar(400) NOT NULL,
  slug varchar(400),
  category_type varchar(200),
  language varchar(2)
);

CREATE TABLE IF NOT EXISTS languages (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  language_name varchar(100),
  slug varchar(100)
  iso varchar(2)
);

CREATE TABLE IF NOT EXISTS contacts (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  contact_name varchar(200),
  phone_code varchar(10)
  phone varchar(20),
  email varchar(100),
  company varchar(100),
  message varchar(4000),
  date_sended DATE
);

CREATE TABLE IF NOT EXISTS articles (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  article_id int NOT NULL AUTO_INCREMENT,
  title varchar(400) NOT NULL,
  notion_api varchar(500),
  language varchar(2)
);