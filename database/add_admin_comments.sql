-- Migration: Add admin comments field for internal notes
-- Run this on the database

USE irc_membership_db;

-- Add admin comments field
ALTER TABLE members 
ADD COLUMN admin_comments TEXT DEFAULT NULL COMMENT 'Administrator-only notes for payment tracking, etc. Max 500 chars';

-- Show results
SELECT COUNT(*) as total_members FROM members;
DESCRIBE members;
