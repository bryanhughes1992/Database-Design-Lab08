/***********
 * QUERIES *
 ***********/

SELECT
	li.librarian_id AS 'Librarian ID',
	li.librarian_fname AS 'First Name',
	li.librarian_lname AS 'Last Name',
	ls.shift_day AS 'Shift Date',
	ls.shift_num AS 'Shift Section',
	la.assignment_name AS 'Assignment Name' 
FROM librarian_info li
JOIN librarian_schedule ls 
	ON li.librarian_id = ls.librarian 
JOIN librarian_assignments la 
	ON li.librarian_id = la.librarian;

-- QUESTION #1 - 
-- One that can tell me the names and shifts of the 
-- librarians working not this coming Monday, but the Monday following

SELECT
	li.librarian_id AS 'Librarian ID',
	li.librarian_fname AS 'First Name',
	li.librarian_lname AS 'Last Name',
	ls.shift_day AS 'Shift Date',
	ls.shift_num AS 'Shift Section',
	la.assignment_name AS 'Assignment Name' 
FROM librarian_info li
JOIN librarian_schedule ls 
	ON li.librarian_id = ls.librarian 
JOIN librarian_assignments la 
	ON li.librarian_id = la.librarian
WHERE ls.shift_day > '1992-07-08'

-- QUESTION 2
-- one that can tell me Beverly Cleary's assignments for that day

SELECT
	li.librarian_id AS 'Librarian ID',
	li.librarian_fname AS 'First Name',
	li.librarian_lname AS 'Last Name',
	ls.shift_day AS 'Shift Date',
	ls.shift_num AS 'Shift Section',
	la.assignment_name AS 'Assignment Name' 
FROM librarian_info li
JOIN librarian_schedule ls 
	ON li.librarian_id = ls.librarian 
JOIN librarian_assignments la 
	ON li.librarian_id = la.librarian
WHERE li.librarian_fname = 'Beverly'
AND li.librarian_lname = 'Cleary'

/**************
 ***TABLE 1***
 *************/

-- Table for Librarian Information
CREATE TABLE librarian_info (
	librarian_id		INT				PRIMARY KEY,
	librarian_fname 	VARCHAR(255),
	librarian_lname 	VARCHAR(255)
);

-- Data Entry for Librarian Information
INSERT INTO librarian_info 
	(librarian_id, librarian_fname, librarian_lname)
VALUES
	(1, 'Jesse', 'Shera'),
	(2, 'Anne Carroll', 'Moore'),
	(3, 'Beverly', 'Cleary'),
	(4, 'Marcel', 'Duchamp'),
	(5, 'Audre', 'Lorde'),
	(6, 'Melvil', 'Dewey'),
	(7, 'Dolly', 'Parton'),
	(8, 'Carla', 'Hayden');


/***********
 * TABLE 2
************/

-- Table for Librarian Schedule
CREATE TABLE librarian_schedule (
	shift_id		INT		PRIMARY KEY,
	shift_num		INT		NOT NULL,
	shift_day		DATE	NOT NULL,
	librarian		INT		REFERENCES librarian_info(librarian_id)	
);

-- Data entry for Librarian Schedule
INSERT INTO librarian_schedule 
	(shift_id, shift_num, shift_day, librarian)
VALUES
	(1, 1, '1992-07-06', 1),
	(2, 2, '1992-07-06', 2),
	(3, 1, '1992-07-06', 3),
	(4, 1, '1992-07-07', 4),
	(5, 2, '1992-07-07', 5),
	(6, 1, '1992-07-08', 6),
	(7, 1, '1992-07-13', 7),
	(8, 1, '1992-07-13', 8); 


/**********
 * TABLE 3
 **********/

-- Table for Librarian Assignments
CREATE TABLE librarian_assignments (
	assignment_id	INT				PRIMARY KEY,
	assignment_name VARCHAR(255)	NOT NULL,
	shift			INT		
		REFERENCES librarian_schedule(shift),
	librarian		INT
		REFERENCES librarian_info(librarian_id)
);

-- Data entry for table assignments
INSERT INTO librarian_assignments 
	(assignment_id, assignment_name, shift, librarian)
VALUES
	(1, 'Main Desk', 1, 1),
	(2, 'Catalogue', 1, 1),
	(3, 'Childrens Library', 2, 2),
	(4, 'Reference', 1, 3),
	(5, 'Catalogue', 1, 3),
	(6, 'Main Desk', 1, 4),
	(7, 'Reference', 1, 4),
	(8, 'Main Desk', 2, 5),
	(9, 'Catalogue', 2, 5),
	(10, 'Main Desk', 1, 6),
	(11, 'Reference', 1, 6),
	(12, 'Childrens Library', 1, 7),
	(13, 'Main Desk', 2, 8),
	(24, 'Catalogue', 2, 8);







