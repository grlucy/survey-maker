CREATE SCHEMA IF NOT EXISTS svm;

CREATE TABLE IF NOT EXISTS svm.user (
 user_id SERIAL PRIMARY KEY,
 -- role_id taker/creator
 email TEXT NOT NULL,
 first_name VARCHAR(30),
 last_name VARCHAR(50),
 date_of_birth DATE,
 country TEXT,
 race TEXT,
 gender TEXT,
 marital_status TEXT,
 education_level TEXT,
 income_level TEXT,
 number_of_children INTEGER
);

CREATE TABLE IF NOT EXISTS svm.survey (
 survey_id SERIAL PRIMARY KEY,
 creator_id INTEGER NOT NULL REFERENCES svm.user(user_id),
 survey_title VARCHAR(100) NOT NULL,
 survey_short_description VARCHAR(200),
 survey_long_description TEXT
);

CREATE TABLE IF NOT EXISTS svm.user_survey (
 user_survey_id SERIAL PRIMARY KEY,
 survey_id INTEGER NOT NULL REFERENCES svm.survey(survey_id),
 user_id INTEGER NOT NULL REFERENCES svm.user(user_id) 
);

CREATE TABLE IF NOT EXISTS svm.lkp_question_type (
 question_type_id SERIAL PRIMARY KEY,
 description VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS svm.question (
 question_id SERIAL PRIMARY KEY,
 survey_id INTEGER NOT NULL REFERENCES svm.survey(survey_id),
 question_type INTEGER NOT NULL REFERENCES svm.lkp_question_type(question_type_id),
 question_text TEXT NOT NULL
 -- image_ref
);

CREATE TABLE IF NOT EXISTS svm.response (
 response_id SERIAL PRIMARY KEY,
 question_id INTEGER NOT NULL REFERENCES svm.question(question_id),
 response_text TEXT,
 response_value NUMERIC
 -- image_ref
);

CREATE TABLE IF NOT EXISTS svm.user_response (
 user_response_id SERIAL PRIMARY KEY,
 user_survey_id INTEGER NOT NULL REFERENCES svm.user_survey(user_survey_id),
 question_id INTEGER NOT NULL REFERENCES svm.question(question_id),
 selected_response INTEGER REFERENCES svm.response(response_id),
 user_response_text TEXT
);