
# 🎬 Netflix SQL Data Analysis Project

This project explores the Netflix Movies and TV Shows dataset using **SQL**. The goal is to clean the data, explore key trends, and extract **business insights** that help explain **why certain patterns exist**, not just what they are.

---

## 🧠 Skills Demonstrated

- Problem Solving & Critical Thinking
- Data Cleaning using SQL
- Exploratory Data Analysis (EDA)
- Business Insight Generation
- Data-Driven Storytelling
- Communication with SQL comments and insights

---

## 📁 Dataset Information

- **Source:** [Kaggle – Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Records:** 8,800+ titles
- **Columns:** Title, Type, Country, Director, Cast, Rating, Release Year, Duration, Genres, Description

---

##  Data Cleaning

To prepare the dataset for analysis, missing values were handled using `UPDATE` queries:

```sql
-- Replace missing countries with 'Unknown'
UPDATE netflix_titles
SET country = 'Unknown'
WHERE country IS NULL OR TRIM(country) = '';

-- Replace missing directors and cast
UPDATE netflix_titles
SET director = 'Unknown'
WHERE director IS NULL OR TRIM(director) = '';

UPDATE netflix_titles
SET cast = 'Unknown'
WHERE cast IS NULL OR TRIM(cast) = '';

-- Fix missing ratings
UPDATE netflix_titles
SET rating = 'Not Rated'
WHERE rating IS NULL OR TRIM(rating) = '';

Why: Missing values can interfere with grouping and filtering. Replacing them with "Unknown" or "Not Rated" ensures consistency.


## 📊 Exploratory Data Analysis (EDA)

After cleaning the dataset, exploratory analysis was performed using SQL to identify patterns and answer key business questions.

### 📌 EDA Focus Areas:

- 📈 **Content Growth Over Time:** Tracked how the volume of Netflix titles evolved annually
- 🎬 **TV Shows vs. Movies:** Compared release trends by content type
- 🌍 **Top Producing Countries:** Identified the most active regions in content creation
- 🔞 **Rating Distribution:** Analyzed the maturity level of available content
- 🎭 **Genre Popularity:** Explored which genres dominate the platform
- ⏱️ **Duration Trends:** Measured how average movie length has changed over time

> All queries used in the analysis are included in the [`netflix_analysis.sql`](./sql/netflix_analysis.sql) file.


## 📌 Business Insights & Recommendations

The following insights were derived from SQL exploratory analysis and are aimed at guiding Netflix's content and growth strategy:

| 💡 Insight # | 🧠 Business Insight                                                | ✅ Recommendation                                                                 |
|--------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| 1            | TV Show production has grown significantly after 2020             | Invest in episodic content (series, mini-series) to support engagement            |
| 2            | U.S., India, and Japan dominate content production                | Localize content creation in emerging markets like Africa and LATAM               |
| 3            | TV-MA is the most common content rating                           | Expand family and kids content to attract a broader demographic                   |
| 4            | Movie durations are shrinking (under 90 minutes)                  | Promote short-form content and explore anthology/short-documentary formats        |
| 5            | Drama, Documentaries, and Comedies dominate the genre catalog     | Diversify into underrepresented genres such as Sci-Fi, Fantasy, and Action        |


> All queries used in the analysis are included in the [`netflix_analysis.sql`](./sql/netflix_analysis.sql) file.


## 📌 Summary

This project demonstrates how SQL can be used to:

- ✅ Clean and prepare real-world data
- ✅ Explore and extract actionable insights
- ✅ Answer **why** business trends occur
- ✅ Support strategic content decisions for media platforms like Netflix

## 📬 Contact

If you’d like to connect, collaborate, or learn more:

- **Name:** Gilbert Karani Muzungu  
- **Email:** gilbertmuzungu64@gmail.com    
- **LinkedIn:** [https://www.linkedin.com/in/gilbert/karani]

