USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username     VARCHAR(50) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    email        VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id       INT UNSIGNED NOT NULL,
    title         VARCHAR(50) NOT NULL,
    description  VARCHAR(150) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO users (id, username, password, email)
VALUES (1, 'adlister', 'codeup', 'adlister@example.com'),
       (2, 'jawa', 'codeup', 'jawa@example.com'),
       (3, 'mina', 'codeup', 'mina@example.com'),
       (4, 'jack', 'codeup', 'jack@example.com'),
       (5, 'geraldo', 'codeup', 'geraldo@example.com'),
       (6, 'alex', 'codeup', 'alex@example.com'),
       (7, 'cosmo', 'codeup', 'cosmo@example.com'),
       (8, 'orangeBanana', 'codeup', 'orangeBanana@example.com'),
       (9, 'PotatoPeeler', 'codeup', 'PotatoPeeler@example.com'),
       (10, 'BlackLagoon', 'codeup', 'BlackLagoon@example.com'),
       (11, 'TwitterUser1', 'codeup', 'TwitterUser1@example.com');


INSERT INTO ads (id, user_id, title, description)
VALUES (1, 2, 'generic title #1', 'generic description #1'),
       (2, 1, 'generic title #2', 'generic description #2'),
       (3, 2, 'generic title #3', 'generic description #3'),
       (4, 2, 'generic title #4', 'generic description #4'),
       (5, 3, 'generic title #5', 'generic description #5'),
       (6, 2, 'generic title #6', 'generic description #6'),
       (7, 4, 'generic title #7', 'generic description #7'),
       (8, 6, 'generic title #8', 'generic description #8'),
       (9, 7, 'generic title #9', 'generic description #9'),
       (10, 8, 'generic title #10', 'generic description #10'),
       (11, 9, 'generic title #1', 'generic description #11');

