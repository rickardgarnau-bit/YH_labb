CREATE TABLE
    postal_address (
        postal_code VARCHAR(10) PRIMARY KEY,
        city VARCHAR(50)
    );

CREATE TABLE
    school (
        school_id SERIAL PRIMARY KEY,
        address VARCHAR(50),
        postal_code VARCHAR(10) REFERENCES postal_address (postal_code)
    );

CREATE TABLE
    program (
        program_id SERIAL PRIMARY KEY,
        program_name VARCHAR(50)
    );

CREATE TABLE
    course (
        course_code SERIAL PRIMARY KEY,
        course_name VARCHAR(50),
        is_standalone BOOLEAN,
        description TEXT
    );

CREATE TABLE
    education_leader (
        leader_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        school_id INTEGER REFERENCES school (school_id)
    );

CREATE TABLE
    teacher (
        teacher_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        school_id INTEGER REFERENCES school (school_id)
    );

CREATE TABLE
    class (
        class_id SERIAL PRIMARY KEY,
        school_id INTEGER REFERENCES school (school_id),
        education_leader_id INTEGER REFERENCES education_leader (leader_id),
        program_id INTEGER REFERENCES program (program_id),
        starting_date DATE,
        end_date DATE
    );

CREATE TABLE
    student (
        student_id SERIAL PRIMARY KEY,
        class_id INTEGER REFERENCES class (class_id)
    );

CREATE TABLE
    student_info (
        student_id INTEGER PRIMARY KEY REFERENCES student (student_id),
        social_sec_nr VARCHAR(20),
        address VARCHAR(50),
        postal_code VARCHAR(10) REFERENCES postal_address (postal_code)
    );

CREATE TABLE
    employee_info (
        info_id SERIAL PRIMARY KEY,
        education_leader_id INTEGER REFERENCES education_leader (leader_id),
        teacher_id INTEGER REFERENCES teacher (teacher_id),
        email VARCHAR(100),
        salary INTEGER,
        is_consultant BOOLEAN
    );

CREATE TABLE
    consultant_agency (
        agency_id SERIAL PRIMARY KEY,
        name VARCHAR(50),
        org_nr VARCHAR(20),
        has_f_tax_card BOOLEAN
    );

CREATE TABLE
    consultant (
        teacher_id INTEGER PRIMARY KEY REFERENCES teacher (teacher_id),
        agency_id INTEGER REFERENCES consultant_agency (agency_id),
        hourly_rate INTEGER
    );

CREATE TABLE
    program_content (
        program_id INTEGER REFERENCES program (program_id),
        course_code INTEGER REFERENCES course (course_code),
        PRIMARY KEY (program_id, course_code)
    );

CREATE TABLE
    course_instance (
        instance_id SERIAL PRIMARY KEY,
        course_code INTEGER REFERENCES course (course_code),
        class_id INTEGER REFERENCES class (class_id),
        term VARCHAR(20),
        start_date DATE,
        end_date DATE
    );

CREATE TABLE
    teacher_course_rel (
        teacher_id INTEGER REFERENCES teacher (teacher_id),
        instance_id INTEGER REFERENCES course_instance (instance_id),
        PRIMARY KEY (teacher_id, instance_id)
    );

CREATE TABLE
    attendance (
        student_id INTEGER REFERENCES student (student_id),
        instance_id INTEGER REFERENCES course_instance (instance_id),
        date DATE,
        status VARCHAR(20),
        PRIMARY KEY (student_id, instance_id, date)
    );

CREATE TABLE
    course_grade (
        student_id INTEGER REFERENCES student (student_id),
        instance_id INTEGER REFERENCES course_instance (instance_id),
        grade VARCHAR(5),
        date DATE,
        points INTEGER,
        PRIMARY KEY (student_id, instance_id)
    );