-- 3x1
SELECT COUNT (DISTINCT
  CASE WHEN s.partisanship BETWEEN 70.0 AND 100.0
    AND s.turnout_pres_gen BETWEEN 70.0 AND 100.0
  THEN s.voter_file_vanid 
  ELSE NULL
  END) AS High_Part_High_Turnout
  , COUNT (DISTINCT
    CASE WHEN s.partisanship BETWEEN 30.0 AND 69.9
      AND s.turnout_pres_gen BETWEEN 70.0 AND 100.0
    THEN s.voter_file_vanid
    ELSE NULL
    END) Mid_Part_High_Turnout
  , COUNT (DISTINCT
    CASE WHEN s.partisanship BETWEEN 0.0 AND 29.9
      AND s.turnout_pres_gen BETWEEN 70.0 AND 100.0
    THEN s.voter_file_vanid
    ELSE NULL
    END) Low_Part_High_Turnout
FROM `ctg2020.vansync.person_myv` AS p
INNER JOIN `ctg2020.vansync.scores` AS s
  USING(voter_file_vanid);

-- 3x3 Matrix

SELECT CASE WHEN turnout_pres_gen BETWEEN 0.0 AND 29.9
            THEN 'high_turnout'
      WHEN turnout_pres_gen BETWEEN 30.0 AND 69.9
            THEN 'med_turnout'
      WHEN turnout_pres_gen BETWEEN 70.0 AND 100.0
            THEN 'low_turnout'
      END AS `turnout_groups` -- now our fields are named high, mid, and low_turnout
    -- Only counting vanids that meet the conditional criteria
      , COUNT(DISTINCT CASE WHEN s.partisanship BETWEEN 0.0 AND 29.9 THEN s.voter_file_vanid END) AS low_dem_support
      , COUNT(DISTINCT CASE WHEN s.partisanship BETWEEN 30.0 AND 69.9 THEN s.voter_file_vanid END) AS mid_dem_support
      , COUNT(DISTINCT CASE WHEN s.partisanship BETWEEN 70.0 AND 100.0 THEN s.voter_file_vanid END) AS high_dem_support
FROM `ctg2020.vansync.person_myv` AS p
INNER JOIN `ctg2020.vansync.scores` AS s 
      ON (p.voter_file_vanid = s.voter_file_vanid)
GROUP BY turnout_groups;