CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
); 

CREATE TABLE IF NOT EXISTS GenreSinger (
	genre_id INTEGER REFERENCES Genre(id),
	singer_id INTEGER REFERENCES Singer(id),
	CONSTRAINT relation_genre_singer PRIMARY KEY (genre_id, singer_id)
); 

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) UNIQUE NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year > 1900 AND release_year <= EXTRACT(YEAR FROM NOW())) 
); 

CREATE TABLE IF NOT EXISTS SingerAlbum (	
	singer_id INTEGER REFERENCES Singer(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT relation_singer_album PRIMARY KEY (singer_id, album_id)
); 

CREATE TABLE IF NOT EXISTS Song (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	title VARCHAR(100) UNIQUE NOT NULL,
	duration INTEGER NOT NULL 
); 

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,	
	title VARCHAR(100) UNIQUE NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year > 1900 AND release_year <= EXTRACT(YEAR FROM NOW()))
); 

CREATE TABLE IF NOT EXISTS SongCollection (	
	song_id INTEGER REFERENCES Song(id),
	collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT relation_song_collection PRIMARY KEY (song_id, collection_id)
); 