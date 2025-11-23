/* Step 1: Start with a simple question */
-- Question:
-- Is higher screen time connected to higher stress?

SELECT TOP (100)
    daily_screen_time_hours,
    stress_level
FROM Tech_Use_Stress_Wellness.dbo.Tech_Use_Stress_Wellness
WHERE daily_screen_time_hours IS NOT NULL
  AND stress_level IS NOT NULL;
