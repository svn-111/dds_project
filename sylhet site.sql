--Created by Md Atiqur Rahman
clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE or REPLACE PROCEDURE register_user(name IN users.name%TYPE, nid IN users.nid%TYPE)
IS
	random_center_no NUMBER;
	random_vaccine_no NUMBER;
	cnt NUMBER;
BEGIN
	
	select COUNT(*) into cnt from vaccine_center;
	
	random_center_no := trunc(dbms_random.value(1, cnt + 1));
	
	select COUNT(*) into cnt from vaccine_record;
	
	random_vaccine_no := trunc(dbms_random.value(1, cnt + 1));
	
	INSERT into users values(nid, name, 'Sylhet', random_vaccine_no, random_center_no);
	
	EXCEPTION 
		when DUP_VAL_ON_INDEX then
			DBMS_OUTPUT.PUT_LINE('User already exists');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');

end;
/

CREATE OR REPLACE TRIGGER INSERT_MSG
AFTER INSERT 
ON users
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('User created!');
	
	--insert into users@server values(:new.nid, :new.name, 'Dhaka', '', '')
	
END;
/

accept 	NAME CHAR PROMPT "Enter your name = "
accept NID CHAR PROMPT "NID = "

DECLARE
	name users.name%TYPE;
	nid users.nid%TYPE;
BEGIN
		
	name := '&NAME';
	nid := '&NID';
	register_user(name, nid);
	
END;
/