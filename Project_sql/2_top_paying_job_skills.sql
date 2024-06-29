/*  Question: Which skills are needed for these top paying jobs? 
    - Use the top 10 paying jobs from first query
    - Add the specific skills required for these roles
    - Why?: It gives a detailed look at which skills are demanded for these high paying jobs,
        helping job seekers understand which skills to develop that align with top salaries.
*/



WITH top_paying_jobs AS (
SELECT 
    JPS.job_id,
    JPS.job_title_short AS job_title,
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
)

SELECT 
    top_paying_jobs.*,
    SD.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS SJD ON SJD.job_id = top_paying_jobs.job_id 
INNER JOIN skills_dim AS SD ON SD.skill_id = SJD.skill_id
ORDER BY
    salary_year_avg DESC

/* 
sql is leading with a bold count of 8.
python follows with a count of 7.
Tableau is also high on demand with a count of 6.
other skills like r, excel, pandas and snowflake show varying degrees of demand.

[
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]
*/