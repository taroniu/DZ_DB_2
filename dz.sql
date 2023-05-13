CREATE TABLE IF NOT EXISTS artists (
	id serial PRIMARY KEY,
	name varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS janres (
	id serial PRIMARY KEY,
	janre varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums(
	id serial PRIMARY KEY,
	date DATE,
	album varchar(40) NOT null
);

CREATE TABLE IF NOT EXISTS songs(
	id serial PRIMARY KEY,
	song varchar(40) NOT NULL,
	duration TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_janres(
	artistsID integer REFERENCES artists(id),
	janresID integer REFERENCES janres(id),
	CONSTRAINT id PRIMARY KEY (artistsID, janresID)
);

CREATE TABLE IF NOT EXISTS artists_albums(
	artistID integer REFERENCES artists(id),
	albumID integer REFERENCES albums(id),
	CONSTRAINT id PRIMARY KEY (artistID, albumID)
);

CREATE TABLE IF NOT EXISTS songs_albums(
	songID integer REFERENCES songs(id),
	albumid integer REFERENCES albums(id),
	CONSTRAINT id PRIMARY KEY (songID, albumid)
);

CREATE TABLE IF NOT EXISTS collection(
	id serial PRIMARY KEY,
	collection_name varchar(40) NOT NULL,
	song_id integer REFERENCES songs(id),
	date DATE NOT NULL
);

