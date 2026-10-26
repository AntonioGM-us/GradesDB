-- 
-- Autor: [Antonio Gutiérrez Montaño]
-- Fecha: Octubre 2026
-- Descripción: Consultas SQL de ejemplo para GradesDB
--              Cubre conceptos de consultas simples y avanzadas
-- 

USE gradesdb;

/*Consulta 1*/
SELECT * 
FROM subjects;

/*Consulta 2*/
SELECT *
FROM subjects s
WHERE s.acronym =  'IISSI-1';

/*Consulta 3*/
SELECT s.subject_name, s.acronym
FROM subjects s;

/*Consulta 4*/
SELECT s.subject_name, s.acronym
FROM subjects s
WHERE subject_type = 'Formación Básica'; 

/*Consulta 5*/
SELECT p.first_name, p.last_name, st.access_method
FROM students st
JOIN people p ON st.student_id = p.person_id
WHERE st.access_method = 'Selectividad';

/*Consulta 6*/
SELECT p.first_name, p.last_name, pr.category
FROM professors pr
JOIN people p ON pr.professor_id = p.person_id
WHERE pr.category = 'Catedrático';

/*VISTAS*/

CREATE OR REPLACE VIEW v_professors AS
SELECT 
    pr.professor_id,
    pr.category,
    p.person_id,
    p.dni,
    p.first_name,
    p.last_name,
    p.age,
    p.email
FROM professors pr
JOIN people p ON pr.professor_id = p.person_id;

CREATE OR REPLACE VIEW v_students AS
SELECT 
    st.student_id,
    st.access_method,
    p.person_id,
    p.dni,
    p.first_name,
    p.last_name,
    p.age,
    p.email
FROM students st
JOIN people p ON st.student_id = p.person_id;

/*Consulta 7*/
SELECT AVG(g.grade_value) AS average_grade
FROM grades g
WHERE g.group_id = 1;

/*Consulta 8*/
SELECT SUM(s.credits) AS total_credits
FROM subjects s 
WHERE s.degree_id = 3;

/*Consulta 9*/
SELECT COUNT(*) AS total_students
FROM students;

/*Consulta 10*/
SELECT activity, COUNT(*) AS total_groups
FROM groups
GROUP BY activity;

/*Consulta 11*/
SELECT MAX(g.grade_value) AS max_grade
FROM grades g;

/*Consulta 12*/
SELECT MIN(g.grade_value) AS min_grade
FROM grades g;

/*Consulta 13*/
SELECT g.grade_id, g.grade_value, g.exam_call
FROM grades g
WHERE g.grade_value < 5 OR g.grade_value > 9;

/*Consulta 14*/
SELECT g.grade_id, g.grade_value, g.exam_call
FROM grades g
WHERE g.grade_value BETWEEN 5 AND 7;

/*Consulta 15*/
SELECT s.subject_name, s.credits
FROM subjects s
WHERE s.credits IN (6, 12);

/*Consulta 16*/
SELECT p.first_name, p.last_name, p.age
FROM people p
WHERE p.age BETWEEN 20 AND 30;

/*Consulta 17*/
SELECT DISTINCT g.group_name 
FROM groups g;

/*Consulta 18*/
SELECT DISTINCT s.subject_type
FROM subjects s;

/*Consulta 19*/
SELECT DISTINCT g.academic_year
FROM groups g
ORDER BY g.academic_year DESC;




