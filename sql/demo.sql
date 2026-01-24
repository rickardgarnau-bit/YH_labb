INSERT INTO
    postal_address (postal_code, city)
VALUES
    ('852 30', 'Sundsvall');

INSERT INTO
    school (address, postal_code, email, phone_nr)
VALUES
    (
        'Storgatan 10',
        '852 30',
        'sundsvall@yrkesco.se',
        '060-123456'
    );

SELECT
    s.school_id,
    s.address,
    pa.city,
    s.email
FROM
    school s
    JOIN postal_address pa ON s.postal_code = pa.postal_code
WHERE
    pa.city = 'Sundsvall';