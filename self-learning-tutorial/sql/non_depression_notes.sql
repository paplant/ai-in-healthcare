\i 'depression_events.sql';

CREATE TEMP TABLE IF NOT EXISTS non_depression_notes AS (
    SELECT text
    FROM noteevents
    WHERE hadm_id NOT IN (SELECT hadm_id FROM depression_events)
);

