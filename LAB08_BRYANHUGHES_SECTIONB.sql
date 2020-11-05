CREATE TABLE librarian_info (
	librarian_id		INT				PRIMARY KEY,
	librarian_fname 	VARCHAR(255),
	librarian_lname 	VARCHAR(255)
);

CREATE TABLE librarian_schedule (
	shift			INT		PRIMARY KEY,
	shift_day		DATE	NOT NULL,
	librarian		INT		REFERENCES librarian_info(librarian_id)	
);

ALTER TABLE librarian_schedule
ADD COLUMN assignment_id INT
	REFERENCES librarian_assignments(assignment_id);


CREATE TABLE librarian_assignments (
	assignment_id	INT				PRIMARY KEY,
	assignment_name VARCHAR(255)	NOT NULL,
	librarian		INT		
		REFERENCES librarian_info(librarian_id),
	shift			INT		
		REFERENCES librarian_schedule(shift)
);





