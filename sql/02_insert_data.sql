-- POSTADRESSER
INSERT INTO
    postal_address (postal_code, city)
VALUES
    ('111 22', 'Stockholm'),
    ('411 01', 'Göteborg'),
    ('211 15', 'Malmö'),
    ('981 30', 'Kiruna'),
    ('431 31', 'Mölndal'),
    ('417 55', 'Hisingen'),
    ('111 01', 'Stockholm'),
    ('123 45', 'Farsta'),
    ('901 20', 'Umeå'),
    ('172 69', 'Sundbyberg'), -- Tillagd för Skatteverket
    ('164 40', 'Kista');

-- Tillagd för Ericsson
-- SKOLOR
INSERT INTO
    school (address, postal_code, email, phone_nr)
VALUES
    (
        'Sveavägen 45',
        '111 22',
        'stockholm@yrkesco.se',
        '08-998877'
    ),
    (
        'Avenyn 10',
        '411 01',
        'goteborg@yrkesco.se',
        '031-112233'
    );

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
    ('DO24', 1, 1, 2, '2024-08-25', '2026-05-30'),
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
    student_info (
        student_id,
        social_sec_nr,
        address,
        postal_code,
        email
    )
VALUES
    (
        1,
        '19900101-0001',
        'Storgatan 1',
        '411 01',
        'erik.segersall@student.yrkesco.se'
    ),
    (
        2,
        '19920202-0002',
        'Lillgatan 2',
        '431 31',
        'anna.andersson@student.yrkesco.se'
    ),
    (
        3,
        '19950505-0003',
        'Hemvägen 10',
        '417 55',
        'olof.palme@student.yrkesco.se'
    ),
    (
        4,
        '19980808-0004',
        'Testgränd 4',
        '111 01',
        'astrid.lindgren@student.yrkesco.se'
    ),
    (
        5,
        '20000101-0006',
        'Fjärranvägen 99',
        '123 45',
        'evert.taube@student.yrkesco.se'
    ),
    (
        6,
        '20011228-0007',
        'Kernelvägen 1',
        '901 20',
        'linus.torvalds@student.yrkesco.se'
    );

-- ANSTÄLLD INFO
INSERT INTO
    employee_info (
        education_leader_id,
        teacher_id,
        email,
        salary,
        is_consultant,
        address,
        postal_code,
        phone_nr
    )
VALUES
    (
        1,
        NULL,
        'anna.andersson@yrkesco.se',
        45000,
        FALSE,
        'Villagatan 1',
        '111 22',
        '070-123 45 67'
    ),
    (
        2,
        NULL,
        'erik.eriksson@yrkesco.se',
        47000,
        FALSE,
        'Havsgatan 3',
        '411 01',
        '072-987 65 43'
    ),
    (
        NULL,
        1,
        'lars.larsson@yrkesco.se',
        38000,
        FALSE,
        'Lägenhetsvägen 4B',
        '111 22',
        '073-555 11 22'
    ),
    (
        NULL,
        2,
        'karin.k@konsultbolaget.se',
        0,
        TRUE,
        'Södra Vägen 99',
        '211 15',
        '076-333 44 55'
    );

-- KONSULTBYRÅ
INSERT INTO
    consultant_agency (
        name,
        org_nr,
        has_f_tax_card,
        address,
        postal_code,
        phone_nr,
        email
    )
VALUES
    (
        'IT-Resurs AB',
        '556123-4567',
        TRUE,
        'Konsultgatan 1',
        '111 22',
        '070-888 77 66',
        'info@itresurs.se'
    ),
    (
        'Webbproffsen HB',
        '969798-1122',
        TRUE,
        'Teknikgränd 5',
        '211 15',
        '079-111 22 33',
        'kontakt@webbproffsen.se'
    ),
    (
        'Norrlandskod AB',
        '556999-8888',
        TRUE,
        'Gruvvägen 12',
        '981 30',
        '0980-123 45',
        'hello@norrlandskod.se'
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

-- NÄRVARO
INSERT INTO
    attendance (student_id, instance_id, date, status)
VALUES
    (1, 1, '2023-09-02', 'Närvarande'),
    (1, 1, '2023-09-03', 'Närvarande'),
    (1, 1, '2023-09-04', 'Frånvarande'),
    (2, 1, '2023-09-02', 'Närvarande'),
    (2, 1, '2023-09-03', 'Närvarande');

-- BETYG
INSERT INTO
    course_grade (student_id, instance_id, grade, date, points)
VALUES
    (1, 1, 'VG', '2023-10-30', 48),
    (2, 1, 'G', '2023-10-30', 32),
    (3, 1, 'IG', '2023-10-30', 15);

-- LIA FÖRETAG (Nu med korrekt 3NF koppling till postal_address)
INSERT INTO
    company (company_name, industry, postal_code, email)
VALUES
    (
        'Volvo Cars',
        'Fordon',
        '411 01',
        'student@volvocars.com'
    ),
    (
        'Spotify',
        'Musikstreaming',
        '111 22',
        'hr@spotify.com'
    ),
    (
        'Skatteverket IT',
        'Myndighet',
        '172 69',
        'rekrytering@skatteverket.se'
    ),
    (
        'Ericsson',
        'Telekom',
        '164 40',
        'future@ericsson.com'
    ),
    (
        'IKEA Digital',
        'Retail',
        '211 15',
        'work@ikea.com'
    );

-- LIA PLACERINGAR
INSERT INTO
    lia_placement (
        student_id,
        company_id,
        start_date,
        end_date,
        supervisor_name,
        supervisor_phone
    )
VALUES
    (
        1,
        1,
        '2024-01-15',
        '2024-03-22',
        'Leif Öhman',
        '031-123 45 67'
    ),
    (
        2,
        2,
        '2024-01-15',
        '2024-03-22',
        'Daniel Ekman',
        '08-555 666 77'
    ),
    (
        3,
        3,
        '2024-01-15',
        '2024-03-22',
        'Maria Kjellander',
        '010-112 23 34'
    ),
    (
        4,
        4,
        '2024-01-15',
        '2024-03-22',
        'Bengt Karlsson',
        '070-999 88 77'
    ),
    (
        5,
        5,
        '2024-01-15',
        '2024-03-22',
        'Kamprad Jr',
        '040-123 12 12'
    );