--number 1: 1793
SELECT *
FROM data_analyst_jobs;

--number 2: ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--number 3: 21 postings in TN, 27 in TN or KY
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');

--number 4: 3 postings
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4.0;

--number 5: 151 postings
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--number 6: avg star rating for each state, best to worst
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--number 7: 881 unique job titles
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

--number 8: 230 unique job titles for CA companies
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--number 9/10: 41 companies with more than 5000 reviews. General Motors has highest overall rating 4.19
SELECT company, AVG(star_rating) AS avg_rating, SUM(review_count)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;

--number 11: 754 job titles with the word analyst
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--number 12: 
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
AND title NOT ILIKE '%Analytics%';

--bonus: hardest to fill - internet and software, banks and financial services, consulting and business services, and health care
SELECT domain, COUNT(domain)
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' 
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(domain) DESC;