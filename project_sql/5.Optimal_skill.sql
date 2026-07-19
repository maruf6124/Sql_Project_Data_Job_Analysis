/*
 🎯 Question: What are the most optimal skills to learn (high demand + high salary)?
 💡 Objective: Identify skills with a strong job count (>10) and high average salaries for remote Data Analysts.
 🚀 Why: Provides strategic value for career growth by targeting tools that offer both financial reward and job volume.
 */
with skill_demand as (
    SELECT skills_dim.skill_id,
        skills,
        count(job_postings_fact.job_id) as skill_count
    from job_postings_fact
        inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_work_from_home = 'True'
    group by skills_dim.skill_id
),
avarage_salary as (
    SELECT skills_dim.skill_id,
        skills,
        round(avg(job_postings_fact.salary_year_avg), 0) as avg_salary
    from job_postings_fact
        inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        and job_work_from_home = 'True'
    group by skills_dim.skill_id
)
select skill_demand.skill_id,
    skill_demand.skills,
    skill_demand.skill_count,
    avarage_salary.avg_salary
from skill_demand
    inner join avarage_salary on skill_demand.skill_id = avarage_salary.skill_id
HAVING count(ski) > 10
order by avarage_salary.avg_salary desc,
    skill_demand.skill_count desc
    /*
     📊 Key Insights:
     1. High-Paying Languages: Go leads the optimal chart with an average salary of $115,320 (27 jobs), closely followed by Java at $106,906 (17 jobs).
     2. Cloud & Big Data Infrastructure: Tools like Snowflake ($112,948 / 37 jobs), Azure ($111,225 / 34 jobs), and AWS ($108,317 / 32 jobs) offer an excellent mix of high market volume and strong compensation.
     3. Business Intelligence & Analytics: Looker shows solid demand with 49 job postings and a highly competitive average salary of $103,795.
     */