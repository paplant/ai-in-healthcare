\i 'depression_events.sql';

CREATE TEMP TABLE IF NOT EXISTS depression_notes AS (
    SELECT text
    FROM noteevents
    WHERE hadm_id IN (SELECT hadm_id FROM depression_events)
);

