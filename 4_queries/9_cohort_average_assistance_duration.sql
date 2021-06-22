SELECT AVG(result.total_duration) as average_total_duration
  FROM (SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration
 FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
 GROUP BY cohorts.name) as result;