SELECT teachers.name as teacher, cohorts.name, count(*) as total_assistances
FROM teachers 
JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02' 
group by teachers.name,  cohorts.name
ORDER BY teachers.name