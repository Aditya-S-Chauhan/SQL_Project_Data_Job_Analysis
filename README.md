# Introduction
Dive into the data job market in India ! Focusing on data analyst roles in India, this project explores top-paying jobs, in demand skills, and where high demand meets high salary in data analutics.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the Indian data analyst job market more effectively, this project was born from a desire to pinppoint top-paid and in-demand skills, streamlining the work to find optimal jobs.

Data source is from  [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, and essential skills.

### The questions I wanted to answer through my SQL queries were:
1. What are the top paying Data Analyst jobs in India?
2. What skills are required for top paying Data Analyst jobs in India?
3. What are the most in-demand skills for Data Analysts in India?
4. What are the top skills based on salary? (globally)
5.  What are the most optimal skills to learn (aka skills in high demand AND high pay in India)?

# Tools I Used
For my deep dive into data analyst job market in India, I harnessed the power of the following key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQLz:** The chosen database management system, ideal for handling the job postings data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git and GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each queryfor this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs In India
To identify the highest-paying roles in India, I filtered data analyst positions in India by average yearly salary with location in India. This query highlights the high paying oppurtunities in the field in India.
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_country,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title_short = 'Data Analyst' AND
    job_country = 'India' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
Here's the breakdown of the top data analyst jobs in India:
- **Wide Salary Range:** Top 10 paying data analyst roles span from around $111k to $650k in India.
- **Employers:** Companies like Eagle Genomics, Deutsche Bank, Mantys and Bosch Group are among those offering high salaries in India.
- **Job Titles:** There is a wide variety if job titles, from Data Analyst to Data Architect, and even Staff Applied Research Engineer. 
# What I Learned
# Conclusions
