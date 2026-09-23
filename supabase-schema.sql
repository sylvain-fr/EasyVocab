-- VocabMaster Database Schema for Supabase
-- Run this in Supabase Dashboard → SQL Editor → New Query

-- Vocabulary lists table
CREATE TABLE vocabulary_lists (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, name)
);

-- Vocabulary items table
CREATE TABLE vocabulary_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  list_id UUID REFERENCES vocabulary_lists(id) ON DELETE CASCADE,
  en TEXT NOT NULL,
  fr TEXT NOT NULL,
  sentence TEXT,
  position INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- User preferences table (for future features)
CREATE TABLE user_preferences (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  active_list_name TEXT,
  listening_difficulty TEXT DEFAULT 'A2',
  listening_speed FLOAT DEFAULT 1.0,
  show_all_english BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE vocabulary_lists ENABLE ROW LEVEL SECURITY;
ALTER TABLE vocabulary_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_preferences ENABLE ROW LEVEL SECURITY;

-- RLS Policies for vocabulary_lists
CREATE POLICY "Users can view own lists" ON vocabulary_lists
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own lists" ON vocabulary_lists
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own lists" ON vocabulary_lists
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own lists" ON vocabulary_lists
  FOR DELETE USING (auth.uid() = user_id);

-- RLS Policies for vocabulary_items
CREATE POLICY "Users can view own items" ON vocabulary_items
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM vocabulary_lists WHERE id = list_id AND user_id = auth.uid())
  );

CREATE POLICY "Users can insert own items" ON vocabulary_items
  FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM vocabulary_lists WHERE id = list_id AND user_id = auth.uid())
  );

CREATE POLICY "Users can update own items" ON vocabulary_items
  FOR UPDATE USING (
    EXISTS (SELECT 1 FROM vocabulary_lists WHERE id = list_id AND user_id = auth.uid())
  );

CREATE POLICY "Users can delete own items" ON vocabulary_items
  FOR DELETE USING (
    EXISTS (SELECT 1 FROM vocabulary_lists WHERE id = list_id AND user_id = auth.uid())
  );

-- RLS Policies for user_preferences
CREATE POLICY "Users can view own preferences" ON user_preferences
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own preferences" ON user_preferences
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own preferences" ON user_preferences
  FOR UPDATE USING (auth.uid() = user_id);

-- Indexes for performance
CREATE INDEX idx_lists_user ON vocabulary_lists(user_id);
CREATE INDEX idx_items_list ON vocabulary_items(list_id);
CREATE INDEX idx_items_position ON vocabulary_items(list_id, position);
