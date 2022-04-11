USE adlister_db;

DROP TABLE IF EXISTS ads;

CREATE TABLE ads
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id       INT UNSIGNED NOT NULL,
    title         VARCHAR(50) NOT NULL,
    description  VARCHAR(150) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);