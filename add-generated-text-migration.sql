-- Migration: Add generated_text column to vocabulary_lists table
-- Run this in Supabase SQL Editor

-- Add column for generated listening text
ALTER TABLE vocabulary_lists
ADD COLUMN IF NOT EXISTS generated_text TEXT;

-- Add comment
COMMENT ON COLUMN vocabulary_lists.generated_text IS 'AI-generated listening practice text for this word list';
