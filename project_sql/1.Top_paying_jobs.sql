/*
 🎯 Question: What are the top-paying data analyst jobs?
 💡 Objective: Find the top 10 highest-paying remote Data Analyst roles (excluding NULL salaries).
 🚀 Why: To highlight premium job opportunities and market trends for job seekers.
 */
SELECT job_id,
    job_title,
    job_location,
    salary_year_avg,
    job_schedule_type,
    name as company_name,
    job_posted_date
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10;
/*
 📊 Key Insights:
 1. Top Salary: The highest-paying remote data analyst role reaches up to $255,829 per year.
 2. Salary Benchmarks: All top 10 remote roles offer premium compensation, with salaries starting from $184,000+.
 3. Job Availability: Major tech and corporate companies (like AT&T and Pinterest) dominate the high-paying remote market.
 */