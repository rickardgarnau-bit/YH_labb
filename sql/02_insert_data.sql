INSERT INTO
    postal_address (postal_code, city)
VALUES
    ('41755', 'Göteborg'),
    ('11763', 'Stockholm');

INSERT INTO
    school (address, postal_code)
VALUES
    ('Lindholmen 1', '41755'),
    ('Liljeholmsgränd 7', '11763');

INSERT INTO
    program (program_name)
VALUES
    ('Data Engineer') ('DevOps Engineer');

INSERT INTO
    course (course_name, is_standalone, description)
VALUES
    ('Programming', FALSE, 'Python'),
    ('Cloud Computing', FALSE, 'Azure');

INSERT INTO
    education_leader (first_name, last_name, school_id)
VALUES
    ('Bosse', 'Andersson', 1),
    ('Bojan', 'Djordjic', 2);

INSERT INTO
    teacher (first_name, last_name, school_id)
VALUES
    ('Bruno', 'Mars', 1),
    ('George', 'Foreman' 1) ('Marko', 'Lehtosalo', 2);

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

INSERT INTO
    student (class_id)
VALUES
    ((1), (1), (1)),
    ((2), (2));

INSERT INTO
    student_info (social_sec_nr, address, postal_code)
VALUES
    (1, '19900101-0001', 'Storgatan 1', '41101'),
    (2, '19920202-0002', 'Lillgatan 2', '43131'),
    (3, '19950505-0003', 'Hemvägen 10', '41755'),
    (4, '19980808-0004', 'Testgränd 4', '11101'),
    (5, '20000101-0006', 'Fjärranvägen 99', '12345');