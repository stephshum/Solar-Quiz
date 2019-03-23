CREATE TABLE `photos` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`file_name`	TEXT NOT NULL,
	`file_ext`	TEXT NOT NULL,
	`alt_text`	TEXT NOT NULL
);

CREATE TABLE `questions` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`question`	TEXT NOT NULL,
	`answer`	TEXT NOT NULL
);

CREATE TABLE `pages` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`question_id`	INTEGER NOT NULL,
	`photo_id`	INTEGER NOT NULL
);

INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_1.png', 'png', 'Snowy Scene');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_2.png', 'png', 'Solar Panels');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_3.png', 'png', 'Notebook with Money Sign');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_4.png', 'png', 'Potted Plant');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_5.png', 'png', 'Assorted Tools');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_6.png', 'png', 'Roof Shingles');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('quiz_7.png', 'png', 'Downward Tilted Arrow');


INSERT INTO questions (question, answer) VALUES ('Tomkins County is too cloudy and snowy for solar to work', 'Myth');
INSERT INTO questions (question, answer) VALUES ('I can use solar panels to power air conditioning, hot water heaters, and everything else that natural gas, electricity, and oil fuels', 'Fact');
INSERT INTO questions (question, answer) VALUES ('Solar panels are too expensive', 'Myth');
INSERT INTO questions (question, answer) VALUES ('Solar produces no pollution, making it one of the cleanest energy sources', 'Fact');
INSERT INTO questions (question, answer) VALUES ('Solar panels require regular maintenance and will lower the value of my home', 'Myth');
INSERT INTO questions (question, answer) VALUES ('Installing solar panels will put holes in my roof and cause roof damage', 'Myth');
INSERT INTO questions (question, answer) VALUES ('Solar panel costs have dropped 80% since 2008', 'Fact');

INSERT INTO pages (question_id, photo_id) VALUES (1,1);
INSERT INTO pages (question_id, photo_id) VALUES (2,2);
INSERT INTO pages (question_id, photo_id) VALUES (3,3);
INSERT INTO pages (question_id, photo_id) VALUES (4,4);
INSERT INTO pages (question_id, photo_id) VALUES (5,5);
INSERT INTO pages (question_id, photo_id) VALUES (6,6);
INSERT INTO pages (question_id, photo_id) VALUES (7,7);
