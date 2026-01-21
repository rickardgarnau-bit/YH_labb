-- POSTADRESSER
INSERT INTO
    postal_address (postal_code, city)
VALUES
    ('111 22', 'Stockholm'),
    ('411 01', 'Göteborg'),
    ('211 15', 'Malmö'),
    ('981 30', 'Kiruna'),
    ('41101', 'Göteborg'),
    ('43131', 'Mölndal'),
    ('41755', 'Hisingen'),
    ('11101', 'Stockholm'),
    ('12345', 'Farsta');

-- SKOLOR
INSERT INTO
    school (address, postal_code)
VALUES
    ('Sveavägen 45', '111 22'),
    ('Avenyn 10', '411 01');

-- PROGRAM
INSERT INTO
    program (program_name)
VALUES
    ('Data Engineer'),
    ('DevOps Engineer');

-- KURSER
INSERT INTO
    course (
        course_name,
        yh_credits,
        is_standalone,
        description
    )
VALUES
    ('Programming', 50, FALSE, 'Python'),
    ('Cloud Computing', 30, FALSE, 'Azure');

-- UTBILDNINGSLEDARE
INSERT INTO
    education_leader (first_name, last_name, school_id)
VALUES
    ('Anna', 'Andersson', 1),
    ('Erik', 'Eriksson', 2);

-- LÄRARE
INSERT INTO
    teacher (first_name, last_name, school_id)
VALUES
    ('Lars', 'Larsson', 1),
    ('Karin', 'Karlsson', 1),
    ('Per', 'Persson', 2);

-- KLASSER
INSERT INTO
    class (
        class_name,
        school_id,
        education_leader_id,
        program_id,
        starting_date,
        end_date
    )
VALUES
    ('DE23', 1, 1, 1, '2023-08-20', '2025-06-05'),
    ('DE24', 1, 2, 1, '2024-08-19', '2026-06-04'),
    ('DO24', 1, 1, 2, '2024-08-25', '2026-05-30');

-- FRISTÅENDE KURS
INSERT INTO
    class (
        class_name,
        school_id,
        education_leader_id,
        program_id,
        starting_date,
        end_date
    )
VALUES
    (
        'Python Grundkurs',
        1,
        1,
        NULL,
        '2024-09-02',
        '2024-11-01'
    );

-- STUDENTER
INSERT INTO
    student (first_name, last_name, class_id)
VALUES
    ('Erik', 'Segersäll', 1),
    ('Anna', 'Andersson', 1),
    ('Olof', 'Palme', 1),
    ('Astrid', 'Lindgren', 2),
    ('Evert', 'Taube', 3),
    ('Linus', 'Torvalds', 3);

-- STUDENTUPPGIFTER
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
        is_consultant,
        address,
        postal_code
    )
VALUES
    (
        1,
        NULL,
        'anna.andersson@yrkesco.se',
        45000,
        FALSE,
        'Villagatan 1',
        '111 22'
    );

INSERT INTO
    employee_info (
        education_leader_id,
        teacher_id,
        email,
        salary,
        is_consultant,
        address,
        postal_code
    )
VALUES
    (
        2,
        NULL,
        'erik.eriksson@yrkesco.se',
        47000,
        FALSE,
        'Havsgatan 3',
        '411 01'
    );

INSERT INTO
    employee_info (
        education_leader_id,
        teacher_id,
        email,
        salary,
        is_consultant,
        address,
        postal_code
    )
VALUES
    (
        NULL,
        1,
        'lars.larsson@yrkesco.se',
        38000,
        FALSE,
        'Lägenhetsvägen 4B',
        '111 22'
    );

INSERT INTO
    employee_info (
        education_leader_id,
        teacher_id,
        email,
        salary,
        is_consultant,
        address,
        postal_code
    )
VALUES
    (
        NULL,
        2,
        'karin.k@konsultbolaget.se',
        0,
        TRUE,
        'Södra Vägen 99',
        '211 15' -- Konsult som bor i Malmö men pendlar till Stockholm
    );

-- KONSULTBYRÅ
INSERT INTO
    consultant_agency (
        name,
        org_nr,
        has_f_tax_card,
        address,
        postal_code
    )
VALUES
    (
        'IT-Resurs AB',
        '556123-4567',
        TRUE,
        'Konsultgatan 1',
        '111 22'
    ),
    (
        'Webbproffsen HB',
        '969798-1122',
        TRUE,
        'Teknikgränd 5',
        '211 15'
    ),
    (
        'Norrlandskod AB',
        '556999-8888',
        TRUE,
        'Gruvvägen 12',
        '981 30'
    );

-- KONSULT
INSERT INTO
    consultant (teacher_id, agency_id, hourly_rate)
VALUES
    (2, 1, 1200);

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

-- KOPPLING LÄRARE & KURSTILLFÄLLE
INSERT INTO
    teacher_course_rel (teacher_id, instance_id)
VALUES
    (1, 1),
    (2, 2);

-- NÄRVARO (ATTENDANCE)
INSERT INTO
    attendance (student_id, instance_id, date, status)
VALUES
    (1, 1, '2023-09-02', 'Närvarande'),
    (1, 1, '2023-09-03', 'Närvarande'),
    (1, 1, '2023-09-04', 'Frånvarande'),
    (2, 1, '2023-09-02', 'Närvarande'),
    (2, 1, '2023-09-03', 'Närvarande');

-- BETYG (COURSE_GRADE)
INSERT INTO
    course_grade (student_id, instance_id, grade, date, points)
VALUES
    (1, 1, 'VG', '2023-10-30', 48),
    (2, 1, 'G', '2023-10-30', 32),
    (3, 1, 'IG', '2023-10-30', 15);