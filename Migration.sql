USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads_categories;
DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS user_picture;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username     VARCHAR(50) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    email        VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (username)
);

CREATE TABLE ads
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id       INT UNSIGNED NOT NULL DEFAULT 0,
    title         VARCHAR(50) NOT NULL DEFAULT '',
    description  VARCHAR(255) NOT NULL DEFAULT '',
    price DOUBLE NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
ON DELETE CASCADE
);

CREATE table categories
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(40),
    PRIMARY KEY (id),
    UNIQUE (category)
);

CREATE TABLE ads_categories (
    ads_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ads_id) REFERENCES ads(id)
    ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
    ON DELETE CASCADE
);

CREATE  TABLE pictures (
    id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    picture_url VARCHAR(50) NOT NULL DEFAULT 'Jawa_fullbody.png',
    PRIMARY KEY (id)
);


CREATE TABLE user_picture (
                                user_id INT UNSIGNED NOT NULL,
                                picture_id INT UNSIGNED NOT NULL,
                                FOREIGN KEY (user_id) REFERENCES users(id)
                                    ON DELETE CASCADE,
                                FOREIGN KEY (picture_id) REFERENCES pictures(id)
                                    ON DELETE CASCADE,
                                UNIQUE(user_id)
);


INSERT INTO users (id, username, password, email)
VALUES (1, 'adlister', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'adlister@example.com'),
       (2, 'jawa', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'jawa@example.com'),
       (3, 'mina', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'mina@example.com'),
       (4, 'jack', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'jack@example.com'),
       (5, 'geraldo', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'geraldo@example.com'),
       (6, 'alex', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'alex@example.com'),
       (7, 'cosmo', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'cosmo@example.com'),
       (8, 'orangeBanana', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'orangeBanana@example.com'),
       (9, 'PotatoPeeler', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'PotatoPeeler@example.com'),
       (10, 'BlackLagoon', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'BlackLagoon@example.com'),
       (11, 'TwitterUser1', '$2a$12$Bn6hlBzpvIo9e7304I56mOggzhrJgfLf9hJVdJzUxIp3h3V89k/LW', 'TwitterUser1@example.com');

INSERT INTO pictures (id, picture_url)
VALUES (1, 'jawaUser/Jawa1.png'),
       (2,'jawaUser/jawa2.jpeg'),
       (3,'jawaUser/jawa3.png'),
       (4,'jawaUser/jawa4.jpeg'),
       (5,'jawaUser/jawa5.jpeg'),
       (6,'jawaUser/jawa6.png'),
       (7,'jawaUser/jawa7.png'),
       (8,'jawaUser/jawa8.png'),
       (9,'jawaUser/jawa9.jpeg'),
       (10,'jawaUser/jawa10.png'),
       (11,'jawaUser/jawa11.png');


INSERT INTO user_picture (user_id, picture_id)
VALUES (1, 1),
       (2, 2),
       (3,3),
       (4,4),
       (5,5),
       (6,6),
       (7,7),
       (8,8),
       (9,9),
       (10,10),
       (11,11);


INSERT INTO ads (id, user_id, title, description, price)
VALUES (1, 2, 'Leftover Droidikas', 'Looking to trade some droidika and droidika parts from a cave. serious trades only',54.1),
       (2, 1, 'Blaster rifles', 'Sleeping stromtroopers "lost" their blasters. equal value or greater, I know what I have',33391),
       (3, 2, 'C3PO unit along a R2D2 unit', '3po-series protocol droid to interact with orginics, prograamed primarily for etiquette and protocol. as title. Restraining bolt already attached',5464),
       (4, 2, 'Mandolorian armor for sale', 'seems in good condition. looking for an mud-horn egg',113000.62),
       (5, 3, 'Weapons for trade', 'looking to trade a few tusken Cycler rifles and Gaderffii. ',352.3),
       (6, 2, 'droid for sale!', 'looking to trade a small ball-shaped droid.serious inquires only',434),
       (7, 4, 'Lightsabers!', 'selling Lightsabers. cannot guarantee they work. no refunds',2323),
       (8, 6, 'selling Banthas', 'no room for them, looking to see what i can get for this herd',34353),
       (9, 7, 'Razorcrest and parts', 'Razorcrest and few parts. reassembly costs extra',6464),
       (10, 8, 'help?', ' not an ad. but has any other Jawa left Tatooine? is it worth the trouble?',46464),
       (11, 9, 'Teaching young Jawas', 'Looking for locations of items of value to help teach new jawas to scrap',56575),
       (12, 3, 'Beskar','Rare , Extremely rare alloy, Own it with your own risk, especially if you have price on your head and willing to trade with Starfighter without a locator+$$',1100000.00),
       (13,7, 'Hyperdrive-generator','Vital starship engine system that allows light speed travel. This is a must system to travel between galaxies. It allows travelers to traverse a galaxy spanning over 120,000 light-years in only few hours or days.',123454.23),
       (14, 6,'Laser-canons','firs to starfighters and starships. /could be fixed in place or attached to a turret. ** mount not included, Snowspeeder in picture not included.',2345.98),
       (15,9,'Shifter knob','Miscellaneous - fits Razorcrest shifter',12.00),
       (16,8,'E-web','Heavy repeating blaster  .optimum range 150 meters /maximum range 750 meters. ',12341.26),
       (17,3,'IG-88','Assassin droid , manufactured by Holowan Laboratories, deactivated.',87659.00),
       (18,5,'Speeder bike','Hoverbike open-air repulsolift. Max altitute 10 meter, must have the \'item\' from the Dune-sea',45009.87),
       (19,4,'Gaffi Stick','Traditional melee weapon of Tusken Raiders, Tatooine. ',1232.90),
       (20,4,'Gamorrean\'s exe','Vibro-ax for Gamorrean warriors. ',125.90),
       (21,3, 'Armor','Customized Mandalorian armor. looking to trade for rancor-claw',189000);



INSERT INTO categories (id, category)
VALUES (1,'Droid parts'),
       (2,'Spacecraft parts'),
       (3,'Droid'),
       (4,'Spacecraft'),
       (5,'Weapons'),
       (6,'Armor'),
       (7,'Live Creature'),
       (8,'Scrapping'),
       (9,'Maintenance'),
       (10,'Other');

INSERT INTO ads_categories (ads_id, category_id)
VALUES  (1,1),
        (1,3),
        (1,6),
        (2,5),
        (3,1),
        (3,3),
        (4,6),
        (5,5),
        (6,3),
        (7,5),
        (8,7),
        (9,4),
        (10,10),
        (11,8),
       (12,10),
       (13,2),
        (14,5),
        (15,8),
        (16,5),
        (17,3),
        (18,10),
        (19,5),
        (20,5),
        (21,6);


