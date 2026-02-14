CREATE TABLE IF NOT EXISTS boardgames (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  level INT NOT NULL,
  minPlayers INT NOT NULL,
  maxPlayers VARCHAR(50) NOT NULL,
  gameType VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS reviews (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  gameId BIGINT NOT NULL,
  text VARCHAR(1024) NOT NULL,
  CONSTRAINT game_review_fk 
    FOREIGN KEY (gameId) REFERENCES boardgames(id)
);


insert into boardgames (name, level, minPlayers, maxPlayers, gameType)
values ('Splendor', 3, 2, '4', 'Strategy Game');
 
insert into boardgames (name, level, minPlayers, maxPlayers, gameType)
values ('Clue', 2, 1, '6', 'Strategy Game'); 

insert into boardgames (name, level, minPlayers, maxPlayers, gameType)
values ('Linkee', 1, 2, '+', 'Trivia Game'); 
 
insert into reviews (gameId, text)
values (1, 'A great strategy game. The one who collects 15 points first wins. Calculation skill is required.');

insert into reviews (gameId, text)
values (1, 'Collecting gemstones makes me feel like a wealthy merchant. Highly recommend!');
 
insert into reviews (gameId, text)
values (2, 'A detective game to guess the criminal, weapon, and place of the crime scene. It is more fun with more than 3 players.');
