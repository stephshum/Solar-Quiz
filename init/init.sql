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


INSERT INTO quizzes (name) VALUES ('DIY');
INSERT INTO quizzes (name) VALUES ('insulation');
INSERT INTO quizzes (name) VALUES ('lighting');
INSERT INTO quizzes (name) VALUES ('renewableheating');
INSERT INTO quizzes (name) VALUES ('solar');
INSERT INTO quizzes (name) VALUES ('windows');


INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY1.png', 'png', 'House in winter environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY2.png', 'png', 'Worker installing insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY3.png', 'png', 'Home-owner reviewing and paying energy bills');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY4.png', 'png', 'Worker installing spray foam insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY5.png', 'png', 'Home-owner meditating in a room that is sound-protected by insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY6.png', 'png', 'Bulk quantities of commercial insulation, pre-installed');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY7.png', 'png', 'Samples of a variety of insulation types');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY8.png', 'png', 'Home in a healthy natural environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY9.png', 'png', 'Exposed fiberglass insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('DIY10.png', 'png', 'Insulation with a vapor barrier');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation1.png', 'png', 'House in winter environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation2.png', 'png', 'Worker installing insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation3.png', 'png', 'Home-owner reviewing and paying energy bills');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation4.png', 'png', 'Worker installing spray foam insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation5.png', 'png', 'Home-owner meditating in a room that is sound-protected by insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation6.png', 'png', 'Bulk quantities of commercial insulation, pre-installed');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation7.png', 'png', 'Samples of a variety of insulation types');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation8.png', 'png', 'Home in a healthy natural environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation9.png', 'png', 'Exposed fiberglass insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('insulation10.png', 'png', 'Insulation with a vapor barrier');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting1.png', 'png', 'Incandescent light bulb');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting2.png', 'png', 'Home-owner operating a dimming switch for their in-home lighting fixtures');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting3.png', 'png', 'Trash bin full of old light bulbs');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting4.png', 'png', 'Close-up of hot incandescent filament');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting5.png', 'png', 'Droplets of liquid mercury');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting6.png', 'png', 'LED light bulb in a home');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting7.png', 'png', 'CFL light bulb in a person’s hand');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting8.png', 'png', 'CFL light bulb in a person’s hand');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting9.png', 'png', 'Filament of an incandescent light bulb');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('lighting10.png', 'png', 'LED light bulb in a home');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating1.png', 'png', 'Person in home heated by a heat pump');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating2.png', 'png', 'Power cord');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating3.png', 'png', 'Home heated by fire-place');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating4.png', 'png', 'Heat pump in home-owners bedroom');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating5.png', 'png', 'Home-owner adjusting home thermostat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating6.png', 'png', 'Home-owner adjusting home thermostat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating7.png', 'png', 'Home heat pump unit outside in nice weather');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating8.png', 'png', 'Home-owner reviewing and paying energy bills');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating9.png', 'png', 'Outdoor heat pump unit in winter weather');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('renewableheating10.png', 'png', 'Home-owners bothered by loud sound');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar1.png', 'png', 'Snowy Scene');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar2.png', 'png', 'Solar Panels');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar3.png', 'png', 'Notebook with Money Sign');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar4.png', 'png', 'Potted Plant');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar5.png', 'png', 'Assorted Tools');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar6.png', 'png', 'Roof Shingles');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('solar7.png', 'png', 'Downward Tilted Arrow');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows1.png', 'png', 'Thermal imager showing heat loss through windows');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows2.png', 'png', 'Workers installing a new window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows3.png', 'png', 'Home-owner caulking the edges of their home window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows4.png', 'png', 'Light coming through a bedroom window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows5.png', 'png', 'Cellular shades installed in a home kitchen');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows6.png', 'png', 'Workers installing a new window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows7.png', 'png', 'Home wooden-window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows8.png', 'png', 'Diagram of different R-Values for different window types');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows9.png', 'png', 'Installation of double-glazed window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('windows10.png', 'png', 'Old home window');




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
