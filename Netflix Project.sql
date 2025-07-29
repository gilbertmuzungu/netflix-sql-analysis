/*
Netflix Data Exploration

Skills Used:Problem solving,Critical Thinking, Data Cleaning,Exploratory Data Analysis (EDA) Using SQL, Business Insight Generation, Data-Driven Storytelling,Communication,

*/

-- Retrieve all the Data from the netflix Dataset
SELECT * FROM netflix.netflix_titles;

-- DATA CLEANING
-- Handle NULL or missing values in country, director, cast
--  Why? Replaces missing values with 'Unknown' to avoid filtering issues in queries.
UPDATE netflix.netflix_titles
SET country = 'Unknown'
WHERE country IS NULL OR TRIM(country) = '';


UPDATE netflix.netflix_titles
SET director = 'Unknown'
WHERE director IS NULL OR TRIM(director) = '';

UPDATE netflix.netflix_titles
SET cast = 'Unknown'
WHERE cast IS NULL OR TRIM(cast) = '';

-- Fix inconsistent or NULL rating values
-- Ensures every title has a classification.
UPDATE netflix.netflix_titles
SET rating = 'Not Rated'
WHERE rating IS NULL OR TRIM(rating) = '';



-- Exploratory Data Analysis (EDA)

-- Why is Netflix producing more content over time?
--  Helps Identify growth periods 
-- Link to Netflix’s global expansion or content strategy shifts
SELECT release_year, COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY release_year
ORDER BY release_year;

-- Why are TV Shows increasing vs. Movies?
-- Understand shifts in consumer demand
SELECT release_year, type, COUNT(*) AS count
FROM  netflix.netflix_titles
GROUP BY release_year, type
ORDER BY release_year, type;

--  Why is U.S. content still dominant? Who are the rising contributors?
-- Spot new emerging regions (Japan and India)
-- It will help to Suggest localization strategies
SELECT country, COUNT(*) AS count
FROM netflix.netflix_titles
GROUP BY country
ORDER BY count DESC
LIMIT 10;

--  Why is TV-MA so dominant?
-- Target audience is mature adults
SELECT rating, COUNT(*) AS total
FROM netflix.netflix_titles
GROUP BY rating
ORDER BY total DESC;

-- Why are some genres dominating specific content types?
--  Find out if Drama is dominant in both
--  It also helps to Identify niches like Documentaries, Stand-Up Comedy

SELECT type, listed_in, COUNT(*) AS total
FROM netflix.netflix_titles
GROUP BY type, listed_in
ORDER BY total DESC
LIMIT 20;

--  Why are duration patterns changing?
-- Spot decreasing movie lengths (short-form trend)
-- Could suggest mobile-first or attention-span shifts 
SELECT release_year, AVG(duration_int) AS avg_duration
FROM netflix.netflix_titles
WHERE type = 'Movie' AND duration_type = 'min'
GROUP BY release_year
ORDER BY release_year;


-- BUSINESS INSIGHTS

-- Insight #1:Their was Explosive Growth of TV Shows After 2020

-- Recomendation: Continue investing in episodic content (TV Shows, mini-series)

SELECT release_year, type, COUNT(*) 
FROM netflix.netflix_titles
GROUP BY release_year, type 
ORDER BY release_year;

-- Insight #2: U.S., India, and Japan. Dominate Netflix’s Content Supply
-- Emerging markets like India and Japan  are growing fast

-- Recomendation: Expand content deals with rising film industries in Japan and India,Invest in regional production for underserved markets (Africa)

SELECT country, COUNT(*) 
FROM netflix.netflix_titles 
GROUP BY country 

--  Insight #3: TV-MA is the Most Common Rating (Mature Content)
-- TV-MA accounts for over 35% of all content
-- limited content available for kids & family (TV-Y, PG)

-- Recommendation: a)Diversify ratings to include more family-friendly and youth content
-- b)Expand the “Netflix Kids” experience with exclusive animation and learning content

SELECT rating, COUNT(*) 
FROM  netflix.netflix_titles 
GROUP BY rating 
ORDER BY COUNT(*) DESC;


-- Insight #4: Average Movie Duration is Shrinking Over Time
-- Average movie duration dropped from 100+ mins (pre-2015) to <90 mins
-- Rise of short films and documentaries

-- Recommendation: a)Promote short-form content for mobile users
-- b)Experiment with 20–40 minute formats like short documentaries and anthology series

SELECT release_year, AVG(duration_int) 
FROM netflix.netflix_titles 
WHERE type = 'Movie' AND duration_type = 'min' 
GROUP BY release_year 
ORDER BY release_year;

-- Insight #5: Drama, Documentaries, and Comedies Dominate Genres
-- Most content falls under Action & Adventure, Anime Features,International Movies

-- Recommendation: a)Expand variety by sourcing content in underrepresented genres

SELECT listed_in, COUNT(*) 
FROM netflix.netflix_titles 
GROUP BY listed_in 
ORDER BY COUNT(*) DESC 
LIMIT 10;





