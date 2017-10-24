INSERT INTO word_form (id, description) VALUES
  ('N', 'noun'),
  ('V', 'verb');

INSERT INTO translation_direction (id, description) VALUES
  ('ENG_RUS', 'from english to russian language'),
  ('RUS_ENG', 'from russian to english');

INSERT INTO word (id, form_id, rate, direction, word, translation, example) VALUES
  (1, 'N', 1, 'ENG_RUS', 'cat', 'кот', 'I like a cat'),
  (2, 'N', 1, 'ENG_RUS', 'dog', 'собака', 'I hate dogs'),
  (3, 'N', 2, 'ENG_RUS', 'crocodile', 'крокодил', 'Please, buy me that crocodile'),
  (4, 'N', 2, 'ENG_RUS', 'vibration', 'вибрация', 'Amazing vibration'),
  (5, 'V', 1, 'ENG_RUS', 'to walk', 'ходить', 'To walk is good'),
  (6, 'V', 1, 'ENG_RUS', 'to talk', 'говорить;разговаривать;болтать', 'To talk is sucks'),
  (7, 'V', 2, 'ENG_RUS', 'to accelerate', 'ускоряться', 'Accelerate that old crap'),
  (8, 'N', 1, 'RUS_ENG', 'молоко', 'milk', null),
  (9, 'N', 1, 'RUS_ENG', 'деревня', 'vilage', NULL ),
  (10, 'N', 1, 'RUS_ENG', 'спорт', 'sport', NULL ),
  (11, 'N', 1, 'RUS_ENG', 'машина', 'car', 'Машина должна машинить');

INSERT INTO customer (id, login, password) VALUES
  (1, 'admin', '123'),
  (2, 'user1', '123');

INSERT INTO schedule (id, is_active, cron) VALUES
  (1, TRUE, '* * * * 1'),
  (2, TRUE, '* * * * 2'),
  (3, FALSE, '* * * * 3');

INSERT INTO lesson (id, customer_id, schedule_id, title, is_enabled, is_completed) VALUES
  (1, 1, 1, 'admin lesson 1', TRUE, FALSE),
  (2, 1, 1, 'admin lesson 2', TRUE, TRUE),
  (3, 2, 1, 'my lesson 1', TRUE, FALSE),
  (4, 2, 2, 'my lesson 2', TRUE, FALSE),
  (5, 2, 2, 'my lesson 3', TRUE, FALSE),
  (6, 2, 1, 'my lesson 4', FALSE, TRUE);

INSERT INTO lesson_word_map (lesson_id, word_id, is_asked, is_ok) VALUES
  (1, 1, TRUE, TRUE),
  (1, 2, TRUE, TRUE),
  (1, 3, TRUE, FALSE),
  (1, 4, TRUE, FALSE),
  (1, 5, FALSE, NULL),
  (1, 6, FALSE, NULL),
  (1, 7, FALSE, NULL),
  (2, 3, TRUE, FALSE),
  (2, 4, TRUE, FALSE),
  (2, 7, TRUE, FALSE),
  (3, 1, TRUE, FALSE),
  (3, 2, TRUE, FALSE),
  (3, 3, TRUE, TRUE),
  (3, 4, TRUE, TRUE),
  (4, 5, TRUE, TRUE),
  (4, 6, TRUE, TRUE),
  (4, 7, TRUE, TRUE),
  (5, 8, FALSE, NULL),
  (5, 9, FALSE, NULL),
  (5, 10, FALSE, NULL),
  (5, 11, FALSE, NULL),
  (6, 4, TRUE, TRUE);






