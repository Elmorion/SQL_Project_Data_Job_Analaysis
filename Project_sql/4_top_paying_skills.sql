/*  Question: Which are the highest payed skills? 
    - Use all skills
    - Look at the avg salary by the certain skill
    - Focus on roles with specified salarys (not Null)
    - Why?: It reveals how different skills impact salary 
        and helps identify the most financially rewarding skills
*/

SELECT 
    SD.skills,
    ROUND (AVG(JPS.salary_year_avg),0) AS avg_salary
   
FROM 
    job_postings_fact AS JPS

INNER JOIN skills_job_dim AS SJD ON SJD.job_id = JPS.job_id 
INNER JOIN skills_dim AS SD ON SD.skill_id = SJD.skill_id

WHERE
    JPS.salary_year_avg IS NOT NULL AND (
    JPS.job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst'
    )
GROUP BY 
    SD.skills

ORDER BY
    avg_salary DESC

Limit 25

/* 
Key Trends in Top-Paid Skills
Big Data and AI/ML

Skills: PySpark, Pandas, Numpy, Jupyter, Databricks, Scikit-learn, Airflow, Watson, DataRobot
Use Cases: These skills are crucial for processing large datasets, performing data analysis, 
and developing machine learning models. Industries like finance, healthcare, 
and tech rely on these skills for data-driven decision-making and AI solutions.
Cloud and DevOps

Skills: Bitbucket, GitLab, Kubernetes, Jenkins, GCP, Linux
Use Cases: These skills are essential for automating deployments, managing cloud infrastructure, and ensuring application scalability and reliability. 
They are highly valued in tech companies and startups focused on maintaining robust cloud environments.
Programming, Database Management, and Productivity Tools

Skills: Swift, Golang, Scala, Couchbase, PostgreSQL, Elasticsearch, Notion, Atlassian, Twilio
Use Cases: Programming skills are vital for developing mobile and backend applications. 
Database management skills ensure efficient data storage and retrieval. 
Productivity tools enhance team collaboration and project management, critical across various industries.


[
  {
    "skills": "pyspark",
    "avg_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.00"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.60"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.33"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.25"
  }
]
*/