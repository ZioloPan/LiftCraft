-- =========================
-- USERS
-- =========================
INSERT INTO user (email, password, nickname, created_at) VALUES
                                                             ('bartosz@liftcraft.com', '$2a$10$testhash1', 'BartiLift', CURRENT_TIMESTAMP),
                                                             ('anna@liftcraft.com', '$2a$10$testhash2', 'AniaFit', CURRENT_TIMESTAMP),
                                                             ('john@liftcraft.com', '$2a$10$testhash3', 'JohnStrong', CURRENT_TIMESTAMP);

-- =========================
-- DICTIONARIES
-- =========================
INSERT INTO muscle_group (tag, name) VALUES
                                         ('CHEST', 'Klatka piersiowa'),
                                         ('BACK', 'Plecy'),
                                         ('LEGS', 'Nogi'),
                                         ('SHOULDERS', 'Barki'),
                                         ('ARMS', 'Ramiona'),
                                         ('CORE', 'Brzuch'),
                                         ('FULL_BODY', 'Całe ciało');

INSERT INTO equipment (tag, name) VALUES
                                      ('BARBELL', 'Sztanga'),
                                      ('DUMBBELL', 'Hantle'),
                                      ('MACHINE', 'Maszyna'),
                                      ('CABLE', 'Wyciąg'),
                                      ('BODYWEIGHT', 'Masa ciała'),
                                      ('KETTLEBELL', 'Kettlebell'),
                                      ('BAND', 'Guma oporowa');

-- =========================
-- EXERCISES
-- =========================
INSERT INTO exercise (name, description, muscle_group_id, equipment_id, photo)
SELECT
    'Wyciskanie na ławce',
    'Wyciskanie sztangi na ławce poziomej',
    mg.id,
    eq.id,
    '/exercises/bench.jpg'
FROM muscle_group mg, equipment eq
WHERE mg.tag = 'CHEST' AND eq.tag = 'BARBELL';

INSERT INTO exercise (name, description, muscle_group_id, equipment_id, photo)
SELECT
    'Przysiad',
    'Przysiad ze sztangą na plecach',
    mg.id,
    eq.id,
    '/exercises/squat.jpg'
FROM muscle_group mg, equipment eq
WHERE mg.tag = 'LEGS' AND eq.tag = 'BARBELL';

INSERT INTO exercise (name, description, muscle_group_id, equipment_id, photo)
SELECT
    'Martwy ciąg',
    'Klasyczny martwy ciąg ze sztangą',
    mg.id,
    eq.id,
    '/exercises/deadlift.jpg'
FROM muscle_group mg, equipment eq
WHERE mg.tag = 'BACK' AND eq.tag = 'BARBELL';

INSERT INTO exercise (name, description, muscle_group_id, equipment_id, photo)
SELECT
    'Wyciskanie nad głowę',
    'Wyciskanie sztangi stojąc nad głowę',
    mg.id,
    eq.id,
    '/exercises/ohp.jpg'
FROM muscle_group mg, equipment eq
WHERE mg.tag = 'SHOULDERS' AND eq.tag = 'BARBELL';

INSERT INTO exercise (name, description, muscle_group_id, equipment_id, photo)
SELECT
    'Podciąganie na drążku',
    'Podciąganie nachwytem na drążku',
    mg.id,
    eq.id,
    '/exercises/pullup.jpg'
FROM muscle_group mg, equipment eq
WHERE mg.tag = 'BACK' AND eq.tag = 'BODYWEIGHT';

-- =========================
-- WORKOUT TEMPLATES
-- =========================
-- Bartosz (user_id from email)
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Push Day', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'bartosz@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Pull Day', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'bartosz@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Leg Day', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'bartosz@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Full Body', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'bartosz@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Upper Body', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'bartosz@liftcraft.com';

-- Anna
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Pośladki + Nogi', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'anna@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Góra ciała', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'anna@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Full Body Light', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'anna@liftcraft.com';

-- John
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Beginner Full Body', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'john@liftcraft.com';
INSERT INTO workout_template (user_id, name, created_at)
SELECT u.id, 'Upper Push', CURRENT_TIMESTAMP FROM user u WHERE u.email = 'john@liftcraft.com';

-- =========================
-- WORKOUT TEMPLATE ITEMS (Bartosz templates)
-- =========================
-- Push Day: Bench (1), OHP (2)
INSERT INTO workout_template_item (workout_template_id, exercise_id, order_index)
SELECT wt.id, e.id, 1
FROM workout_template wt, exercise e, user u
WHERE wt.user_id = u.id
  AND u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_template_item (workout_template_id, exercise_id, order_index)
SELECT wt.id, e.id, 2
FROM workout_template wt, exercise e, user u
WHERE wt.user_id = u.id
  AND u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie nad głowę';

-- Pull Day: Pull-up (1), Deadlift (2)
INSERT INTO workout_template_item (workout_template_id, exercise_id, order_index)
SELECT wt.id, e.id, 1
FROM workout_template wt, exercise e, user u
WHERE wt.user_id = u.id
  AND u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Pull Day'
  AND e.name = 'Podciąganie na drążku';

INSERT INTO workout_template_item (workout_template_id, exercise_id, order_index)
SELECT wt.id, e.id, 2
FROM workout_template wt, exercise e, user u
WHERE wt.user_id = u.id
  AND u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Pull Day'
  AND e.name = 'Martwy ciąg';

-- Leg Day: Squat (1)
INSERT INTO workout_template_item (workout_template_id, exercise_id, order_index)
SELECT wt.id, e.id, 1
FROM workout_template wt, exercise e, user u
WHERE wt.user_id = u.id
  AND u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Leg Day'
  AND e.name = 'Przysiad';

-- =========================
-- WORKOUT TEMPLATE SETS (preset sets for Push Day)
-- =========================
-- Bench sets for Push Day item
INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 1, 10, 60
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 2, 10, 60
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 3, 8, 70
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie na ławce';

-- OHP sets for Push Day item
INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 1, 10, 40
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie nad głowę';

INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 2, 10, 40
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie nad głowę';

INSERT INTO workout_template_set (template_item_id, order_index, reps, weight)
SELECT wti.id, 3, 8, 45
FROM workout_template_item wti
         JOIN workout_template wt ON wti.workout_template_id = wt.id
         JOIN exercise e ON wti.exercise_id = e.id
         JOIN user u ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day'
  AND e.name = 'Wyciskanie nad głowę';

-- =========================
-- WORKOUTS (sessions)
-- =========================
-- Push Day session from template
INSERT INTO workout (user_id, template_id, name, started_at, ended_at, created_at)
SELECT u.id, wt.id, 'Push Day - poniedziałek', NOW() - INTERVAL 1 HOUR, NOW(), CURRENT_TIMESTAMP
FROM user u
    JOIN workout_template wt ON wt.user_id = u.id
WHERE u.email = 'bartosz@liftcraft.com'
  AND wt.name = 'Push Day';

-- Hotel workout (no template)
INSERT INTO workout (user_id, template_id, name, notes, started_at, created_at)
SELECT u.id, NULL, 'Szybki trening hotelowy', 'Krótki trening podczas wyjazdu', NOW(), CURRENT_TIMESTAMP
FROM user u
WHERE u.email = 'bartosz@liftcraft.com';

-- =========================
-- WORKOUT EXERCISES
-- =========================
-- Add exercises to "Push Day - poniedziałek"
INSERT INTO workout_exercise (workout_id, exercise_id, order_index)
SELECT w.id, e.id, 1
FROM workout w, exercise e
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_exercise (workout_id, exercise_id, order_index)
SELECT w.id, e.id, 2
FROM workout w, exercise e
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie nad głowę';

-- Add exercises to "Szybki trening hotelowy"
INSERT INTO workout_exercise (workout_id, exercise_id, order_index)
SELECT w.id, e.id, 1
FROM workout w, exercise e
WHERE w.name = 'Szybki trening hotelowy'
  AND e.name = 'Podciąganie na drążku';

INSERT INTO workout_exercise (workout_id, exercise_id, order_index)
SELECT w.id, e.id, 2
FROM workout w, exercise e
WHERE w.name = 'Szybki trening hotelowy'
  AND e.name = 'Martwy ciąg';

-- =========================
-- WORKOUT SETS
-- =========================
-- Sets for Bench in "Push Day - poniedziałek" (order_index required!)
INSERT INTO workout_set (workout_exercise_id, order_index, reps, weight)
SELECT we.id, 1, 12, 60
FROM workout_exercise we
         JOIN workout w ON we.workout_id = w.id
         JOIN exercise e ON we.exercise_id = e.id
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_set (workout_exercise_id, order_index, reps, weight)
SELECT we.id, 2, 10, 70
FROM workout_exercise we
         JOIN workout w ON we.workout_id = w.id
         JOIN exercise e ON we.exercise_id = e.id
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie na ławce';

INSERT INTO workout_set (workout_exercise_id, order_index, reps, weight)
SELECT we.id, 3, 8, 80
FROM workout_exercise we
         JOIN workout w ON we.workout_id = w.id
         JOIN exercise e ON we.exercise_id = e.id
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie na ławce';

-- Sets for OHP in "Push Day - poniedziałek"
INSERT INTO workout_set (workout_exercise_id, order_index, reps, weight)
SELECT we.id, 1, 10, 40
FROM workout_exercise we
         JOIN workout w ON we.workout_id = w.id
         JOIN exercise e ON we.exercise_id = e.id
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie nad głowę';

INSERT INTO workout_set (workout_exercise_id, order_index, reps, weight)
SELECT we.id, 2, 8, 45
FROM workout_exercise we
         JOIN workout w ON we.workout_id = w.id
         JOIN exercise e ON we.exercise_id = e.id
WHERE w.name = 'Push Day - poniedziałek'
  AND e.name = 'Wyciskanie nad głowę';
