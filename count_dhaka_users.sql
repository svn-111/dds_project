SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION count_users_in_dhaka RETURN INTEGER AS
  total_users INTEGER;
BEGIN
  SELECT COUNT(*) INTO total_users FROM (
    SELECT city FROM users WHERE city = 'Dhaka'
    UNION ALL
    SELECT city FROM users@site_link WHERE city = 'Dhaka'
    -- Add more similar UNION ALL statements for other tables if needed
  );

  RETURN total_users;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 0; -- Return 0 or handle the exception as per your requirement
END;
/
DECLARE
cnt INTEGER:=count_users_in_dhaka;
BEGIN
	DBMS_OUTPUT.PUT_LINE(cnt);
END;
/


