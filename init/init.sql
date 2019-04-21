CREATE TABLE `photos` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`file_name`	TEXT NOT NULL,
	`file_ext`	TEXT NOT NULL,
	`alt_text`	TEXT NOT NULL
);

CREATE TABLE `questions` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`question`	TEXT NOT NULL,
	`answer`	TEXT NOT NULL,
	`feedback`	TEXT NOT NULL
);

CREATE TABLE `pages` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`question_id`	INTEGER NOT NULL,
	`photo_id`	INTEGER NOT NULL,
	`quiz_id`	INTEGER NOT NULL
);

CREATE TABLE `quizzes` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`name`	TEXT NOT NULL UNIQUE
);

INSERT INTO quizzes (name) VALUES ('solar');
INSERT INTO quizzes (name) VALUES ('thermal');
INSERT INTO quizzes (name) VALUES ('lighting');
INSERT INTO quizzes (name) VALUES ('window');
INSERT INTO quizzes (name) VALUES ('heating');



INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('1.png', 'png', 'Snowy Scene');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('2.png', 'png', 'Solar Panels');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('3.png', 'png', 'Notebook with Money Sign');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('4.png', 'png', 'Potted Plant');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('5.png', 'png', 'Assorted Tools');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('6.png', 'png', 'Roof Shingles');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('7.png', 'png', 'Downward Tilted Arrow');


INSERT INTO questions (question, answer, feedback) VALUES ('Tomkins County is too cloudy and snowy for solar to work', 'myth', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('I can use solar panels to power air conditioning, hot water heaters, and everything else that natural gas, electricity, and oil fuels', 'fact', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panels are too expensive', 'myth', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar produces no pollution, making it one of the cleanest energy sources', 'fact', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panels require regular maintenance and will lower the value of my home', 'myth', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('Installing solar panels will put holes in my roof and cause roof damage', 'myth', 'Yeah!');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panel costs have dropped 80% since 2008', 'fact', 'Yeah!');

INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (1,1,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (2,2,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (3,3,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (4,4,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (5,5,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (6,6,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (7,7,4);
