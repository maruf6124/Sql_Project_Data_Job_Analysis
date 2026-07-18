/*
 🎯 Question: What are the most in-demand skills for Data Analysts?
 💡 Objective: Identify the top 5 most frequently requested skills in all job postings.
 🚀 Why: Helps job seekers focus on learning tools that offer the highest market volume.
 */
SELECT skills,
    count(job_postings_fact.job_id) as skill_count
from job_postings_fact
    inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
group by skills
order by skill_count desc
limit 10
    /*
     📊 Key Insights:
     1. SQL is the undisputed king of data skills with over 92,600+ job postings.
     2. Excel remains a massive requirement, ranking 2nd with more than 67,000+ mentions.
     3. Python strongly holds the 3rd spot (57,300+), solidifying its position alongside SQL for programming.
     4. Visualization tools are essential, led heavily by Tableau (46,500+) and followed by Power BI (39,400+).
     */