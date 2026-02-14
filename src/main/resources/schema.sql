-- ==============================
-- BOARDGAMES TABLE
-- ==============================
CREATE TABLE IF NOT EXISTS boardgames (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  level INT NOT NULL,
  minPlayers INT NOT NULL,
  maxPlayers VARCHAR(50) NOT NULL,
  gameType VARCHAR(50) NOT NULL,
  UNIQUE KEY unique_game_name (name)
);

-- ==============================
-- REVIEWS TABLE (PREVENT DUPLICATES)
-- ==============================
CREATE TABLE IF NOT EXISTS reviews (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  gameId BIGINT NOT NULL,
  text VARCHAR(1024) NOT NULL,
  CONSTRAINT game_review_fk 
    FOREIGN KEY (gameId) REFERENCES boardgames(id),
  UNIQUE KEY unique_review (gameId, text)
);

-- ==============================
-- SPRING SECURITY TABLES
-- ==============================
CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(50) NOT NULL PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
  enabled BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS authorities (
  username VARCHAR(50) NOT NULL,
  authority VARCHAR(50) NOT NULL,
  CONSTRAINT fk_authorities_users 
    FOREIGN KEY(username) REFERENCES users(username),
  UNIQUE KEY unique_authority (username, authority)
);

-- ==============================
-- INSERT BOARDGAMES (SAFE)
-- ==============================
INSERT IGNORE INTO boardgames (id, name, level, minPlayers, maxPlayers, gameType)
VALUES 
(1, 'Splendor', 3, 2, '4', 'Strategy Game'),
(2, 'Clue', 2, 1, '6', 'Strategy Game'),
(3, 'Linkee', 1, 2, '+', 'Trivia Game');

-- ==============================
-- INSERT REVIEWS (SAFE)
-- ==============================
INSERT IGNORE INTO reviews (gameId, text)
VALUES 
(1, 'A great strategy game. The one who collects 15 points first wins. Calculation skill is required.'),
(1, 'Collecting gemstones makes me feel like a wealthy merchant. Highly recommend!'),
(2, 'A detective game to guess the criminal, weapon, and place of the crime scene. It is more fun with more than 3 players.');

-- ==============================
-- INSERT USERS (SAFE)
-- ==============================
INSERT IGNORE INTO users (username, password, enabled)
VALUES 
('bugs', '$2a$10$7QJ5w0nCk6XxvRkQ9F0X5eJvV6YpYcX0bB6nE7hL9oP3sD1kM4uO2', true),
('daffy', '$2a$10$7QJ5w0nCk6XxvRkQ9F0X5eJvV6YpYcX0bB6nE7hL9oP3sD1kM4uO2', true);

INSERT IGNORE INTO authorities (username, authority)
VALUES 
('bugs', 'ROLE_USER'),
('daffy', 'ROLE_USER'),
('daffy', 'ROLE_MANAGER');
