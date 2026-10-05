UPDATE people
SET email = 'nuevo.email@us.es'
WHERE person_id = 1;

UPDATE degrees
SET duration_years = duration_years + 1;

UPDATE professors
SET category = 'Titular'
WHERE category = 'AyudanteDoctor';

DELETE FROM people
WHERE person_id = 100;

DELETE FROM groups
WHERE activity = 'Teoría';

DELETE FROM grades
WHERE grade_value < 5;

DELETE FROM degrees WHERE degree_id = 1;
