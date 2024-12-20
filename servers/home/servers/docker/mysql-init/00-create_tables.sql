CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN NOT NULL DEFAULT FALSE,
    full_name VARCHAR(50) NOT NULL

);

CREATE TABLE pokemon (
    pokedex_number INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    attack INT NOT NULL,
    defense INT NOT NULL,
    hp INT NOT NULL,
    speed INT NOT NULL,
    sp_attack INT NOT NULL,
    sp_defense INT NOT NULL,
    type1 VARCHAR(50) NOT NULL,
    type2 VARCHAR(50),
    abilities TEXT,
    capture_rate VARCHAR(50),
    weight_kg FLOAT,
    height_m FLOAT,
    classfication VARCHAR(255),
    generation INT NOT NULL,
    is_legendary BOOLEAN NOT NULL,
    PRIMARY KEY (pokedex_number)
);

CREATE TABLE user_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pokemon_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokedex_number) ON DELETE CASCADE
);
