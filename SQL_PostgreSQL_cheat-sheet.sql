-------SQL_PosgreSQL_cheat-sheet--------------

-------DDL [DATA DEFINITION LANGUAGE]---------

DROP DATABASE IF EXISTS name_database; --delets database
CREATE DATABASE name_database; --create empty database
SELECT current_database(); --shows current database

DROP SCHEMA IF EXISTS name_schema CASCADE; --drops schema, CASCADE ensures that all dependencies are deleted as well
--CASCADE: delets dependencies, FK-trigger
CREATE SCHEMA name_schema; --create schema
SET search_path TO name_schema; --sets search path
SHOW search_path; --shows current dearch path

DROP TABLE IF EXISTS name_table_one CASCADE; --deletes table, FK-trigger
CREATE TABLE name_table_one( --creates table, convention: singular naming
	name_attribute_one integer NOT NULL, --NOT NULL: ensures that attribute is not empty
	--will be PK and and a FK for name_table_two
	name_attribute_two varchar(25) NOT NULL DEFAULT 'default_char', --integer: Domain of attribute
	name_attribute_constrained decimal(1,1) NOT NULL CHECK(
		name_attribute_constrained >= -1.0 AND
		name_attribute_constrained <= 6.0 --constrain an attribute
		) DEFAULT -1.0,
	--datatypes/domains: float, real, char(n), decimal(n,d) [n: #digits, d: #decimal]
	CONSTRAINT name_table_one_PK PRIMARY KEY(name_attribute_one), --defines primary key [PK] of table, always NOT NULL
	--names PK
	CONSTRAINT name_table_one_UK UNIQUE(name_attribute_two) --another key
);

DROP TABLE IF EXISTS name_table_two CASCADE;
CREATE TABLE name_table_two(
	name_attribute_one integer NOT NULL,
	name_attribute_two point NOT NULL DEFAULT '-1.0, -1.0',
	CONSTRAINT name_table_three_FK FOREIGN KEY(name_attribute_one) REFERENCES name_table_one(name_attribute_one) --FK reference
);

ALTER TABLE name_table_one ADD name_attribute_three integer NOT NULL DEFAULT -1; --add an attribute to existing table
--also works with ADD CONSTRAINT

--clean-up section
DROP SCHEMA IF EXISTS name_schema CASCADE;
DROP TABLE IF EXISTS name_table_one CASCADE;
DROP TABLE IF EXISTS name_table_two CASCADE;

-------DML [DATA MANIPULATION LANGUAGE]-------

--demo environement building section
CREATE SCHEMA dml;
SET search_path TO dml;
DROP TABLE IF EXISTS car CASCADE;
CREATE TABLE car(
	car_id integer NOT NULL,
	car_name varchar(25) NOT NULL DEFAULT 'no name',
	year_built integer NOT NULL CHECK(year_built >= 1900 AND year_built <= 2023),
	CONSTRAINT PK_car PRIMARY KEY(car_id)
);

DROP TABLE IF EXISTS engineer CASCADE;
CREATE TABLE engineer(
	ssn integer NOT NULL
	first_name varchar(25) NOT NULL,
	last_name varchar(25) NOT NULL,
	CONSTRAINT PK_engineer PRIMARY KEY(ssn)
);

DROP TABLE IF EXISTS works_on(
	ssn_engineer integer NOT NULL,
	car_id integer NOT NULL,
	--CONTINUE WORK HERE
);

-------DQL [DATA QUERY LANGUAGE]--------------
-------DCL [DATA CONTROL LANGUAGE]------------




