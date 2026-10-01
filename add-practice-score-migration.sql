-- Migration: Add practice_score column to vocabulary_items table
-- Run this in Supabase SQL Editor

-- Add column for practice scores
ALTER TABLE vocabulary_items
ADD COLUMN IF NOT EXISTS practice_score INTEGER;

-- Add index for filtering by score (for "failed words" filter)
CREATE INDEX IF NOT EXISTS idx_items_practice_score
ON vocabulary_items(practice_score);

-- Add comment
COMMENT ON COLUMN vocabulary_items.practice_score IS 'Score from practice mode (0-100), null if not practiced yet';
