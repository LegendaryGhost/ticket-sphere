ALTER TABLE reservation RENAME COLUMN seat_number TO adult_count;
ALTER TABLE reservation ALTER COLUMN adult_count SET DEFAULT 1;
ALTER TABLE reservation ADD COLUMN child_count INTEGER NOT NULL DEFAULT 0;