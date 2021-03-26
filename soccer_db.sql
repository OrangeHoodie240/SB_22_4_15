DROP DATABASE IF EXISTS soccer_db;
CREATE DATABASE soccer_db; 
\c soccer_db

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL);

CREATE TABLE players(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    team_id INTEGER REFERENCES teams(id));

CREATE TABLE seasons(  
    id SERIAL PRIMARY KEY,
    season_start DATE NOT NULL,
    season_end DATE NOT NULL);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    team_1 INTEGER REFERENCES teams(id) NOT NULL, 
    team_2 INTEGER REFERENCES teams(id) NOT NULL, 
    match_date DATE NOT NULL, 
    winning_team INTEGER NULL, 
    season_id INTEGER REFERENCES seasons(id) NOT NULL);

CREATE TABLE goals(
    player_id INTEGER REFERENCES players(id) NOT NULL, 
    match_id INTEGER REFERENCES matches(id) NOT NULL);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NUll);

CREATE TABLE referees_to_games(
    referee_id INTEGER REFERENCES referees(id) NOT NULL, 
    match_id INTEGER REFERENCES matches(id) NOT NULL);

-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
-- ranking query included at the bottom
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

INSERT INTO teams(team_name) 
    VALUES('Jaggers'), 
    ('Red Dragons');

INSERT INTO players(first_name, last_name, team_id)
    VALUES('Jotaro', 'Kujo', 1),
    ('Dio', 'Brando', 2);

INSERT INTO seasons(season_start, season_end)
    VALUES('2020-1-1', '2020-12-31');

INSERT INTO matches(team_1, team_2, match_date, winning_team, season_id)
    VALUES(1, 2, '2020-1-1', 1, 1),
    (2, 1, '2020-1-2', 2, 1),
    (1, 2, '2020-1-3', 1, 1);

INSERT INTO goals(player_id, match_id)
    VALUES(1, 1); 

INSERT INTO referees(first_name, last_name)
    VALUES('Giorno', 'Giovana');

INSERT INTO referees_to_games(referee_id, match_id)
    VALUES(1,1);

-- ranking query
-- teams that failed to win at least game are ommited 
SELECT t.team_name, COUNT(*) AS games_won FROM teams t
    JOIN matches m
    ON t.id = m.team_1
    WHERE m.season_id = 1 AND t.id = m.winning_team
    GROUP BY t.team_name
    ORDER BY COUNT(*) DESC;