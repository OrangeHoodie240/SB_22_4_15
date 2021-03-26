DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY, 
  galaxy_name TEXT NOT NULL);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY, 
  star_name TEXT NOT NULL, 
  galaxy_id INTEGER REFERENCES galaxies(id));

-- Can get galaxy from star. Might be better to reduplicate the information so it  
-- doesn't require an additional search against stars.
CREATE TABLE planets(
  id SERIAL PRIMARY KEY, 
  planet_name TEXT NOT NULL, 
  orbital_period_in_year INTEGER NOT NULL, 
  star_id INTEGER REFERENCES stars(id) NOT NULL);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY, 
  moon_name TEXT NOT NULL, 
  planet_id INTEGER REFERENCES planets(id));


INSERT INTO galaxies(galaxy_name)   
  VALUES('Milky Way');

INSERT INTO stars(star_name, galaxy_id) 
  VALUES ('Our Sun', 1);

INSERT INTO planets(planet_name, orbital_period_in_year, star_id)
  VALUES('Earth', 1, 1);

INSERT INTO moons(moon_name, planet_id)
  VALUES('Our Moon', 1);