DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS history;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
	username text PRIMARY KEY,
	first_name text,
	email text,
	phone text,
	website text,
	bio text,
	gendor text
);

CREATE TABLE photo (
	author text,
	photo_name text,
	FOREIGN KEY(author) REFERENCES user(username)
);

CREATE TABLE history (
	author text,
	history_name text,
	left_to_live datetime
	FOREIGN KEY(author) REFERENCES user(username)
);
