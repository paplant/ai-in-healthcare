\c mimic
\i depression_notes.sql
\copy (SELECT * FROM depression_notes TABLESAMPLE SYSTEM(20) LIMIT 10000) TO 'depression_notes_output.csv' WITH CSV HEADER;
\i non_depression_notes.sql
\copy (SELECT * FROM non_depression_notes TABLESAMPLE SYSTEM(10) LIMIT 10000) TO 'non_depression_notes_output.csv' WITH CSV HEADER;
