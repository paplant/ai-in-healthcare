\i 'depression_icd9.sql';

CREATE TEMP TABLE IF NOT EXISTS depression_events AS (
	SELECT A.*, B.short_title, B.long_title
	FROM (
		SELECT subject_id, hadm_id, seq_num, icd9_code
		FROM diagnoses_icd
		WHERE icd9_code IN (SELECT icd9_code FROM depression_icd9)
	) AS A
	LEFT JOIN (
		SELECT icd9_code, short_title, long_title
		FROM depression_icd9
	) AS B
	ON A.icd9_code = B.icd9_code
);
