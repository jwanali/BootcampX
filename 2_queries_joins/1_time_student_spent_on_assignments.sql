SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';


 /* another answer

 SELECT SUM(assignment_submissions.duration) as total_duration
 FROM assignment_submissions 
 JOIN assignments ON assignment_submissions.assignment_id = assignments.id
 WHERE  assignment_submissions.student_id = (
  SELECT id FROM students WHERE name = 'Ibrahim Schimmel'
 );
 
 */