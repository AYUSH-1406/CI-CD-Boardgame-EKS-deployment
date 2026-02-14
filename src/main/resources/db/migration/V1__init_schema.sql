CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(50) PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
  enabled BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS authorities (
  username VARCHAR(50) NOT NULL,
  authority VARCHAR(50) NOT NULL,
  CONSTRAINT fk_authorities_users
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users (username, password, enabled)
VALUES ('bugs', '$2a$10$7QJ5w0nCk6XxvRkQ9F0X5eJvV6YpYcX0bB6nE7hL9oP3sD1kM4uO2', true)
ON DUPLICATE KEY UPDATE username=username;

INSERT INTO authorities (username, authority)
VALUES ('bugs', 'ROLE_USER')
ON DUPLICATE KEY UPDATE username=username;
