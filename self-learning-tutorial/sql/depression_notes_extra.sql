\i 'depression_events.sql';

CREATE TEMP TABLE IF NOT EXISTS depression_notes AS (
	SELECT A.*, B.seq_num, B.icd9_code, B.short_title, B.long_title
	FROM (
	    SELECT subject_id, hadm_id, chartdate, charttime, storetime, category, description, row_id AS noteevents_id, text
	    FROM noteevents
	    WHERE hadm_id IN (SELECT hadm_id FROM depression_events)
	) AS A
	LEFT JOIN (
	    SELECT *
	    FROM depression_events
	) AS B
	ON A.hadm_id = B.hadm_id
);

