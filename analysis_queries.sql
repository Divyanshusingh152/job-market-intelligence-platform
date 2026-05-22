-- ============================================================
-- Job Market Intelligence Platform — Analysis Queries
-- ============================================================


-- Query 1: Top 10 Cities by Job Count
-- Business question: Which city has the most job opportunities?

SELECT 
    location,
    COUNT(*) AS job_count
FROM job_listings
GROUP BY location
ORDER BY job_count DESC
LIMIT 10;


-- ============================================================
-- Query 2: Top 10 Fresher-Friendly Industries
-- Business question: Which industry hires most freshers?

SELECT 
    industry,
    COUNT(*) AS fresher_jobs
FROM job_listings
WHERE exp_min <= 1
GROUP BY industry
ORDER BY fresher_jobs DESC
LIMIT 10;


-- ============================================================
-- Query 3: Industries Requiring Highest Experience
-- Business question: Which industries are hardest to enter?

SELECT 
    industry,
    ROUND(AVG(exp_min)::NUMERIC, 1) AS avg_experience,
    COUNT(*) AS total_jobs
FROM job_listings
WHERE exp_min IS NOT NULL
GROUP BY industry
HAVING COUNT(*) > 100
ORDER BY avg_experience DESC
LIMIT 10;


-- ============================================================
-- Query 4: Top 10 City + Industry Combinations
-- Business question: Which city + industry combo has most jobs?

SELECT 
    location,
    industry,
    COUNT(*) AS job_count
FROM job_listings
GROUP BY location, industry
ORDER BY job_count DESC
LIMIT 10;


-- ============================================================
-- Query 5: Industries with More Than 500 Job Listings
-- Business question: Which industries have more than 500 listings?

SELECT 
    industry,
    COUNT(*) AS job_count
FROM job_listings
GROUP BY industry
HAVING COUNT(*) > 500
ORDER BY job_count DESC;


-- ============================================================
-- Query 6: Job Roles with National Demand (5+ Cities)
-- Business question: Which roles appear in more than 5 cities?

SELECT 
    role,
    COUNT(DISTINCT location) AS city_count,
    COUNT(*) AS total_jobs
FROM job_listings
WHERE role IS NOT NULL
GROUP BY role
HAVING COUNT(DISTINCT location) > 5
ORDER BY city_count DESC
LIMIT 10;


-- ============================================================
-- Query 7: Industries Ranked by Job Count (Window Function)
-- Business question: Rank all industries by job count.

SELECT 
    industry,
    COUNT(*) AS job_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS industry_rank
FROM job_listings
GROUP BY industry
ORDER BY industry_rank
LIMIT 10;


-- ============================================================
-- Query 8: Cities with Highest Fresher Job Percentage (CTE)
-- Business question: Which cities have the highest % of fresher jobs?

WITH city_total AS (
    SELECT 
        location,
        COUNT(*) AS total
    FROM job_listings
    GROUP BY location
),
city_fresher AS (
    SELECT 
        location,
        COUNT(*) AS fresher_jobs
    FROM job_listings
    WHERE exp_min <= 1
    GROUP BY location
)
SELECT 
    t.location,
    t.total,
    f.fresher_jobs,
    ROUND(f.fresher_jobs::NUMERIC / t.total * 100, 1) AS fresher_pct
FROM city_total t
JOIN city_fresher f ON t.location = f.location
WHERE t.total > 200
ORDER BY fresher_pct DESC
LIMIT 10;
