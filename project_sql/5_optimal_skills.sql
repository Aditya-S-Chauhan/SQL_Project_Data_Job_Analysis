/*
Question: What are the most optimal skills to learn (aka skills in high demand AND high pay)?
    - Identify skills in high demand and associated with high average salaries for Data Analyst roles
    - Focus on roles with specified salaries in India.
    - Why? Targets skills that offer job secutity (high demand) and financial benefits (high salaies),
           offering insights for strategic career development in Data Analysis.
*/

/*
-- CTE modified from 3 and 4
WITH skills_demand AS (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE   
        job_title_short = 'Data Analyst' 
        AND job_country = 'India'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), average_salary AS ( 
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0)AS average_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE   
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_country = 'India'
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count >10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25

*/

-- Rewriting this same query more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0)AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_country = 'India'
    AND salary_year_avg IS NOT NULL
GROUP BY
        skills_dim.skill_id
HAVING 
     COUNT(skills_job_dim.job_id) > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25
