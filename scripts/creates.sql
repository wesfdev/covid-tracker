CREATE DATABASE covid_tracker;

-- GENERICS
CREATE TABLE covid_tracker.city(
   dbid BIGINT(20)  NOT NULL AUTO_INCREMENT,
   adminCode  VARCHAR(10),
   population BIGINT(20)  NOT NULL,
   name       VARCHAR(50) NOT NULL,
   cityId     BIGINT(20),
   isCapital  tinyint(1),
   latitude   VARCHAR(20) NOT NULL,
   longitude  VARCHAR(20) NOT NULL,
   PRIMARY KEY (dbid)
);


CREATE TABLE covid_tracker.value_list (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  discriminator varchar(100) NOT NULL,
  name varchar(200) NOT NULL,
  description varchar(500) DEFAULT NULL,
  PRIMARY KEY (dbid)
);

CREATE TABLE covid_tracker.observations  (
   dbid BIGINT(20)  NOT NULL AUTO_INCREMENT,
   description  VARCHAR(3000),
   category BIGINT(20) NOT NULL,
   type_condition BIGINT(20),
   initial_probability BIGINT(20),
   final_probability_range BIGINT(20),   
   status  BIGINT(20) NOT NULL,
   PRIMARY KEY (dbid),
   CONSTRAINT observations_category_fk FOREIGN KEY (category) REFERENCES value_list (dbid),
   CONSTRAINT observations_type_condition_fk FOREIGN KEY (type_condition) REFERENCES value_list (dbid),
   CONSTRAINT observations_status_fk FOREIGN KEY (status) REFERENCES value_list (dbid)
);

CREATE TABLE covid_tracker.person (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  last_name varchar(100) DEFAULT NULL,
  dpi bigint(15) DEFAULT NULL,
  birthdate date DEFAULT NULL,
  age bigint(3) DEFAULT NULL,  
  gender bigint(20) DEFAULT NULL,
  mobile bigint(20) DEFAULT NULL,
  phone bigint(20) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  PRIMARY KEY (dbid)
);



-- diagnostics --
CREATE TABLE covid_tracker.symptom (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  description varchar(100),
  category BIGINT(20) NOT NULL, 
  PRIMARY KEY (dbid),
  CONSTRAINT symptom_category_fk FOREIGN KEY (category) REFERENCES value_list (dbid)
);

CREATE TABLE covid_tracker.symptom_response (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  description varchar(100),
  response BIGINT(20) NOT NULL,
  weighing BIGINT(10) DEFAULT 0 NOT NULL,
  symptom bigint(20) NOT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT symptom_response_symptom_fk FOREIGN KEY (symptom) REFERENCES symptom (dbid),
  CONSTRAINT symptom_response_response_fk FOREIGN KEY (response) REFERENCES value_list (dbid)
);

CREATE TABLE covid_tracker.diagnostic (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  person bigint(20) NOT NULL,
  observations varchar(2000) DEFAULT NULL,
  creation_date datetime DEFAULT NULL,
  city bigint(20) NOT NULL,
  status bigint(20) NOT NULL,  
  token varchar(100) NOT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT diagnostic_person_fk FOREIGN KEY (person) REFERENCES person (dbid),
  CONSTRAINT diagnostic_status_fk FOREIGN KEY (status) REFERENCES value_list (dbid),
  CONSTRAINT diagnostic_city_fk FOREIGN KEY (city) REFERENCES city (dbid)
);

CREATE TABLE covid_tracker.patient_condition (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  diagnostic bigint(20) NOT NULL,
  type_job bigint(20) NOT NULL,
  type_contact_work bigint(20) NOT NULL,
  risk_area tinyint(1) NOT NULL,
  positive_person_contact tinyint(1) NOT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT patient_condition_type_job_fk FOREIGN KEY (type_job) REFERENCES value_list (dbid),
  CONSTRAINT patient_condition_type_contact_work_fk FOREIGN KEY (type_contact_work) REFERENCES value_list (dbid),
  CONSTRAINT patient_condition_diagnostic_fk FOREIGN KEY (diagnostic) REFERENCES diagnostic (dbid)
);

CREATE TABLE covid_tracker.diagnostic_detail (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  diagnostic bigint(20) NOT NULL,
  symptom_response bigint(20) NOT NULL,
  observations varchar(2000) DEFAULT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT diagnostic_detail_symptom_response_fk FOREIGN KEY (symptom_response) REFERENCES symptom_response (dbid),
  CONSTRAINT diagnostic_detail_diagnostic_fk FOREIGN KEY (diagnostic) REFERENCES diagnostic (dbid)
);




-- helpme --

CREATE TABLE covid_tracker.help (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  person bigint(20) NOT NULL,
  help_type bigint(20) NOT NULL,
  latitude   VARCHAR(20) NOT NULL,
  longitude  VARCHAR(20) NOT NULL,
  creation_date datetime DEFAULT NULL,
  status bigint(20) NOT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT help_person_fk FOREIGN KEY (person) REFERENCES person (dbid),
  CONSTRAINT help_help_type_fk FOREIGN KEY (help_type) REFERENCES value_list (dbid),
  CONSTRAINT help_status_fk FOREIGN KEY (status) REFERENCES value_list (dbid)
);

CREATE TABLE covid_tracker.help_request (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  helper bigint(20) NOT NULL,
  needy bigint(20) NOT NULL,
  status bigint(20) NOT NULL,
  creation_date datetime DEFAULT NULL,
  finish_date datetime DEFAULT NULL,
  qualification  bigint(5) DEFAULT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT help_request_helper_fk FOREIGN KEY (helper) REFERENCES help (dbid),
  CONSTRAINT help_request_needy_fk FOREIGN KEY (needy) REFERENCES help (dbid),
  CONSTRAINT help_request_status_fk FOREIGN KEY (status) REFERENCES value_list (dbid)
);


CREATE TABLE covid_tracker.help_detail (
  dbid bigint(20) NOT NULL AUTO_INCREMENT,
  help bigint(20) NOT NULL,
  service_type bigint(20) NOT NULL,
  description varchar(2000) DEFAULT NULL,
  status bigint(20) NOT NULL,
  PRIMARY KEY (dbid),
  CONSTRAINT help_detail_service_type_fk FOREIGN KEY (service_type) REFERENCES value_list (dbid),
  CONSTRAINT help_detail_help_fk FOREIGN KEY (help) REFERENCES help (dbid),
  CONSTRAINT help_detail_status_fk FOREIGN KEY (status) REFERENCES value_list (dbid)
);

select * from covid_tracker.patient_condition;


