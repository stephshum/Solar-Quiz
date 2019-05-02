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
INSERT INTO quizzes (name) VALUES ('insulation');
INSERT INTO quizzes (name) VALUES ('lighting');
INSERT INTO quizzes (name) VALUES ('heating');
INSERT INTO quizzes (name) VALUES ('solar');
INSERT INTO quizzes (name) VALUES ('windows');

INSERT INTO quizzes (name) VALUES ('DIY');


INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('1.jpg', 'jpg', 'House in winter environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('2.jpg', 'jpg', 'Worker installing insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('3.jpg', 'jpg', 'Home-owner reviewing and paying energy bills');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('4.jpg', 'jpg', 'Worker installing spray foam insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('5.jpg', 'jpg', 'Home-owner meditating in a room that is sound-protected by insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('6.jpg', 'jpg', 'Bulk quantities of commercial insulation, pre-installed');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('7.jpg', 'jpg', 'Samples of a variety of insulation types');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('8.jpg', 'jpg', 'Home in a healthy natural environment');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('9.jpg', 'jpg', 'Exposed fiberglass insulation');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('10.jpg', 'jpg', 'Insulation with a vapor barrier');


INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('11.jpg', 'jpg', 'Incandescent light bulb');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('12.jpg', 'jpg', 'Home-owner operating a dimming switch for their in-home lighting fixtures');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('13.jpg', 'jpg', 'Trash bin full of old light bulbs');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('14.png', 'png', 'Close-up of hot incandescent filament');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('15.jpg', 'jpg', 'Droplets of liquid mercury');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('16.jpg', 'jpg', 'LED light bulb in a home');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('17.jpg', 'jpg', 'CFL light bulb in a person’s hand');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('18.png', 'png', 'CFL light bulb in a person’s hand');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('19.jpg', 'jpg', 'Filament of an incandescent light bulb');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('20.jpg', 'jpg', 'LED light bulb in a home');

INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('21.jpg', 'jpg', 'Person in home heated by a heat pump');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('22.jpg', 'jpg', 'Power cord');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('23.jpg', 'jpg', 'Home heated by fire-place');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('24.jpg', 'jpg', 'Heat pump in home-owners bedroom');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('25.jpg', 'jpg', 'Home-owner adjusting home thermostat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('26.jpeg', 'jpeg', 'Home-owner adjusting home thermostat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('27.jpg', 'jpg', 'Home heat pump unit outside in nice weather');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('28.jpg', 'jpg', 'Home-owner reviewing and paying energy bills');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('29.jpg', 'jpg', 'Outdoor heat pump unit in winter weather');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('30.jpeg', 'jpeg', 'Home-owners bothered by loud sound');


INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('31.png', 'png', 'Snowy Scene');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('32.png', 'png', 'Solar Panels');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('33.png', 'png', 'Notebook with Money Sign');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('34.png', 'png', 'Potted Plant');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('35.png', 'png', 'Assorted Tools');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('36.png', 'png', 'Roof Shingles');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('37.png', 'png', 'Downward Tilted Arrow');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('38.png', 'png', 'Repeat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('39.png', 'png', 'Repeat');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('40.png', 'png', 'Repeat');



INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('41.jpg', 'jpg', 'Thermal imager showing heat loss through windows');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('42.jpg', 'jpg', 'Workers installing a new window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('43.jpg', 'jpg', 'Home-owner caulking the edges of their home window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('44.jpg', 'jpg', 'Light coming through a bedroom window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('45.jpg', 'jpg', 'Cellular shades installed in a home kitchen');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('46.jpeg', 'jpeg', 'Workers installing a new window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('47.jpeg', 'jpeg', 'Home wooden-window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('48.jpg', 'jpg', 'Diagram of different R-Values for different window types');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('49.jpg', 'jpg', 'Installation of double-glazed window');
INSERT INTO photos (file_name, file_ext, alt_text) VALUES ('50.jpeg', 'jpeg', 'Old home window');





INSERT INTO questions (question, answer, feedback) VALUES ('You only need insulation if you live in a cold place.', 'myth', 'Insulation will keep your home warm in the winter and cool in the summer!');
INSERT INTO questions (question, answer, feedback) VALUES ('You can put insulation into existing walls without tearing them down.', 'fact', 'Some types of insulation, such as spray foam, can be sprayed into small holes in the walls and will expand to fill the space!');
INSERT INTO questions (question, answer, feedback) VALUES ('Having insulation can save you up to 50% on energy bills.', 'fact', 'Your home loses about 35% of its heat through the walls.');
INSERT INTO questions (question, answer, feedback) VALUES ('Spray foam insulation is a soft, squishy material.', 'myth', 'Spray foam is spongy when it is first installed but eventually hardens.');
INSERT INTO questions (question, answer, feedback) VALUES ('Insulation can also act as a sound barrier.', 'fact', 'Insulation can absorb vibrations and dampen sounds.');
INSERT INTO questions (question, answer, feedback) VALUES ('R-value indicated a material’s ability to resist heat loss.', 'fact', 'R-value represents thermal resistance. This is the measure of the resistance of a material to conductive heat flow');
INSERT INTO questions (question, answer, feedback) VALUES ('All types of insulation are equally effective.', 'myth', 'Different types of insulation have different R-values which indicate their ability to resist heat loss. ');
INSERT INTO questions (question, answer, feedback) VALUES ('Some types of insulation are better for the environment than others.', 'fact', 'Although having ANY type of insulation is better for the environment than having no insulation, some types of insulation are produced in more environmentally friendly ways with more environmentally friendly materials.');
INSERT INTO questions (question, answer, feedback) VALUES ('Fiberglass insulation is dangerous to inhale.', 'fact', 'Fiberglass contains small glass fibers that can irritate lung tissue so be sure to wear a mask when working around it!');
INSERT INTO questions (question, answer, feedback) VALUES ('If you have insulation you don’t need a vapor barrier.', 'myth', 'You should install a vapor barrier after your insulation to prevent damage from moisture. Insulation is not as effective when it is damp.');


INSERT INTO questions (question, answer, feedback) VALUES ('Incandescent bulbs produce light by heating up a filament.', 'fact', 'Incandescents produce light via the heating of a wire filament inside the bulb itself. When the filament reaches a high enough temperature, it glows. Most incandescent filaments reach about 3000 K, which is almost 4950 degrees F!');
INSERT INTO questions (question, answer, feedback) VALUES ('All LEDs and CFLs can be used with a dimmer switch.', 'myth', 'This is because of their low wattage requirements, making it difficult for a standard dimmer switch to function. If you plan to dim your LED and CFL bulbs, make sure to buy bulbs that say they are dimmable. Also, select a dimmer switch which is rated for LEDs and CFLs.');
INSERT INTO questions (question, answer, feedback) VALUES ('You can throw old CFL bulbs in your trash can.', 'myth', 'CFL bulbs contain small amounts of mercury, and can easily break if thrown in the trash. The EPA recommends that you bring your CFLs and other fluorescent bulbs to a local recycling facility. Want to know where to take them? Visit  search.Earth911.com to find collection schedules or drop off locations near you!');
INSERT INTO questions (question, answer, feedback) VALUES ('Incandescent bulbs turn about 50% of the energy it uses into light.', 'myth', 'Only about 5% of the energy an incandescent bulb draws is converted to light!');
INSERT INTO questions (question, answer, feedback) VALUES ('LED bulbs contain mercury.', 'myth', 'Only CFL bulbs contain mercury.');
INSERT INTO questions (question, answer, feedback) VALUES ('LEDs can last 50 times longer than incandescent bulbs.', 'fact', 'LED bulbs can last for 50,000 to 100,000 hours. That’s about 5.7-11.4 years of continuous use! ');
INSERT INTO questions (question, answer, feedback) VALUES ('CFL bulbs are only available in a spiral shape.', 'myth', 'CFLs are available in many different shapes and colors.');
INSERT INTO questions (question, answer, feedback) VALUES ('CFL bulbs emit UV radiation.', 'fact', 'Though the UV radiation is a small amount, it is recommended that you remain at least 1 foot from an uncovered CFL bulbs and limit close exposure to three hours at a time. ');
INSERT INTO questions (question, answer, feedback) VALUES ('The filament inside incandescent bulbs is made up of mostly tungsten.', 'fact', 'This is because it has a high melting point (3422 C, or about 6190 F), so it won’t melt when electricity is passed through it.');
INSERT INTO questions (question, answer, feedback) VALUES ('LEDs last longer in high temperature environments.', 'myth', 'LED bulbs are sensitive to excessive heat. Make sure that your LED bulb is rated for high temperatures if you plan to use it in a hot environment.');



INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps only heat your home.', 'myth', 'Heat pumps are designed to heat and cool your home. They are able to replace heating and cooling systems so they can work all year round.');
INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps are just as bad as furnaces and air conditioners because they use electricity which is produced through fossil fuels.', 'myth', 'Heat pumps do use electricity from the grid, but the grid can obtain electricity from a variety of sources. As the grid becomes greener, so too will your heat pump. Not to mention, if you supplement your electricity needs with renewable power at home, your heat pump will be environmentally friendly too!');
INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps are not as efficient as traditional heating methods.', 'myth', 'Heat pumps are actually much more efficient than traditional heating methods.');
INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps use refrigerant, the same substance that is in your fridge, to heat and cool your home.', 'fact', 'Heat pumps work the same way that refrigerators do. They use electricity to move heat from a cool area to a warm area, the same way your refrigerator moves hot air from inside to the kitchen!');
INSERT INTO questions (question, answer, feedback) VALUES ('Setting the thermostat temperature 1° lower throughout the year can save 1% of your heating bills.', 'fact', 'By turning down the temperature at night when you’re sleeping, or during the day when you’re at work can save a lot of money. Using a programmable thermostat can potentially save even more.');
INSERT INTO questions (question, answer, feedback) VALUES ('The lower the temperature of your house, the slower the heat loss.', 'fact', 'If you lower the temperature on your thermostat, the heating system will not only have to heat the house to lower temperature but will also have to heat less often. This is due to the lower temperature differential that exists between the outside air and the air in your home.');
INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps can only work in warm temperatures.', 'myth', 'There are models of heat pumps available, like the one installed in this tiny home, which can operate in temperatures as low as -15°F.');
INSERT INTO questions (question, answer, feedback) VALUES ('You can save 10% of your heating bills by lowering the thermostat temperature 7°-10° F for 8 hours a day.', 'fact', 'By turning down the temperature at night when you’re sleeping, or during the day when you’re at work can save a lot of money. Using a programmable thermostat can potentially save even more.');
INSERT INTO questions (question, answer, feedback) VALUES ('Ground-source heat pumps can only operate in summer', 'myth', 'Ground source heat pumps can operate in summer and winter. The ground is warmer than the air in winter and therefore a heat differential exists which can be used to heat your home. Similarly, the ground is colder than the air in the summer and therefore a heat differential exists which can be used to cool your home.');
INSERT INTO questions (question, answer, feedback) VALUES ('Heat pumps are noisy.', 'myth', 'Heat pumps are comparable to refrigerators in noise level.');


INSERT INTO questions (question, answer, feedback) VALUES ('I need to own a house to go solar. ', 'myth', 'You don’t need to own a house to participate in community solar. Through a subscription service, you pay as you use electricity from a shared solar farm. Alternatively, you can purchase a solar panel from a shared solar farm.');
INSERT INTO questions (question, answer, feedback) VALUES ('You can use solar power air conditioners, hot water heaters, and everything else that natural gas and oil fuel can power.', 'fact', 'You can count on solar power to power everything in your home!');
INSERT INTO questions (question, answer, feedback) VALUES ('Ithaca is too cloudy and snowy for solar to work.', 'myth', 'Cloudy and snowy weather can reduce the amount of energy produced, but your solar panels will still work. Solar panels are usually angled in a way that allows accumulated snow to slide off. Rain can actually help clear off the debris on your panels.');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panels cause roof damage.', 'myth', 'Professionals are experienced and skills at installing solar panels, and they will not damage your roof. In fact, solar panels will actually protect your roof from other elements.');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar produces no pollution, making it one of the cleanest energy sources.', 'fact', 'Traditional sources like natural gas, oil, and coal create pollution and are damaging to the environment.');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panel costs have dropped 80% since 2008.', 'fact', 'Solar panel costs have indeed dropped since 2008. The costs are expected to continue to fall.');
INSERT INTO questions (question, answer, feedback) VALUES ('Surplus energy is stored in batteries.', 'myth', 'Most solar power systems are connected to a power grid via net metering. The excess energy that your solar panels have generated will be added to the electrical grid, and you will be credited with that excess energy. You can, however, install batteries by paying extra for installation and maintenance.');
INSERT INTO questions (question, answer, feedback) VALUES ('I won’t stay in my home long enough to get my investment back.', 'myth', 'You can get your investment back in about 6 to 15 years, depending on your system and location! You can see a return on investment within 2 to 4 years, thanks to state and federal incentives and tax credits.');
INSERT INTO questions (question, answer, feedback) VALUES ('I won’t have energy when the sun is not out (eg. during the night).', 'myth', 'Your solar panel will produce more energy than needed during the day, and that energy gets drawn back as credit when needed.');
INSERT INTO questions (question, answer, feedback) VALUES ('Solar panels increase the resale value of my house by about $15,000.', 'fact', 'Even if you plan to move out of your home within 15 years, you can still receive a large return when you sell your house!');



INSERT INTO questions (question, answer, feedback) VALUES ('Home loses up to 30% of its heating and cooling energy through air leaks.', 'fact', 'Nice job!');
INSERT INTO questions (question, answer, feedback) VALUES ('Replacing old windows is the best solution to lowering heat costs.', 'myth', 'Caulking, window inserts and cellular shades are other viable options.');
INSERT INTO questions (question, answer, feedback) VALUES ('Replacing single pane windows with double pane windows is not as worth it as caulking, applying window inserts and cellular shades.', 'fact', 'Nice job!');
INSERT INTO questions (question, answer, feedback) VALUES ('Replacing windows at home won’t make a difference to your home’s overall energy efficiency.', 'myth', 'Windows and doors can account for 30% of your home’s total energy loss. Replacing old inefficient windows with new high-performance products will result in lower heating bills.');
INSERT INTO questions (question, answer, feedback) VALUES ('All cellular shades block out sunlight completely.', 'myth', 'There are many types of cellular shades, from semi-opaque light filtering fabrics to light blocking opaque fabrics that offer a variety of light control options.');
INSERT INTO questions (question, answer, feedback) VALUES ('Replacing windows will mean a major renovation.', 'myth', 'Usually windows can be replaced with minimal disturbance to existing walls. There are two types of installation – a complete tear out or a retrofit.');
INSERT INTO questions (question, answer, feedback) VALUES ('UPVC Windows are better than wood windows.', 'fact', 'Wood frames can swell, rot and prone to mold contamination – require regular maintenance and painting. uPVC are water resistant, low maintenance and does not require painting.');
INSERT INTO questions (question, answer, feedback) VALUES ('R-value of a window measures its ability to resist heat flow, either coming in or going out.', 'fact', 'Nice job!');
INSERT INTO questions (question, answer, feedback) VALUES ('Double glazed replacement windows reduces heat loss and noise levels.', 'fact', 'Nice job!');
INSERT INTO questions (question, answer, feedback) VALUES ('Windows have a lifespan of around 20 years.', 'fact', 'Nice job!');






INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (1,1,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (2,2,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (3,3,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (4,4,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (5,5,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (6,6,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (7,7,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (8,8,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (9,9,1);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (10,10,1);


INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (11,11,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (12,12,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (13,13,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (14,14,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (15,15,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (16,16,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (17,17,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (18,18,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (19,19,2);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (20,20,2);


INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (21,21,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (22,22,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (23,23,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (24,24,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (25,25,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (26,26,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (27,27,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (28,28,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (29,29,3);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (30,30,3);


INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (31,31,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (32,32,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (33,33,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (34,34,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (35,35,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (36,36,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (37,37,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (38,38,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (39,39,4);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (40,40,4);



INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (41,41,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (42,42,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (43,43,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (44,44,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (45,45,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (46,46,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (47,47,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (48,48,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (49,49,5);
INSERT INTO pages (question_id, photo_id, quiz_id) VALUES (50,50,5);
