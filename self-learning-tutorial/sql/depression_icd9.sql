CREATE TEMP TABLE IF NOT EXISTS depression_icd9 AS (
	SELECT *
	FROM d_icd_diagnoses 
	WHERE long_title ILIKE '%depressive%' 
		OR long_title ILIKE '%depression%'
);
