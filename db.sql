CREATE DATABASE IF NOT EXISTS devspace;
USE devspace;

-- LANGUAGES
CREATE TABLE IF NOT EXISTS languages (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  language_name varchar(100),
  slug varchar(100),
  iso varchar(2)
);

-- CATEGORIES
CREATE TABLE IF NOT EXISTS category_types (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
);

CREATE TABLE IF NOT EXISTS category_types_translations (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  category_type FOREIGN KEY REFERENCES category_types(id),
  category_name varchar(400) NOT NULL,
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS categories (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  category_type FOREIGN KEY REFERENCES category_types(id)
);

CREATE TABLE IF NOT EXISTS category_translations (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  category_id FOREIGN KEY REFERENCES categories(id),
  category_name varchar(400) NOT NULL,
  slug varchar(400),
  language FOREIGN KEY REFERENCES languages(id)
);

-- SOCIAL
CREATE TABLE IF NOT EXISTS social (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  social_name varchar(100),
  slug varchar(100),
  link varchar(200),
  icon varchar(200)
);

-- TECHNOLOGIES
CREATE TABLE IF NOT EXISTS technologies (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  technology_name varchar(100),
  slug varchar(100),
  link varchar(200),
  icon varchar(200)
);

-- PROFILES
CREATE TABLE IF NOT EXISTS profiles (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  username varchar(50),
  slug varchar(100),
  fullname varchar(100),
  social_media varchar(50),
  photo varchar(200),
  phone_code varchar(10),
  phone varchar(20),
  email varchar(100),
);

CREATE TABLE IF NOT EXISTS profile_translations (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  profile_id FOREIGN KEY REFERENCES profiles(id),
  position varchar(150),
  profile_details varchar(4000),
  cv varchar(200),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS profile_categories(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  profile_id FOREIGN KEY REFERENCES profiles(id),
  category_id FOREIGN KEY REFERENCES categories(id),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS profile_technologies(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  profile_id FOREIGN KEY REFERENCES profiles(id),
  technology_id FOREIGN KEY REFERENCES technologies(id)
);

-- PROJECTS
CREATE TABLE IF NOT EXISTS projects (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id FOREIGN KEY REFERENCES profiles(id),
  web_url varchar(200),
  github_url varchar(400),
  github_api_url varchar(400),
  photo_url varchar(200),
);

CREATE TABLE IF NOT EXISTS project_translations (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  project_id FOREIGN KEY REFERENCES projects(id),
  project_name varchar(200),
  slug varchar(200),
  project_details varchar(4000),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS project_categories(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  project_id FOREIGN KEY REFERENCES projects(id),
  category_id FOREIGN KEY REFERENCES categories(id),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS project_technologies (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  project_id FOREIGN KEY REFERENCES projects(id),
  technology_id FOREIGN KEY REFERENCES technologies(id)
);

-- EXPERIENCES
CREATE TABLE IF NOT EXISTS experiences (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id FOREIGN KEY REFERENCES profiles(id),
  center varchar(100),
  center_url varchar(200),
  center_icon varchar(200),
  experience_type ENUM('study', 'job'),
  date_started DATE,
  date_ended DATE,
  experience_location varchar(100),
  job_type ENUM('onsite', 'remote', 'hybrid'),
);

CREATE TABLE IF NOT EXISTS experience_translations (
  id smallint PRIMARY KEY NOT NULL AUTO_INCREMENT,
  experience_id FOREIGN KEY REFERENCES experiences(id),
  experience_name varchar(200),
  slug varchar(200),
  experience_details varchar(4000),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS experience_categories(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  experience_id FOREIGN KEY REFERENCES experiences(id),
  category_id FOREIGN KEY REFERENCES categories(id),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS experience_technologies (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  experience_id FOREIGN KEY REFERENCES experiences(id),
  technology_id FOREIGN KEY REFERENCES technologies(id),
);

CREATE TABLE IF NOT EXISTS experience_projects (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  experience_id FOREIGN KEY REFERENCES experiences(id),
  project_id FOREIGN KEY REFERENCES projects(id),
);

-- CODESNIPPETS
CREATE TABLE IF NOT EXISTS codesnippets(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codesnippet_id smallint NOT NULL AUTO_INCREMENT,
  code varchar(4000) NOT NULL,
  date_created DATE NOT NULL,
  project_id FOREIGN KEY REFERENCES projects(id)
);

CREATE TABLE IF NOT EXISTS codesnippet_translations(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codesnippet_id FOREIGN KEY REFERENCES codesnippets(id),
  code_details varchar(4000),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS codesnippet_categories(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codesnippet_id FOREIGN KEY REFERENCES codesnippets(id),
  category_id FOREIGN KEY REFERENCES categories(id),
  language FOREIGN KEY REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS codesnippet_technologies (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codesnippet_id FOREIGN KEY REFERENCES codesnippets(id),
  technology_id FOREIGN KEY REFERENCES technologies(id),
);

-- CONTACTS
CREATE TABLE IF NOT EXISTS contacts (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  contact_name varchar(200),
  phone_code varchar(10),
  phone varchar(20),
  email varchar(100),
  company varchar(100),
  contact_message varchar(4000),
  date_sended DATE
);

-- ARTICLES
CREATE TABLE IF NOT EXISTS articles (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  article_id int NOT NULL AUTO_INCREMENT,
  title varchar(400) NOT NULL,
  notion_api varchar(500),
  language FOREIGN KEY REFERENCES languages(id)
);