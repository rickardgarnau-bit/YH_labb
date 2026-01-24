DROP TABLE IF EXISTS course_grade CASCADE;
DROP TABLE IF EXISTS course_instance CASCADE;
DROP TABLE IF EXISTS attendance CASCADE;
DROP TABLE IF EXISTS student_info CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS teacher_course_rel CASCADE;
DROP TABLE IF EXISTS teacher CASCADE;
DROP TABLE IF EXISTS class CASCADE;
DROP TABLE IF EXISTS program_content CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS program CASCADE;
DROP TABLE IF EXISTS education_leader CASCADE;
DROP TABLE IF EXISTS school CASCADE;
DROP TABLE IF EXISTS postal_address CASCADE;
DROP TABLE IF EXISTS consultant CASCADE;
DROP TABLE IF EXISTS consultant_agency CASCADE;
DROP TABLE IF EXISTS employee_info CASCADE;
DROP TABLE IF EXISTS company CASCADE;
DROP TABLE IF EXISTS lia_placement CASCADE;

CREATE TABLE postal_address (
    postal_code VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(50)
);

CREATE TABLE course (
    course_code SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    yh_credits INTEGER,
    is_standalone BOOLEAN,
    description TEXT
);

CREATE TABLE school (
    school_id SERIAL PRIMARY KEY,
    address VARCHAR(50),
    postal_code VARCHAR(10) REFERENCES postal_address (postal_code),
    email VARCHAR(100),
    phone_nr VARCHAR(20)
);

ALTER TABLE school
ADD CONSTRAINT check_valid_phone_school CHECK (phone_nr ~ '^[0-9+\- ]+$');

CREATE TABLE company (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    industry VARCHAR(50),
    email VARCHAR(100),
    postal_code VARCHAR(10) REFERENCES postal_address(postal_code)
);

ALTER TABLE company
ADD CONSTRAINT check_valid_email_company CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

CREATE TABLE consultant_agency (
    agency_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    org_nr VARCHAR(20),
    has_f_tax_card BOOLEAN,
    address VARCHAR(50),
    postal_code VARCHAR(10) REFERENCES postal_address (postal_code),
    email VARCHAR(100),
    phone_nr VARCHAR(20)
);

ALTER TABLE consultant_agency
ADD CONSTRAINT check_valid_email_agency CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

ALTER TABLE consultant_agency
ADD CONSTRAINT check_valid_phone_agency CHECK (phone_nr ~ '^[0-9+\- ]+$');

CREATE TABLE education_leader (
    leader_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    school_id INTEGER REFERENCES school (school_id),
    email VARCHAR(100),
    phone_nr VARCHAR(20)
);

ALTER TABLE education_leader
ADD CONSTRAINT check_valid_email_leader CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

ALTER TABLE education_leader
ADD CONSTRAINT check_valid_phone_leader CHECK (phone_nr ~ '^[0-9+\- ]+$');

CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    school_id INTEGER REFERENCES school (school_id),
    email VARCHAR(100),
    phone_nr VARCHAR(20)
);

ALTER TABLE teacher
ADD CONSTRAINT check_valid_email_teacher CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

ALTER TABLE teacher
ADD CONSTRAINT check_valid_phone_teacher CHECK (phone_nr ~ '^[0-9+\- ]+$');

CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(50),
    school_id INTEGER REFERENCES school (school_id),
    education_leader_id INTEGER REFERENCES education_leader (leader_id),
    program_id INTEGER REFERENCES program (program_id),
    starting_date DATE,
    end_date DATE
);

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    class_id INTEGER REFERENCES class (class_id),
    status VARCHAR(20)
);

CREATE TABLE student_info (
    student_id INTEGER PRIMARY KEY REFERENCES student (student_id),
    social_sec_nr VARCHAR(20),
    address VARCHAR(50),
    postal_code VARCHAR(10) REFERENCES postal_address (postal_code),
    email VARCHAR(100),
    phone_nr VARCHAR(20)
);

ALTER TABLE student_info
ADD CONSTRAINT check_valid_phone_student CHECK (phone_nr ~ '^[0-9+\- ]+$');

ALTER TABLE student_info
ADD CONSTRAINT check_valid_email_student CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

CREATE TABLE employee_info (
    info_id SERIAL PRIMARY KEY,
    education_leader_id INTEGER REFERENCES education_leader (leader_id),
    teacher_id INTEGER REFERENCES teacher (teacher_id),
    email VARCHAR(100),
    salary INTEGER,
    is_consultant BOOLEAN,
    address VARCHAR(50),
    postal_code VARCHAR(10) REFERENCES postal_address (postal_code),
    phone_nr VARCHAR(20)
);

ALTER TABLE employee_info
ADD CONSTRAINT check_valid_email_employee CHECK (
    email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

ALTER TABLE employee_info
ADD CONSTRAINT check_valid_phone_employee CHECK (phone_nr ~ '^[0-9+\- ]+$');

CREATE TABLE consultant (
    teacher_id INTEGER PRIMARY KEY REFERENCES teacher (teacher_id),
    agency_id INTEGER REFERENCES consultant_agency (agency_id),
    hourly_rate INTEGER
);

CREATE TABLE lia_placement (
    lia_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student (student_id),
    company_id INTEGER REFERENCES company(company_id),
    start_date DATE,
    end_date DATE,
    supervisor_name VARCHAR(50),
    supervisor_phone VARCHAR(20),
    grade VARCHAR(10) DEFAULT 'Ej satt'
);

CREATE TABLE program_content (
    program_id INTEGER REFERENCES program (program_id),
    course_code INTEGER REFERENCES course (course_code),
    PRIMARY KEY (program_id, course_code)
);

CREATE TABLE course_instance (
    instance_id SERIAL PRIMARY KEY,
    course_code INTEGER REFERENCES course (course_code),
    class_id INTEGER REFERENCES class (class_id),
    term VARCHAR(20),
    start_date DATE,
    end_date DATE
);

CREATE TABLE teacher_course_rel (
    teacher_id INTEGER REFERENCES teacher (teacher_id),
    instance_id INTEGER REFERENCES course_instance (instance_id),
    PRIMARY KEY (teacher_id, instance_id)
);

CREATE TABLE attendance (
    student_id INTEGER REFERENCES student (student_id),
    instance_id INTEGER REFERENCES course_instance (instance_id),
    date DATE,
    status VARCHAR(20),
    PRIMARY KEY (student_id, instance_id, date)
);

CREATE TABLE course_grade (
    student_id INTEGER REFERENCES student (student_id),
    instance_id INTEGER REFERENCES course_instance (instance_id),
    grade VARCHAR(5),
    date DATE,
    points INTEGER,
    PRIMARY KEY (student_id, instance_id)
);