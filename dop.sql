CREATE TABLE IF NOT EXISTS employee(
	id serial PRIMARY KEY,
	name varchar(40) NOT NULL,
	department varchar(40) UNIQUE NOT NULL,
	chief_id integer REFERENCES employee(id)
)

DROP TABLE employee
