/*
 ## 📌 Project query Overview
 This project query analyzes data analyst job postings to find the highest-paying remote jobs and the specific skills required for those roles. 
 
 ## 📊 Key Questions Answered
 1. What are the top 10 highest-paying Data Analyst jobs?
 2. What skills are required for these top-paying roles?
 */
with top_paying_jobs as (
    SELECT job_id,
        job_title_short,
        salary_year_avg,
        name as company_name,
        job_posted_date
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    limit 10
)
select top_paying_jobs.*,
    skills_dim.skills
from top_paying_jobs
    inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by top_paying_jobs.salary_year_avg desc;
/*
 📊 Key Insights:
 1. Core Skills: SQL is the absolute leader, appearing 8 times, followed closely by Python which appears 7 times.
 2. Visualization: Tableau is highly dominant, appearing 6 times, while Power BI appears 2 times.
 3. Cloud & Tools: R appears 4 times, while Snowflake, AWS, and Azure appear 2 times each in these top-paying roles.
 */