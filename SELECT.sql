SELECT title, duration FROM song
WHERE duration = (SELECT MAX(duration) FROM song);

SELECT  title FROM song 
WHERE duration >= 210;

SELECT title FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM singer
WHERE name NOT LIKE '% %'; 

SELECT title FROM song 
WHERE LOWER(title) LIKE LOWER('%My%');

SELECT g.title, COUNT(genre_id) FROM genre g 
JOIN genresinger g2 ON g.id = g2.genre_id
GROUP BY g.title;

--SELECT a.title, COUNT(album_id) FROM album a 
SELECT COUNT(album_id) FROM album a
JOIN song s ON a.id = s.album_id 
WHERE release_year BETWEEN 2019 AND 2020;
--GROUP BY a.title; 

SELECT a.title, AVG(duration) FROM album a
JOIN song s ON a.id = s.album_id 
GROUP BY a.title; 

SELECT DISTINCT name
FROM singer s 
JOIN singeralbum s2 ON s.id = s2.singer_id 
JOIN album a ON s2.album_id = a.id
WHERE name NOT IN (
    SELECT name 
    FROM singer s
    JOIN singeralbum s2 ON s.id = s2.singer_id
    JOIN album a ON s2.album_id = a.id
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.title FROM collection c 
JOIN songcollection s ON c.id = s.collection_id 
JOIN song s2 ON s.song_id = s2.id
JOIN album a ON s2.album_id = a.id 
JOIN singeralbum s3 ON a.id  = s3.album_id 
JOIN singer s4 ON s3.singer_id = s4.id 
WHERE name = 'Han Solo';
