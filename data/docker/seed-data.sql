INSERT INTO svm.user (auth0_id, email, first_name, last_name, country) VALUES 
 ('auth0|636ea5c3c10638717037b23d', 'pat.smith@example.com', 'Patricia', 'Smith', 'United States'),
 ('auth0|636ea701f266b3ae82accffa', 'tom.harris@example.com', 'Tom', 'Harris', 'Canada');

 INSERT INTO svm.lkp_roles (name) VALUES
  ('Creator'),
  ('Taker');

 INSERT INTO svm.user_roles (user_id, role) VALUES
  ('auth0|636ea5c3c10638717037b23d', 1),
  ('auth0|636ea701f266b3ae82accffa', 2);

INSERT INTO svm.survey (creator_id, survey_title, survey_short_description) VALUES 
 ('auth0|636ea5c3c10638717037b23d', 'Cereal Survey', '5 questions about breakfast cereals');

INSERT INTO svm.lkp_question_type (description) VALUES
 ('short text'),
 ('long text'),
 ('single select'),
 ('multi select'),
 ('interval scale');

INSERT INTO svm.question (survey_id, question_type, question_text) VALUES
 (1, 3, 'How often do you eat breakfast cereal?'),
 (1, 4, 'Which of the following breakfast cereals do you like? Select all that apply.'),
 (1, 5, 'On a scale of 1 to 5, with 1 being "Never" and 5 being "Always", how often do you put milk in your cereal?'),
 (1, 1, 'In one word, describe how eating breakfast cereal makes you feel.'),
 (1, 2, 'Explain why you like or dislike breakfast cereals.');

INSERT INTO svm.response (question_id, response_text, response_value) VALUES
 (1, 'Every day', null),
 (1, 'At least once weekly', null),
 (1, 'Less than weekly', null),
 (1, 'Never', null),
 (2, 'Cheerios', null),
 (2, 'Frosted Flakes', null),
 (2, 'Lucky Charms', null),
 (2, 'Fruity Pebbles', null),
 (2, 'Bran Flakes', null),
 (2, 'None of the above', null),
 (3, null, 1), (3, null, 2), (3, null, 3), (3, null, 4), (3, null, 5);

INSERT INTO svm.user_survey (survey_id, user_id) VALUES
 (1, 'auth0|636ea701f266b3ae82accffa');

INSERT INTO svm.user_response (user_survey_id, question_id, selected_response) VALUES
 (1, 1, 2),
 (1, 2, 5),
 (1, 2, 9),
 (1, 3, 15);

INSERT INTO svm.user_response (user_survey_id, question_id, user_response_text) VALUES
 (1, 4, 'Full'),
 (1, 5, 'I like cereals because they are quick and easy.');

-- SELECT ur.user_response_text, r.response_text, r.response_value, q.question_text
-- FROM svm.user_response ur
--  LEFT OUTER JOIN svm.response r ON ur.selected_response = r.response_id
--  LEFT OUTER JOIN svm.question q ON ur.question_id = q.question_id;