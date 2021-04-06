CREATE DATABASE ztm;

/* Create user and roles */
-- CREATE role test_role_with_login WITH LOGIN ENCRYPTED PASSWORD 'actual_password';
-- Create user
-- CREATE USER test_user_with_login WITH ENCRYPTED PASSWORD 'actual_password';
-- ALTER ROLE <name> WITH <changes attributes>

/* Grant privileges */
-- GRANT ALL PRIVILEGES ON <table> TO <user>;
-- GRANT ALL ON ALL TABLE [IN SCHEMA <schema>] TO <user>;
-- GRANT [SELECT, UPDATE, INSERT, ...] ON <table> [IN SCHEMA <schema>] TO <user>;
-- REVOKE ...

/* Creat table */
-- CREATE TABLE student (
--    student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
--    first_name VARCHAR(255) NOT NULL, 
--    last_name VARCHAR(255) NOT NULL, 
--    email VARCHAR(255) NOT NULL, 
--    date_of_birth DATE NOT NULL,
--    CONSTRAINT pk_student_id PRIMARY KEY (student_id)
-- );
-- require extension for uuid_generate function
-- create extension if not exists "uuid-ossp";

-- subject
-- CREATE TABLE subject (
--    subject_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
--    subject TEXT NOT NULL, 
--    description TEXT 
-- );

-- teacher
-- CREATE TABLE teacher (
--    teacher_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
--    first_name VARCHAR(255) NOT NULL, 
--    last_name VARCHAR(255) NOT NULL, 
--    email VARCHAR(255) NOT NULL, 
--    date_of_birth DATE NOT NULL 
-- );

-- course
-- CREATE TABLE course (
--    course_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
--    "name" TEXT NOT NULL, 
--    "description" TEXT, 
--    subject_id UUID REFERENCES subject(subject_id) NOT NULL, 
--    teacher_id UUID REFERENCES teacher(teacher_id), 
--    feedback feedback[]
-- );

-- Alter
-- ALTER TABLE course ALTER COLUMN teacher_id SET NOT NULL;

-- enrollment
-- CREATE TABLE enrollment (
--    course_id UUID REFERENCES course(course_id), 
--    student_id UUID REFERENCES student(student_id), 
--    enrollment_date DATE NOT NULL, 
--    CONSTRAINT pk_enrollment PRIMARY KEY (course_id, student_id) 
-- );
-- ALTER TABLE enrollment ALTER COLUMN course_id SET NOT NULL;
-- ALTER TABLE enrollment ALTER COLUMN student_id SET NOT NULL;

-- feedback
-- CREATE TABLE feedback (
--    student_id UUID NOT NULL REFERENCES student(student_id), 
--    course_id UUID NOT NULL REFERENCES course(course_id), 
--    feedback TEXT, 
--    rating rating, 
--    CONSTRAINT pk_feedback PRIMARY KEY (student_id, course_id)
-- );

/* Create Type */
-- CREATE DOMAIN Rating SMALLINT CHECK (VALUE > 0 AND VALUE <= 5);
-- CREATE TYPE Feedback AS (
--    student_id UUID,
--    rating Rating,
--    feedback TEXT
-- );

/* Insert Data */
-- student 
-- INSERT INTO student (
--    first_name, 
--    last_name, 
--    email, 
--    date_of_birth
-- ) VALUES (
--    'John', 
--    'Doe', 
--    'john@doe.com', 
--    '1990-04-01'::DATE
-- );

-- teacher
-- INSERT INTO teacher (
--    first_name, 
--    last_name, 
--    email, 
--    date_of_birth
-- ) VALUES (
--    'Mary', 
--    'Zamasu', 
--    'mz@educate.com', 
--    '1970-02-10'::DATE
-- );

-- subject
-- INSERT INTO subject (
--    subject,
--    description
-- ) VALUES (
--    'subject 1', 
--    'What do you think this course is about?'
-- );

-- course
-- INSERT INTO course (
--    description, 
--    "name", 
--    subject_id, 
--    teacher_id 
-- ) VALUES (
--    'New course available', 
--    'New subject', 
--    'd0854eea-26d7-43c8-835e-408b564d81c1', 
--    '51487384-7da3-4287-9da1-f7549923e360' 
-- );

-- enrollment
-- INSERT INTO enrollment (
--    student_id, 
--    course_id, 
--    enrollment_date
-- ) VALUES (
--    '8a7751dc-8237-4079-b237-2e8cbf33fcd8', 
--    '214ab654-c701-4d95-9a10-ca9b0733fbd9', 
--    NOW()::DATE
-- );

-- feedback
-- INSERT INTO feedback (
--    student_id, 
--    course_id, 
--    feedback, 
--    rating
-- ) VALUES (
--    '8a7751dc-8237-4079-b237-2e8cbf33fcd8', 
--    '214ab654-c701-4d95-9a10-ca9b0733fbd9', 
--    'Great course', 
--    5
-- );

-- feedback - array
-- UPDATE course 
-- SET feedback = array_append(
--    feedback, 
--    ROW(
--       '8a7751dc-8237-4079-b237-2e8cbf33fcd8', 
--       5, 
--       'feedback'
--    )::feedback
-- )
-- WHERE course_id = '214ab654-c701-4d95-9a10-ca9b0733fbd9';

