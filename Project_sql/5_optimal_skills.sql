/*
Question: What are the optimal skills to learn?
- dose high pay means high demand?
- concentrates on remote jobs
-Why? knowing wich skill is high on demand and offers high salaries
     can offer strategic insights for career development in data analysis
*/
SELECT
    skills_dim.skill_id,
    skills_dim.Skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = Skills_job_dim.job_id  
INNER JOIN skills_dim ON Skills_job_dim.skill_id = Skills_dim.skill_id
    WHERE
        job_postings_fact.salary_year_avg IS NOT NULL AND (
        job_postings_fact.job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst'
        )

GROUP BY skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
   -- skills_demand.demand_count DESC, 
    avg_salary DESC
    ,demand_count DESC 
LIMIT 25