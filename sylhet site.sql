--Created by Md Atiqur Rahman
clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE user_registration_pkg AS
  PROCEDURE register_user(name IN users.name%TYPE, nid IN users.nid%TYPE);
END;
/

CREATE OR REPLACE PACKAGE BODY user_registration_pkg AS

  PROCEDURE register_user(name IN users.name%TYPE, nid IN users.nid%TYPE) IS
    random_center_no NUMBER;
    random_vaccine_no NUMBER;
    cnt NUMBER;
  BEGIN
    SELECT COUNT(*) INTO cnt FROM vaccine_center;
    random_center_no := trunc(dbms_random.value(1, cnt + 1));

    SELECT COUNT(*) INTO cnt FROM vaccine_record;
    random_vaccine_no := trunc(dbms_random.value(1, cnt + 1));

    INSERT INTO users VALUES (nid, name, 'Sylhet', random_vaccine_no, random_center_no);
    
    EXCEPTION 
      WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('User already exists');
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Other errors');
  END;

END;
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

accept NAME CHAR PROMPT "Enter your name = "
accept NID CHAR PROMPT "NID = "

DECLARE
  name users.name%TYPE;
  nid users.nid%TYPE;
BEGIN
  name := '&NAME';
  nid := '&NID';
  user_registration_pkg.register_user(name, nid);
END;
/
