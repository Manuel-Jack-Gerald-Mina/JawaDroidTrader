USE adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads_categories;
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
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
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
    FOREIGN KEY (ads_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
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


INSERT INTO ads (id, user_id, title, description)
VALUES (1, 2, 'Leftover Droidikas', 'Looking to trade some droidika and droidika parts from a cave. serious trades only'),
       (2, 1, 'Blaster rifles', 'Sleeping stromtroopers "lost" their blasters. equal value or greater, I know what I have'),
       (3, 2, 'C3PO unit along a R2D2 unit', 'as title. Restraining bolt already attached'),
       (4, 2, 'Mandolorian armor for sale', 'seems in good condition. looking for an egg'),
       (5, 3, 'Weapons for trade', 'looking to trade a few tusken Cycler rifles and Gaderffii. '),
       (6, 2, 'droid for sale!', 'looking to trade a small ball-shaped droid.serious inquires only'),
       (7, 4, 'Lightsabers!', 'selling Lightsabers. cannot guarantee they work. no refunds'),
       (8, 6, 'selling Banthas', 'no room for them, looking to see what i can get for this herd'),
       (9, 7, 'Razorcrest and parts', 'Razorcrest and few parts. reassembly costs extra'),
       (10, 8, 'help?', ' not an ad. but has any other Jawa left Tatooine? is it worth the trouble?'),
       (11, 9, 'Teaching young Jawas', 'looking for locations of items of value to help teach new jawas to scrap');


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
        (11,8);

