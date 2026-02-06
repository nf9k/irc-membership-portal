-- Test Data Setup for IRC Membership Portal
-- Use these accounts for testing the system

-- NOTE: You'll need to hash passwords using bcrypt before inserting
-- Python example to generate hash:
--   import bcrypt
--   hash = bcrypt.hashpw(b'password123', bcrypt.gensalt())
--   print(hash.decode())

-- For testing, use password: TestPass123!

-- Test Admin Account (active, paid through future year)
INSERT INTO members (call_sign, password_hash, email, name, address, city, state, zip, 
                    telephone, paid_thru, member_type, is_admin)
VALUES ('TEST1ADM', '$2b$12$YOUR_HASH_HERE', 'testadmin@test.com', 
        'Test Administrator', '123 Admin St', 'Indianapolis', 'IN', '46220',
        '317-555-1000', '2027', 'FULL', 1);

-- Test Regular Member (active)
INSERT INTO members (call_sign, password_hash, email, name, address, city, state, zip,
                    telephone, paid_thru, member_type, is_admin)
VALUES ('TEST2MEM', '$2b$12$YOUR_HASH_HERE', 'testmember@test.com',
        'Test Member Active', '456 Member Ave', 'Carmel', 'IN', '46032',
        '317-555-2000', '2027', 'FULL', 0);

-- Test Expiring Member (paid through current year only)
INSERT INTO members (call_sign, password_hash, email, name, address, city, state, zip,
                    telephone, paid_thru, member_type, is_admin)
VALUES ('TEST3EXP', '$2b$12$YOUR_HASH_HERE', 'testexpiring@test.com',
        'Test Member Expiring', '789 Expire Ln', 'Fishers', 'IN', '46038',
        '317-555-3000', '2026', 'ASSOCIATE', 0);

-- Test Expired Member (paid through past year)
INSERT INTO members (call_sign, password_hash, email, name, address, city, state, zip,
                    telephone, paid_thru, member_type, is_admin)
VALUES ('TEST4OLD', '$2b$12$YOUR_HASH_HERE', 'testexpired@test.com',
        'Test Member Expired', '321 Old Rd', 'Noblesville', 'IN', '46060',
        '317-555-4000', '2025', 'FULL', 0);

-- Test Member without Email
INSERT INTO members (call_sign, password_hash, name, address, city, state, zip,
                    telephone, paid_thru, member_type, is_admin)
VALUES ('TEST5NOE', '$2b$12$YOUR_HASH_HERE', 'Test No Email',
        '999 Silent St', 'Westfield', 'IN', '46074',
        '317-555-5000', '2027', 'LIFE', 0);

-- Test Life Member
INSERT INTO members (call_sign, password_hash, email, name, paid_thru, member_type, is_admin)
VALUES ('TEST6LFE', '$2b$12$YOUR_HASH_HERE', 'testlife@test.com',
        'Test Life Member', '9999', 'LIFE', 0);

-- Test Honorary Member
INSERT INTO members (call_sign, password_hash, email, name, paid_thru, member_type, is_admin)
VALUES ('TEST7HON', '$2b$12$YOUR_HASH_HERE', 'testhon@test.com',
        'Test Honorary Member', '9999', 'HONORARY', 0);

-- Verify test accounts created
SELECT call_sign, name, email, paid_thru, member_type, 
       CASE WHEN is_admin = 1 THEN 'Yes' ELSE 'No' END as admin
FROM members
WHERE call_sign LIKE 'TEST%'
ORDER BY call_sign;

-- To generate password hash in Python:
-- python3 -c "import bcrypt; print(bcrypt.hashpw(b'TestPass123!', bcrypt.gensalt()).decode())"

-- CLEANUP (run this to remove test data after testing):
-- DELETE FROM members WHERE call_sign LIKE 'TEST%';
