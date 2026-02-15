DROP TABLE IF EXISTS workout_template_set;
DROP TABLE IF EXISTS workout_set;
DROP TABLE IF EXISTS workout_exercise;
DROP TABLE IF EXISTS workout;
DROP TABLE IF EXISTS workout_template_item;
DROP TABLE IF EXISTS workout_template;
DROP TABLE IF EXISTS exercise;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS muscle_group;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      email VARCHAR(100) NOT NULL UNIQUE,
                      password VARCHAR(255) NOT NULL,
                      nickname VARCHAR(50) NOT NULL,
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE muscle_group (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      tag VARCHAR(50) NOT NULL UNIQUE,
                      name VARCHAR(100) NOT NULL
);

CREATE TABLE equipment (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       tag VARCHAR(50) NOT NULL UNIQUE,
                       name VARCHAR(100) NOT NULL
);

CREATE TABLE exercise (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(150) NOT NULL,
                      description VARCHAR(1000),
                      muscle_group_id BIGINT NOT NULL,
                      equipment_id BIGINT NOT NULL,
                      photo VARCHAR(255),
                      CONSTRAINT fk_exercise_muscle_group
                          FOREIGN KEY (muscle_group_id) REFERENCES muscle_group(id),
                      CONSTRAINT fk_exercise_equipment
                          FOREIGN KEY (equipment_id) REFERENCES equipment(id)
);

CREATE TABLE workout_template (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      user_id BIGINT NOT NULL,
                      name VARCHAR(150) NOT NULL,
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      CONSTRAINT fk_template_user
                          FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE workout_template_item (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       workout_template_id BIGINT NOT NULL,
                       exercise_id BIGINT NOT NULL,
                       order_index BIGINT NOT NULL,
                       CONSTRAINT fk_template_item_template
                           FOREIGN KEY (workout_template_id) REFERENCES workout_template(id),
                       CONSTRAINT fk_template_item_exercise
                           FOREIGN KEY (exercise_id) REFERENCES exercise(id)
);

CREATE TABLE workout (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         user_id BIGINT NOT NULL,
                         template_id BIGINT NULL,
                         name VARCHAR(150) NOT NULL,
                         notes VARCHAR(2000),
                         started_at TIMESTAMP,
                         ended_at TIMESTAMP,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         CONSTRAINT fk_workout_user
                             FOREIGN KEY (user_id) REFERENCES user(id),
                         CONSTRAINT fk_workout_template
                             FOREIGN KEY (template_id) REFERENCES workout_template(id)
);

CREATE TABLE workout_exercise (
                                  id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                  workout_id BIGINT NOT NULL,
                                  exercise_id BIGINT NOT NULL,
                                  order_index BIGINT NOT NULL,
                                  CONSTRAINT fk_workout_exercise_workout
                                      FOREIGN KEY (workout_id) REFERENCES workout(id),
                                  CONSTRAINT fk_workout_exercise_exercise
                                      FOREIGN KEY (exercise_id) REFERENCES exercise(id)
);

CREATE TABLE workout_set (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             workout_exercise_id BIGINT NOT NULL,
                             order_index INT NOT NULL,
                             reps INT NOT NULL,
                             weight DOUBLE,
                             CONSTRAINT fk_set_workout_exercise
                                 FOREIGN KEY (workout_exercise_id) REFERENCES workout_exercise(id)
);

CREATE TABLE workout_template_set (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      template_item_id BIGINT NOT NULL,
                                      order_index INT NOT NULL,
                                      reps INT,
                                      weight DOUBLE,
                                      CONSTRAINT fk_template_set_item
                                          FOREIGN KEY (template_item_id) REFERENCES workout_template_item(id)
);