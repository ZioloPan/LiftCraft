DROP TABLE IF EXISTS exercise;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS muscle_group;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      email VARCHAR(100) NOT NULL UNIQUE,
                      password VARCHAR(255) NOT NULL,
                      nickname VARCHAR(50) NOT NULL,
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE muscle_group (
                              id INT AUTO_INCREMENT PRIMARY KEY,
                              tag VARCHAR(50) NOT NULL UNIQUE,
                              name VARCHAR(100) NOT NULL
);

CREATE TABLE equipment (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           tag VARCHAR(50) NOT NULL UNIQUE,
                           name VARCHAR(100) NOT NULL
);

CREATE TABLE exercise (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(150) NOT NULL,
                          description VARCHAR(1000),
                          muscle_group_id INT NOT NULL,
                          equipment_id INT NOT NULL,
                          photo VARCHAR(255),
                          CONSTRAINT fk_exercise_muscle_group
                              FOREIGN KEY (muscle_group_id) REFERENCES muscle_group(id),
                          CONSTRAINT fk_exercise_equipment
                              FOREIGN KEY (equipment_id) REFERENCES equipment(id)
);
