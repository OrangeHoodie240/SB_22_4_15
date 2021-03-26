DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL, 
  last_name TEXT NOT NULL);

CREATE TABLE producers(
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL, 
  last_name TEXT NOT NULL);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL, 
  release_date DATE NOT NULL);

CREATE TABLE songs(
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL, 
  release_date DATE NOT NULL, 
  duration_in_seconds INTEGER NOT NULL);

CREATE TABLE songs_to_artists_and_producers(
    song_id INTEGER REFERENCES songs(id) NOT NULL, 
    artist_id INTEGER REFERENCES artists(id), 
    producer_id INTEGER REFERENCES producers(id));

CREATE TABLE albums_to_songs(
  artist_id INTEGER REFERENCES artists(id), 
  album_id INTEGER REFERENCES albums(id));

  INSERT INTO artists(first_name, last_name)
    VALUES('Speed', 'Wagon');

  INSERT INTO producers(first_name, last_name)
    VALUES('Jim', 'Raynor');

  INSERT INTO albums(title, release_date)
    VALUES('Crazy Diamonds', '2010-03-15');
  
  INSERT INTO songs(title, release_date, duration_in_seconds)
    VALUES('Chocalate Rain', '2002-02-01', 313);

  INSERT INTO songs_to_artists_and_producers(song_id, artist_id, producer_id)
    VALUES(1, 1, 1);
  
  INSERT INTO albums_to_songs(artist_id, album_id)
    VALUES(1,1);