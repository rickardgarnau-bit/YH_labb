-- Lista över alla elever
SELECT
    s.first_name || ' ' || s.last_name AS Student,
    c.class_name AS Klass,
    COALESCE(p.program_name, 'Fristående Kurs') AS Program
FROM
    student s
    JOIN class c ON s.class_id = c.class_id
    LEFT JOIN program p ON c.program_id = p.program_id;

-- Vem tjänar mest?
SELECT
    -- Vi hämtar namnet från rätt tabell beroende på vem det är genom 'COALSCE'
    COALESCE(
        t.first_name || ' ' || t.last_name,
        el.first_name || ' ' || el.last_name
    ) AS Namn,
    ei.salary AS Lön,
    ei.email
FROM
    employee_info ei
    LEFT JOIN teacher t ON ei.teacher_id = t.teacher_id
    LEFT JOIN education_leader el ON ei.education_leader_id = el.leader_id
WHERE
    ei.salary > 40000
ORDER BY
    ei.salary DESC;

-- Konsulter som tjänar mer än 1000 kr/h
SELECT
    t.first_name || ' ' || t.last_name AS Konsult,
    ca.name AS Bolag,
    co.hourly_rate AS Timpris
FROM
    consultant co
    JOIN teacher t ON co.teacher_id = t.teacher_id
    JOIN consultant_agency ca ON co.agency_id = ca.agency_id
WHERE
    co.hourly_rate > 1000;

-- Lägst poängsnitt först
SELECT
    c.course_name AS Kurs,
    ROUND(AVG(cg.points), 1) AS Snittpoäng
FROM
    course_grade cg
    JOIN course_instance ci ON cg.instance_id = ci.instance_id
    JOIN course c ON ci.course_code = c.course_code
GROUP BY
    c.course_name
ORDER BY
    Snittpoäng ASC;

-- Frånvarande elever
SELECT
    s.first_name || ' ' || s.last_name AS Student,
    COUNT(*) AS Antal_Frånvarodagar
FROM
    attendance a
    JOIN student s ON a.student_id = s.student_id
WHERE
    a.status = 'Frånvarande'
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name;

-- Vem gör LIA var?
SELECT
    s.first_name AS "Förnamn",
    s.last_name AS "Efternamn",
    c.company_name AS "Företag",
    c.city AS "Ort",
    l.supervisor_name AS "Handledare",
    l.start_date AS "Startdatum",
    l.end_date AS "Slutdatum"
FROM
    student s
    JOIN lia_placement l ON s.student_id = l.student_id
    JOIN company c ON l.company_id = c.company_id
ORDER BY
    c.company_name;