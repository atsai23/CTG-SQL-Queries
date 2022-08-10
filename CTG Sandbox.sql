SELECT DISTINCT
  CASE WHEN s.partisanship BETWEEN 30.0 AND 70.0 AND s.turnout_pres_gen BETWEEN 30.0 AND 100
    THEN 'Persuasion'
  WHEN s.partisanship BETWEEN 70.0 AND 100 AND s.turnout_pres_gen BETWEEN 30.0 AND 100
    THEN 'Mobilization'
  WHEN s.partisanship BETWEEN 70.0 AND 100 AND s.turnout_pres_gen BETWEEN 70.0 AND 100
      THEN "Volunteer"
  END
  , COUNT(DISTINCT s.voter_file_vanid)
  -- , COUNT(DISTINCT CASE WHEN p.race_name = "Native American" THEN "Race_Native_American" END) AS RACE
  , COUNT (DISTINCT CASE WHEN p.age <= 33 THEN "Age_Under_33" END) AS AGE 
FROM `ctg2020.vansync.person_myv` AS p
LEFT JOIN `ctg2020.vansync.turf` AS t ON (p.county_name = t.van_county)
LEFT JOIN `ctg2020.vansync.scores` AS s ON (p.voter_file_vanid = s.voter_file_vanid)
LEFT JOIN `ctg2020.vansync.phones` AS ph ON (p.voter_file_vanid = ph.voter_file_vanid)
-- WHERE t.region_name = 'Region 05 - Carter'
GROUP BY 1;



--Establish Demographics and phone rows
SELECT DISTINCT
    CASE WHEN p.race_name = "Native American"
        THEN "Race_Native_American"
    WHEN p.race_name = "African-American"
        THEN "Race_African_American"
    WHEN p.race_name = "Asian"
        THEN "Race_Asian"
    WHEN p.race_name = "Caucasian"
        THEN "Race_Caucasian"
    WHEN p.race_name = "Uncoded"
        THEN "Race_Uncoded"
    END
    , COUNT(CASE WHEN s.partisanship BETWEEN 30.0 AND 70.0
                    AND s.turnout_pres_gen BETWEEN 30.0 AND 100
                THEN s.voter_file_vanid END)
            AS Persuasion
    , COUNT(CASE WHEN s.partisanship BETWEEN 70.0 AND 100
                    AND s.turnout_pres_gen BETWEEN 30.0 AND 100
                THEN s.voter_file_vanid END)
            AS Mobilization
    , COUNT(CASE WHEN s.partisanship BETWEEN 70.0 AND 100
                    AND s.turnout_pres_gen BETWEEN 70.0 AND 100
                THEN s.voter_file_vanid END)
            AS Volunteer
FROM `ctg2020.vansync.person_myv` AS p
LEFT JOIN `ctg2020.vansync.turf` AS t ON (p.county_name = t.van_county)
LEFT JOIN `ctg2020.vansync.scores` AS s ON (p.voter_file_vanid = s.voter_file_vanid)
LEFT JOIN `ctg2020.vansync.phones` AS ph ON (p.voter_file_vanid = ph.voter_file_vanid)
WHERE t.region_name = 'Region 05 - Carter'
GROUP BY 1;