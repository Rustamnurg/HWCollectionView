DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS history;
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user (
	--id integer autoincrement,
	username text primary key,
	first_name text,
	email text,
	phone text,
	website text,
	bio text,
	gendor text
);

CREATE TABLE IF NOT EXISTS photo (
	author text NOT NULL,
	photo_name text,
	create_date datetime,
	FOREIGN KEY(author) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS history (
	author text NOT NULL,
	history_name text,
	create_date datetime,
	FOREIGN KEY(author) REFERENCES user(id)
);


INSERT INTO user (username, first_name, email, phone, website, bio,gendor) VALUES ('dwusername', 'dqfirst_name', 'dqemail', 'phone', 'website', 'acsbio', 'gendorda');

