INSERT INTO genre (title)
VALUES ('Country'),
	   ('Electronic'),
	   ('Funk'),
	   ('Hip hop'),
	   ('Jazz')
ON CONFLICT DO NOTHING;

INSERT INTO singer (name)
VALUES ('Han Solo'),
       ('Boba Fett'),
       ('Luke Skywalker'),
       ('Leia Organa'),
       ('R2 D2'),
       ('Singer')
ON CONFLICT DO NOTHING;
      
INSERT INTO genresinger (genre_id, singer_id)  
VALUES ((SELECT id FROM genre WHERE title = 'Country'), (SELECT id FROM singer WHERE name = 'Han Solo')),
       ((SELECT id FROM genre WHERE title = 'Country'), (SELECT id FROM singer WHERE name = 'Boba Fett')),
       ((SELECT id FROM genre WHERE title = 'Electronic'), (SELECT id FROM singer WHERE name = 'Boba Fett')),
       ((SELECT id FROM genre WHERE title = 'Electronic'), (SELECT id FROM singer WHERE name = 'Luke Skywalker')),
       ((SELECT id FROM genre WHERE title = 'Funk'), (SELECT id FROM singer WHERE name = 'Luke Skywalker')),
       ((SELECT id FROM genre WHERE title = 'Hip hop'), (SELECT id FROM singer WHERE name = 'Leia Organa')),
       ((SELECT id FROM genre WHERE title = 'Hip hop'), (SELECT id FROM singer WHERE name = 'Leia Organa')),
       ((SELECT id FROM genre WHERE title = 'Jazz'), (SELECT id FROM singer WHERE name = 'R2 D2')),
       ((SELECT id FROM genre WHERE title = 'Jazz'), (SELECT id FROM singer WHERE name = 'Singer'))
ON CONFLICT DO NOTHING;


INSERT INTO album (title, release_year)
VALUES ('Back in Black', 1980),
       ('Jagged Little Pill', 1995),
       ('Falling into You', 1996),
       ('The Dark Side of the Moon', 1973),
       ('Bad', 1987),
       ('Metallica', 1991),
       ('Album', 2020)
ON CONFLICT DO NOTHING;

INSERT INTO singeralbum (singer_id, album_id)  
VALUES ((SELECT id FROM singer WHERE name = 'Han Solo'), (SELECT id FROM album WHERE title = 'Back in Black')),
       ((SELECT id FROM singer WHERE name = 'Han Solo'), (SELECT id FROM album WHERE title = 'Jagged Little Pill')),
       ((SELECT id FROM singer WHERE name = 'Boba Fett'), (SELECT id FROM album WHERE title = 'Jagged Little Pill')),
       ((SELECT id FROM singer WHERE name = 'Boba Fett'), (SELECT id FROM album WHERE title = 'Falling into You')),
       ((SELECT id FROM singer WHERE name = 'Luke Skywalker'), (SELECT id FROM album WHERE title = 'Falling into You')),
       ((SELECT id FROM singer WHERE name = 'Leia Organa'), (SELECT id FROM album WHERE title = 'The Dark Side of the Moon')),
       ((SELECT id FROM singer WHERE name = 'R2 D2'), (SELECT id FROM album WHERE title = 'Bad')),
       ((SELECT id FROM singer WHERE name = 'R2 D2'), (SELECT id FROM album WHERE title = 'Metallica')),
       ((SELECT id FROM singer WHERE name = 'Singer'), (SELECT id FROM album WHERE title = 'Album'))
ON CONFLICT DO NOTHING;

INSERT INTO song (album_id, title, duration)
VALUES ((SELECT id FROM album WHERE title = 'Back in Black'), 'Hells Bells', 309),
       ((SELECT id FROM album WHERE title = 'Back in Black'), 'Back in Black', 243),
       ((SELECT id FROM album WHERE title = 'Jagged Little Pill'), 'All I Really Want', 285),
       ((SELECT id FROM album WHERE title = 'Falling into You'), 'Because You Loved Me', 273),
       ((SELECT id FROM album WHERE title = 'The Dark Side of the Moon'), 'Time', 421),
       ((SELECT id FROM album WHERE title = 'The Dark Side of the Moon'), 'Money', 382),
       ((SELECT id FROM album WHERE title = 'Bad'), 'Bad', 247),
       ((SELECT id FROM album WHERE title = 'Metallica'), 'The Unforgiven', 386),
       ((SELECT id FROM album WHERE title = 'Album'), 'Song', 180),
       ((SELECT id FROM album WHERE title = 'Album'), 'My Song 1', 180),
       ((SELECT id FROM album WHERE title = 'Album'), 'My Song 2', 280)
ON CONFLICT DO NOTHING;

INSERT INTO collection (title, release_year)
VALUES ('collection 1', 2015),
       ('collection 2', 2016),
       ('collection 3', 2017),
       ('collection 4', 2018),
       ('collection 5', 2019),
       ('collection 6', 2020),
       ('collection 7', 2021)       
ON CONFLICT DO NOTHING;

INSERT INTO songcollection (song_id , collection_id)  
VALUES ((SELECT id FROM song WHERE title = 'Hells Bells'), (SELECT id FROM collection WHERE title = 'collection 1')),
       ((SELECT id FROM song WHERE title = 'Back in Black'), (SELECT id FROM collection WHERE title = 'collection 1')),
       ((SELECT id FROM song WHERE title = 'Back in Black'), (SELECT id FROM collection WHERE title = 'collection 2')),
       ((SELECT id FROM song WHERE title = 'All I Really Want'), (SELECT id FROM collection WHERE title = 'collection 3')),
       ((SELECT id FROM song WHERE title = 'Because You Loved Me'), (SELECT id FROM collection WHERE title = 'collection 3')),
       ((SELECT id FROM song WHERE title = 'Time'), (SELECT id FROM collection WHERE title = 'collection 4')),
       ((SELECT id FROM song WHERE title = 'Money'), (SELECT id FROM collection WHERE title = 'collection 5')),
       ((SELECT id FROM song WHERE title = 'Bad'), (SELECT id FROM collection WHERE title = 'collection 5')),
       ((SELECT id FROM song WHERE title = 'The Unforgiven'), (SELECT id FROM collection WHERE title = 'collection 6')),
       ((SELECT id FROM song WHERE title = 'The Unforgiven'), (SELECT id FROM collection WHERE title = 'collection 7')),
       ((SELECT id FROM song WHERE title = 'Bad'), (SELECT id FROM collection WHERE title = 'collection 6')),
       ((SELECT id FROM song WHERE title = 'Time'), (SELECT id FROM collection WHERE title = 'collection 7')),
       ((SELECT id FROM song WHERE title = 'Song'), (SELECT id FROM collection WHERE title = 'collection 7')),
       ((SELECT id FROM song WHERE title = 'My Song 1'), (SELECT id FROM collection WHERE title = 'collection 1')),
       ((SELECT id FROM song WHERE title = 'My Song 2'), (SELECT id FROM collection WHERE title = 'collection 1'))
ON CONFLICT DO NOTHING;