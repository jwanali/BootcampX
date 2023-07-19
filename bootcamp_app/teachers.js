const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortName =`${process.argv[2] || 'JUL02'}`;
values = [cohortName]
pool.query(`SELECT teachers.name as teacher, cohorts.name
FROM teachers 
JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
group by teachers.name,  cohorts.name
ORDER BY teachers.name`,values )
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name}: ${user.teacher} `)
  })
}).catch(err => console.error('query error', err.stack));