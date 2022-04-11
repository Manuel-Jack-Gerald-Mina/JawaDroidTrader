USE adlister_db;

TRUNCATE ads;

INSERT INTO ads (id, user_id, title, description)
VALUES (1, 2, 'generic title #1', 'generic description #1'),
       (2, 2, 'generic title #2', 'generic description #2'),
       (2, 2, 'generic title #3', 'generic description #3'),
       (2, 2, 'generic title #4', 'generic description #4'),
       (2, 2, 'generic title #5', 'generic description #5'),
       (2, 2, 'generic title #6', 'generic description #6'),
       (2, 2, 'generic title #7', 'generic description #7'),
       (2, 2, 'generic title #8', 'generic description #8'),
       (2, 2, 'generic title #9', 'generic description #9'),
       (2, 2, 'generic title #10', 'generic description #10'),
       (3, 2, 'generic title #1', 'generic description #11');