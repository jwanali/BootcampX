SELECT cohorts.name as cohort, sum(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP by cohort
ORDER by total_duration;