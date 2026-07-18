/*
🎯 Question: What are the top skills based on salary?
💡 Objective: Find the top 25 skills with the highest average salary for Data Analysts.
🚀 Why: To understand which niche or specialized skills are linked to premium compensation.
*/

SELECT
    skills,
    round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL
group by skills
order by avg_salary desc
limit 10

/*
📊 Key Insights (Data Observations):
1. Niche Outliers: SVN leads with an average of $400,000, followed by Solidity ($179,000) and Couchbase ($160,515).
2. Developer/DevOps Tools: High salaries are tied to engineering skills like Golang ($155,000), Terraform ($146,734), and VMware ($147,500).
3. Important Note: These high averages are likely due to a very small number of high-paying, highly specialized job postings rather than high market demand. 
*/