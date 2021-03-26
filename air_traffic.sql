
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries(
  id SERIAL PRIMARY KEY, 
  country_name TEXT NOT NULL);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY, 
  city_name TEXT NOT NULL, 
  country_id INTEGER REFERENCES countries(id) NOT NULL);

CREATE TABLE passengers(
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL, 
  last_name TEXT NOT NULL); 

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY, 
  airline_name TEXT NOT NULL);  

CREATE TABLE flights(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines(id),
  from_id INTEGER REFERENCES cities(id),
  to_id INTEGER REFERENCES cities(id), 
  departure TIMESTAMP NOT NULL, 
  arrival TIMESTAMP NOT NULl);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY, 
  seat TEXT NOT NULL, 
  flight_id INTEGER REFERENCES flights(id), 
  passenger_id INTEGER REFERENCES passengers(id));

INSERT INTO countries(country_name)
  VALUES('USA'), 
  ('Japan');

  INSERT INTO cities(city_name, country_id)
    VALUES('Orlando', 1), 
    ('Tokyo',2);

  INSERT INTO passengers(first_name, last_name)
    VALUES('Joseph', 'Joestar');

  INSERT INTO airlines(airline_name)
    VALUES('Joestar Express');

  INSERT INTO flights(airline_id, from_id, to_id, departure, arrival)
    VALUES(1, 1, 2, '1990-03-05 05:02:03', '1990-03-07 06:02:01');
  
  INSERT INTO tickets(seat, flight_id, passenger_id)
    VALUES('D3', 1, 1);