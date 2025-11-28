/***********************************************************************************************
    NAME:        EC_IT143_W5.2_Tech_Use_Stress_Wellness_jl
    PURPOSE:     Provide SQL answers to four stakeholder questions for the 
                 Tech_Use_Stress_Wellness community dataset.

    MODIFICATION LOG:
    Ver      Date          Author        Description
    ------   ------------  ------------  --------------------------------------------------------
    1.0      11/28/2025    J. LeSueur    1. Created script for IT 143 W5.2 assignment
***********************************************************************************************/

-- RUNTIME:
-- X minutes or less

-- NOTES:
-- This script answers four questions about the Tech_Use_Stress_Wellness dataset.
-- Each question (Q1–Q4) is written in plain English and is followed by its SQL answer (A1–A4).


USE Tech_Use_Stress_Wellness;
GO


/***********************************************************************************************
    Q1: (Author: John LeSueur)
    How does average daily screen time differ between males and females?
***********************************************************************************************/

-- A1: Calculate average daily_screen_time_hours for each gender.

SELECT 
    gender,
    AVG(daily_screen_time_hours) AS avg_daily_screen_time
FROM dbo.Tech_Use_Stress_Wellness
GROUP BY gender
ORDER BY avg_daily_screen_time DESC;
GO


/***********************************************************************************************
    Q2: (Author: Classmate John LeSueur)
    Is higher stress_level associated with more weekly screen hours?
***********************************************************************************************/

-- A2: Convert daily_screen_time_hours to estimated weekly hours and compare by stress_level.

SELECT 
    stress_level,
    AVG(daily_screen_time_hours * 7.0) AS avg_weekly_screen_hours
FROM dbo.Tech_Use_Stress_Wellness
GROUP BY stress_level
ORDER BY stress_level;
GO


/***********************************************************************************************
    Q3: (Author: John LeSueur)
    Which type of device (phone, laptop, tablet, TV) has the highest average usage hours?
***********************************************************************************************/

-- A3: Compare average usage hours across phone, laptop, tablet, and TV.

SELECT 'phone'  AS device_type, AVG(phone_usage_hours)   AS avg_usage_hours 
FROM dbo.Tech_Use_Stress_Wellness

UNION ALL

SELECT 'laptop' AS device_type, AVG(laptop_usage_hours)  AS avg_usage_hours 
FROM dbo.Tech_Use_Stress_Wellness

UNION ALL

SELECT 'tablet' AS device_type, AVG(tablet_usage_hours)  AS avg_usage_hours 
FROM dbo.Tech_Use_Stress_Wellness

UNION ALL

SELECT 'tv'     AS device_type, AVG(tv_usage_hours)      AS avg_usage_hours 
FROM dbo.Tech_Use_Stress_Wellness
ORDER BY avg_usage_hours DESC;
GO


/***********************************************************************************************
    Q4: (Author: Classmate John LeSueur)
    Do people who use wellness_apps report lower weekly anxiety scores?
***********************************************************************************************/

-- A4: Compare average weekly_anxiety_score for users who do and do not use wellness apps.

SELECT 
    uses_wellness_apps,
    AVG(weekly_anxiety_score) AS avg_anxiety
FROM dbo.Tech_Use_Stress_Wellness
GROUP BY uses_wellness_apps
ORDER BY avg_anxiety ASC;
GO
