USE grades_db;
DELIMITER //

/*EJEMPLO 1*/
-- Devuelve la nota media del alumno (0 si no tiene notas)
CREATE OR REPLACE FUNCTION f_student_average(
    p_student_id INT
) RETURNS DECIMAL(4,2)
BEGIN
    DECLARE v_average DECIMAL(4,2) DEFAULT 0;

    -- Sin notas, AVG devuelve NULL: COALESCE lo cambia por 0
    SELECT COALESCE(AVG(grade_value), 0) INTO v_average
    FROM grades
    WHERE student_id = p_student_id;

    RETURN v_average;
END //

/*EJEMPLO 2*/
-- RN07: indica si el alumno está matriculado en la asignatura.
-- La usa el trigger t_biu_students_groups_rn04_rn07
CREATE OR REPLACE FUNCTION f_is_student_enrolled(
    p_student_id INT,
    p_subject_id INT
)
RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_exists INT;
    SELECT COUNT(*) INTO v_exists
    FROM students_subjects
    WHERE student_id = p_student_id
    AND subject_id = p_subject_id;
    RETURN v_exists > 0;
END //
