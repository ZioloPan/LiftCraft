INSERT INTO user (email, password, nickname, created_at) VALUES
                                                             ('bartosz@liftcraft.com', '$2a$10$testhash1', 'BartiLift', CURRENT_TIMESTAMP),
                                                             ('anna@liftcraft.com', '$2a$10$testhash2', 'AniaFit', CURRENT_TIMESTAMP),
                                                             ('john@liftcraft.com', '$2a$10$testhash3', 'JohnStrong', CURRENT_TIMESTAMP);

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
