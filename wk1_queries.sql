-- High Support/High Turnout
SELECT count(DISTINCT s.voter_file_vanid), t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND turnout_pres_gen >70
  AND region_number = 3;

-- Mid Support/High Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship BETWEEN 30 AND 70
  AND turnout_pres_gen >70
  AND region_number = 3;

-- Low Support/High Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship < 30
  AND turnout_pres_gen > 70
  AND region_number = 3;

-- High Support/Mid Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND turnout_pres_gen BETWEEN 30 AND 70
  AND region_number = 3;

-- Mid Support/Mid Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship BETWEEN 30 AND 70
  AND turnout_pres_gen BETWEEN 30 AND 70
  AND region_number = 3;

-- Low Support/Mid Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship < 30
  AND turnout_pres_gen BETWEEN 30 AND 70
  AND region_number = 3;

-- High Support/Low Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship > 70
  AND turnout_pres_gen < 30
  AND region_number = 3;

-- Mid Support/Low Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship BETWEEN 30 AND 70
  AND turnout_pres_gen < 30
  AND region_number = 3;

-- Low Support/Low Turnout
SELECT DISTINCT s.voter_file_vanid, t.region_number
FROM `ctg2020.vansync.scores` AS s
INNER JOIN `ctg2020.vansync.person_myv` AS p
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.phones` AS ph
  USING(voter_file_vanid)
INNER JOIN `ctg2020.vansync.new_turf` AS t
  ON (p.county_name = t.van_county)
WHERE partisanship < 30
  AND turnout_pres_gen < 30
  AND region_number = 3;
