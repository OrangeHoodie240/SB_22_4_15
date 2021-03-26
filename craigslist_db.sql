DROP DATABASE IF EXISTS craigslist_db; 
CREATE DATABASE craigslist_db; 
\c craigslist_db

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL);

CREATE TABLE users(
    id SERIAL PRIMARY KEY, 
    username TEXT NOT NULL,
    pass_hash TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions(id) ON DELETE SET NULL NOT NULL);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY, 
    category_name TEXT NOT NULL);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, 
    post_text TEXT NOT NULL, 
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL, 
    region_id INTEGER REFERENCES regions(id) ON DELETE CASCADE NOT NULL,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE NOT NULL);

INSERT INTO regions(region_name)
    VALUES('Orlando');

INSERT INTO users(username, pass_hash, preferred_region_id)
    VALUES('zardu500', '1jds9ajJDF@!', 1);

INSERT INTO categories(category_name)
    VALUES('Cars');

INSERT INTO posts(title, post_text, user_id, region_id, category_id)
    VALUES('Mustang for sale', 'Red brand new all the bells and whistles. Dont ask how much it costs, you cant afford it I just want to show it off', 1,1,1);
