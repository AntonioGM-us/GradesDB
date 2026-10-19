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



