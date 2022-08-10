/* Persuasion: partisanship between 30-70, turnout_pres_gen between 30 - 100
Mobilization: partisanship between 70-100, turnout_pres_gen between 30-70 */


WITH turnout_groups AS 
  (SELECT CASE WHEN s.turnout_pres_gen > 70 
      THEN 'High Turnout'
    WHEN s.turnout_pres_gen BETWEEN 30 AND 70
      THEN 'Mid-Turnout'
    WHEN s.turnout_pres_gen < 30
      THEN 'Low Turnout'
    END AS `Turnout` 
  , s.partisanship
  , s.voter_file_vanid
  FROM `ctg2020.vansync.scores` AS s
  INNER JOIN `ctg2020.vansync.person_myv` AS p
    USING(voter_file_vanid)
  INNER JOIN `ctg2020.vansync.phones` AS ph
    USING(voter_file_vanid)
  INNER JOIN `ctg2020.vansync.new_turf` AS t
    ON (p.county_name = t.van_county))
SELECT turnout, COUNT(DISTINCT voter_file_vanid) 
FROM turnout_groups 
WHERE partisanship > 70 
GROUP BY 1
UNION ALL 
SELECT turnout, COUNT(DISTINCT voter_file_vanid) 
FROM turnout_groups 
WHERE partisanship BETWEEN 30 AND 70
GROUP BY 1
UNION ALL
SELECT turnout, COUNT(DISTINCT voter_file_vanid) 
FROM turnout_groups 
WHERE partisanship < 30
GROUP BY 1;

WITH turnout_groups AS 
  (SELECT CASE WHEN s.turnout_pres_gen > 70 
      THEN 'High Turnout'
    WHEN s.turnout_pres_gen BETWEEN 30 AND 70
      THEN 'Mid-Turnout'
    WHEN s.turnout_pres_gen < 30
      THEN 'Low Turnout'
    END AS `Turnout` 
  , s.partisanship
  , s.voter_file_vanid
  FROM `ctg2020.vansync.scores` AS s)
SELECT turnout, COUNT(DISTINCT voter_file_vanid) 
FROM turnout_groups 
WHERE partisanship > 70 
GROUP BY 1
UNION ALL 
SELECT turnout, COUNT(DISTINCT voter_file_vanid) 
FROM turnout_groups 
WHERE partisanship BETWEEN 30 AND 70
GROUP BY 1;

WITH high_turnout AS 
  (SELECT CASE WHEN s.turnout_pres_gen > 70 
      THEN 'High Turnout'
    WHEN s.turnout_pres_gen BETWEEN 30 AND 70
      THEN 'Mid-Turnout'
    WHEN s.turnout_pres_gen < 30
      THEN 'Low Turnout'
    END AS `Turnout` 
  , count (DISTINCT s.voter_file_vanid)
  FROM `ctg2020.vansync.scores` AS s
  LEFT JOIN `ctg2020.vansync.person_records_myc` AS p
    ON s.voter_file_vanid = p.voter_file_vanid
  WHERE s.partisanship > 70
  GROUP BY 1
  ORDER BY 1 ASC),
mid_turnout AS 
  (SELECT CASE WHEN s.turnout_pres_gen > 70 
      THEN 'High Turnout'
    WHEN s.turnout_pres_gen BETWEEN 30 AND 70
      THEN 'Mid-Turnout'
    WHEN s.turnout_pres_gen < 30
      THEN 'Low Turnout'
    END AS `Turnout` 
  , count (DISTINCT s.voter_file_vanid)
  FROM `ctg2020.vansync.scores` AS s
  LEFT JOIN `ctg2020.vansync.person_records_myc` AS p
    ON s.voter_file_vanid = p.voter_file_vanid
  WHERE s.partisanship < 30
  GROUP BY 1
  ORDER BY 1 ASC)
SELECT * FROM high_turnout
UNION ALL
SELECT * FROM mid_turnout;

SELECT CASE WHEN s.turnout_pres_gen > 70
    THEN 'High Turnout'
  WHEN s.turnout_pres_gen BETWEEN 30 AND 70
    THEN 'Mid-Turnout'
  WHEN s.turnout_pres_gen < 30
    THEN 'Low Turnout'
  END AS `Turnout`
  , count (DISTINCT p.voter_file_vanid)
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND t.region_number = 3
GROUP BY 1;

SELECT CASE WHEN s.turnout_pres_gen BETWEEN 30 AND 70
    THEN 'High Turnout'
  WHEN s.turnout_pres_gen BETWEEN 30 AND 70
    THEN 'Mid-Turnout'
  WHEN s.turnout_pres_gen < 30
    THEN 'Low Turnout'
  END AS `Turnout`
  , count (DISTINCT p.voter_file_vanid)
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND t.region_number = 3
GROUP BY 1;

SELECT CASE WHEN s.turnout_pres_gen <30
    THEN 'High Turnout'
  WHEN s.turnout_pres_gen BETWEEN 30 AND 70
    THEN 'Mid-Turnout'
  WHEN s.turnout_pres_gen < 30
    THEN 'Low Turnout'
  END AS `Turnout`
  , count (DISTINCT p.voter_file_vanid)
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND t.region_number = 3
GROUP BY 1;