/* Step 2: Begin creating an answer */
-- Where I am:
-- I can view screen time and stress values.

-- Next step:
-- Group screen time and find average stress by group.

SELECT
    CASE
        WHEN daily_screen_time_hours < 2 THEN 'Under 2 hrs'
        WHEN daily_screen_time_hours < 4 THEN '2-4 hrs'
        WHEN daily_screen_time_hours < 6 THEN '4-6 hrs'
        ELSE '6+ hrs'
    END AS screen_time_group,
    AVG(stress_level) AS avg_stress
FROM Tech_Use_Stress_Wellness.dbo.Tech_Use_Stress_Wellness
GROUP BY CASE
        WHEN daily_screen_time_hours < 2 THEN 'Under 2 hrs'
        WHEN daily_screen_time_hours < 4 THEN '2-4 hrs'
        WHEN daily_screen_time_hours < 6 THEN '4-6 hrs'
        ELSE '6+ hrs'
    END
ORDER BY screen_time_group;
