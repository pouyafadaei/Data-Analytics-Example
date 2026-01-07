CREATE TABLE students
(
    student_id SERIAL PRIMARY KEY,
    inter_dom  VARCHAR(10) NOT NULL,
    stay       INT         NOT NULL,
    todep      INT,
    tosc       INT,
    toas       INT
);
