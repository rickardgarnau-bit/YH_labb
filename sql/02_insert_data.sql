-- POSTADRESSER
INSERT INTO
    postal_address (postal_code, city)
VALUES
    ('41755', 'Göteborg'),
    ('11763', 'Stockholm'),
    ('41101', 'Göteborg'),
    ('43131', 'Mölndal'),
    ('11101', 'Stockholm'),
    ('12345', 'Farsta');

-- SKOLOR
INSERT INTO
    school (address, postal_code)
VALUES
    ('Lindholmen 1', '41755'),
    ('Liljeholmsgränd 7', '11763');

-- PROGRAM
INSERT INTO
    program (program_name)
VALUES
    ('Data Engineer'),
    ('DevOps Engineer');

-- KURSER
INSERT INTO
    course (course_name, is_standalone, description)
VALUES
    ('Programming', FALSE, 'Python'),
    ('Cloud Computing', FALSE, 'Azure');

-- UTBILDNINGSLEDARE
INSERT INTO
    education_leader (first_name, last_name, school_id)
VALUES
    ('Bosse', 'Andersson', 1),
    ('Bojan', 'Djordjic', 2);

-- LÄRARE
INSERT INTO
    teacher (first_name, last_name, school_id)
VALUES
    ('Bruno', 'Mars', 1),
    ('George', 'Foreman', 1),
    ('Marko', 'Lehtosalo', 2);

-- KLASSER
INSERT INTO
    class (
        school_id,
        education_leader_id,
        program_id,
        starting_date,
        end_date
    )
VALUES
    (1, 1, 1, '2023-08-20', '2025-06-05'),
    (1, 1, 2, '2023-08-20', '2025-06-05'),
    (2, 2, 1, '2023-09-01', '2025-06-10');

-- STUDENTER
INSERT INTO
    student (class_id)
VALUES
    (1),
    (1),
    (1), -- Tre studenter i klass 1
    (2),
    (2);

-- Två studenter i klass 2
-- Dessa får nu ID 1, 2, 3, 4, 5 automatiskt av SERIAL
INSERT INTO
    student_info (student_id, social_sec_nr, address, postal_code)
VALUES
    (1, '19900101-0001', 'Storgatan 1', '41101'),
    (2, '19920202-0002', 'Lillgatan 2', '43131'),
    (3, '19950505-0003', 'Hemvägen 10', '41755'),
    (4, '19980808-0004', 'Testgränd 4', '11101'),
    (5, '20000101-0006', 'Fjärranvägen 99', '12345');

-- ANSTÄLLD INFO
INSERT INTO
    employee_info (
        education_leader_id,
        teacher_id,
        email,
        salary,
        is_consultant
    )
VALUES
    (
        1,
        NULL,
        'bosse.andersson@yrkesco.se',
        45000,
        FALSE
    ),
    (
        2,
        NULL,
        'bojan.djordjic@yrkesco.se',
        46000,
        FALSE
    ),
    (NULL, 1, 'bruno.mars@yrkesco.se', 38000, FALSE),
    (NULL, 2, 'george.foreman@techkonsult.se', 0, TRUE), -- Konsult!
    (
        NULL,
        3,
        'marko.lehtosalo@yrkesco.se',
        39000,
        FALSE
    );

-- KONSULTBYRÅ
INSERT INTO
    consultant_agency (name, org_nr, has_f_tax_card)
VALUES
    ('TechUtbildarna AB', '556677-8899', TRUE);

-- KONSULT (George Foreman är lärare ID 2)
INSERT INTO
    consultant (teacher_id, agency_id, hourly_rate)
VALUES
    (2, 1, 1250);

-- PROGRAMINNEHÅLL
INSERT INTO
    program_content (program_id, course_code)
VALUES
    (1, 1),
    (1, 2);

-- KURSTILLFÄLLEN
INSERT INTO
    course_instance (course_code, class_id, term, start_date, end_date)
VALUES
    (1, 1, 'HT23', '2023-09-01', '2023-10-30'),
    (2, 1, 'HT23', '2023-11-01', '2023-12-20');