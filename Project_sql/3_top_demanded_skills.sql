/*  Question: Which skills are high on demand in general? 
    - Use all jobs
    - Add the specific skills required for these roles
    - Analyse wich skills are high on demand
    - Why?: It gives a detailed look at which skills are high on demand in gereral,
        helping job seekers understand which skills to develop.
*/


SELECT 
    SD.skills,
    Count(SD.skill_id) AS demand_count

FROM 
    job_postings_fact AS JPS

INNER JOIN skills_job_dim AS SJD ON SJD.job_id = JPS.job_id 
INNER JOIN skills_dim AS SD ON SD.skill_id = SJD.skill_id

WHERE
    JPS.job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst'
GROUP BY SD.skill_id

ORDER BY
    demand_count DESC

Limit 10