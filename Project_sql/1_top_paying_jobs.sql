/*  Question: Finding the top 10 best paying remote jobs for a Data Analysts
    - Where the salary is specified (not NULL) and the location dosnt matter(Anywhere). 
    - Why?: Highlight the top-paying opportunities for Data Analysts, offering insigths into employment opportunities 
*/

SELECT 
    JPS.job_id,
    JPS.job_title_short,
    JPS.job_title,
    JPS.salary_year_avg,
    JPS.job_location,
    JPS.job_schedule_type,
    CD.name AS company_name
FROM 
    job_postings_fact AS JPS
LEFT JOIN company_dim AS CD ON CD.company_id = JPS.company_id
WHERE
    salary_year_avg IS NOT NULL AND 
    JPS.job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
LIMIT 10