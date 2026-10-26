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








