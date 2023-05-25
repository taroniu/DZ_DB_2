CREATE TABLE IF NOT EXISTS janres (
	id serial PRIMARY KEY,
	janre varchar(40) UNIQUE NOT NULL 
);

--DROP TABLE janres

CREATE TABLE IF NOT EXISTS artists (
	id serial PRIMARY KEY,
	artist varchar(40) UNIQUE NOT NULL
);

--DROP TABLE artists

CREATE TABLE IF NOT EXISTS albums(
	id serial PRIMARY KEY,
	date DATE CHECK (date > '31-12-1999') NOT NULL,
	album varchar(40) UNIQUE NOT NULL
);

--DROP TABLE albums

CREATE TABLE IF NOT EXISTS songs(
	id serial PRIMARY KEY,
	album_id integer REFERENCES albums(id),
	song varchar(40) UNIQUE NOT NULL,
	duration integer CHECK (duration BETWEEN 170 AND 300) NOT NULL 
);

--DROP TABLE songs

CREATE TABLE IF NOT EXISTS artists_janres(
	artists_1d integer REFERENCES artists(id),
	janres_id integer REFERENCES janres(id),
	CONSTRAINT id PRIMARY KEY (artists_1d, janres_id)
);

--DROP TABLE artists_janres

CREATE TABLE IF NOT EXISTS artists_albums(
	artists_id integer REFERENCES artists(id),
	albums_id integer REFERENCES albums(id),
	CONSTRAINT id_ PRIMARY KEY (artists_id, albums_id)
);

--DROP TABLE artists_albums

CREATE TABLE IF NOT EXISTS collection(
	id serial PRIMARY KEY,
	collection_name varchar(40) NOT NULL,
	date DATE CHECK (date > '31-12-1999') NOT NULL
);

--DROP TABLE collection

CREATE TABLE IF NOT EXISTS songs_collection(
	song_id integer REFERENCES songs(id),
	collection_id integer REFERENCES collection(id),
	CONSTRAINT idd PRIMARY KEY (song_id, collection_id)
);

--DROP TABLE songs_collection