CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password)
VALUES ('test', '$2y$10$vmTvS60oXSLJImAcJ2Iue58wd1V9qnXaTnjQYw5TUdgIRSM9d8Dy');
