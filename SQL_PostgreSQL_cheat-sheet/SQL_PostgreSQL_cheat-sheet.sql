-------SQL_PosgreSQL_cheat-sheet--------------

-------DDL [DATA DEFINITION LANGUAGE]---------

CREATE DATABASE name_database; --create empty database

CREATE SCHEMA name_schema; --create schema

DROP SCHEMA IF EXISTS name_schema CASCADE; --drops schema, CASCADE ensures that all dependencies are deleted as well
--^delets dependencies, FK-trigger

CREATE TABLE name_table_one( --creates table
	name_attribute_one integer NOT NULL, --NOT NULL: ensures that attribute is not empty
	name_attribute_two varchar(10) NOT NULL, --integer: Domain of attribute
	name_attribute_table_one integer NOT NULL, --will be referenced as foreign key [FK]
	name_attribute_constrained decimal(1,1) NOT NULL CHECK(
		name_attribute_constrained >= 1.0 AND
		name_attribute_constrained <= 6.0 --constrain an attribute
		)
	--datatypes/domains: float, real, char(n), decimal(n,d) [n: #digits, d: #decimal]
	CONSTRAINT name_table_one_PK PRIMARY KEY(name_attribute_one) --defines primary key [PK] of table, always NOT NULL
	--names PK
	CONSTRAINT name_table_one_UK UNIQUE(name_attribute_two) --another key
);

CREATE TABLE name_table_two(
	name_attribute_FK integer NOT NULL,
	CONSTRAINT name_table_two_FK FOREIGN KEY(name_attribute_FK) REFERENCES name_table_one(name_attribute_table_one)
	--FK reference
);

ALTER TABLE name_table_one ADD name_attribute_three integer NOT NULL; --add an attribute to existing table
--also works with ADD CONSTRAINT

DROP TABLE name_table_one CASCADE; --deletes table, FK-trigger
DROP TABLE name_table_two CASCADE;
DROP DATABASE name_database;

-------DML [DATA MANIPULATION LANGUAGE]-------
-------DQL [DATA QUERY LANGUAGE]--------------
-------DCL [DATA CONTROL LANGUAGE]------------




