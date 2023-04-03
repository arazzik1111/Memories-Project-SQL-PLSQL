-----Creating 6 tables


CREATE TABLE area (
    Size1    NUMBER(6, 2) NOT NULL,
    land_name VARCHAR2(30),
    color     VARCHAR2(30),
    terrain   VARCHAR2(20 CHAR),
    type      VARCHAR2(20 CHAR)
);

ALTER TABLE area
    ADD CHECK ( color IN ( 'Black', 'Green', 'Pink', 'Yellow' ) );

ALTER TABLE area
    ADD CHECK ( terrain IN ( 'Happy', 'Impressive', 'Lonely', 'Sad', 'Together' ) );

ALTER TABLE area
    ADD CHECK ( type IN ( 'Land', 'Sea' ) );

ALTER TABLE area ADD CONSTRAINT area_pk PRIMARY KEY ( Size1 );

CREATE TABLE dev_mem (
    device_device_id   NUMBER(5) NOT NULL,
    memories_memory_id NUMBER(6) NOT NULL
);

ALTER TABLE dev_mem ADD CONSTRAINT relation_6_pk PRIMARY KEY ( device_device_id,
                                                               memories_memory_id );

CREATE TABLE device (
    device_id    NUMBER(5) NOT NULL,
    availibility CHAR(1) NOT NULL,
    type         VARCHAR2(20 CHAR) NOT NULL,
    capacity     VARCHAR2(30 CHAR) NOT NULL
);


ALTER TABLE device ADD CONSTRAINT device_pk PRIMARY KEY ( device_id );


CREATE TABLE memories (
    memory_id    NUMBER(6) NOT NULL,
    memory_title VARCHAR2(150) NOT NULL,
    type         VARCHAR2(20 CHAR) NOT NULL,
    user_user_id NUMBER(10) NOT NULL,
    color        VARCHAR2(30) NOT NULL,
    area_size    NUMBER(6, 2) NOT NULL
);

ALTER TABLE memories
    ADD CHECK ( type IN ( 'Happy', 'Impressive', 'Lonely', 'Sad', 'Together' ) );

ALTER TABLE memories
    ADD CHECK ( color IN ( 'Black', 'Green', 'Pink', 'Yellow' ) );

ALTER TABLE memories ADD CONSTRAINT memories_pk PRIMARY KEY ( memory_id );

CREATE TABLE people (
    memories_memory_id NUMBER(6) NOT NULL,
    name_people        VARCHAR2(30),
    relationship       VARCHAR2(30 CHAR),
    country            VARCHAR2(30 CHAR)
);

ALTER TABLE people
    ADD CHECK ( relationship IN ( 'BFF', 'Family', 'Friend', 'Mate' ) );

CREATE TABLE User1 (
    user_id  NUMBER(10) NOT NULL,
    username VARCHAR2(100 CHAR) NOT NULL,
    gender   VARCHAR2(30) NOT NULL,
    adress   VARCHAR2(250 CHAR),
    age      NUMBER(3)
);

ALTER TABLE User1
    ADD CHECK ( gender IN ( 'Female', 'Male' ) );

ALTER TABLE User1 ADD CONSTRAINT user_pk PRIMARY KEY ( user_id );

ALTER TABLE memories
    ADD CONSTRAINT memories_area_fk FOREIGN KEY ( area_size )
        REFERENCES area ( Size1 );

ALTER TABLE memories
    ADD CONSTRAINT memories_user_fk FOREIGN KEY ( user_user_id )
        REFERENCES User1 ( user_id );

ALTER TABLE people
    ADD CONSTRAINT people_memories_fk FOREIGN KEY ( memories_memory_id )
        REFERENCES memories ( memory_id );

ALTER TABLE dev_mem
    ADD CONSTRAINT relation_6_device_fk FOREIGN KEY ( device_device_id )
        REFERENCES device ( device_id );

ALTER TABLE dev_mem
    ADD CONSTRAINT relation_6_memories_fk FOREIGN KEY ( memories_memory_id )
        REFERENCES memories ( memory_id );
        
        
        
        


------POPULATING THE DATA


INSERT INTO device (device_id, availibility, type, capacity)
VALUES (4, 'Y', 'Drone', '4K video');


INSERT INTO User1 (user_id, username, gender, adress, age)
VALUES (4, 'dave123', 'Male', '123 Main St, Kathmandu, Nepal', 29);


INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (5, 'Serengeti National Park', 'Yellow', 'Together', 'Land');

INSERT INTO device (device_id, availibility, type, capacity)
VALUES (5, 'Y', 'GoPro', 'Full HD video');



INSERT INTO User1 (user_id, username, gender, adress, age)
VALUES (5, 'eve123', 'Female', '123 Main St, Arusha, Tanzania', 32);


INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (6, 'Yellowstone National Park', 'Yellow', 'Impressive', 'Land');

INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (7, 'Great Barrier Reef', 'Yellow', 'Together', 'Sea');

INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (8, 'Maldives', 'Black', 'Together', 'Sea');

INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (9, 'Santorini', 'Pink', 'Together', 'Land');

INSERT INTO area (Size1, land_name, color, terrain, type)
VALUES (10, 'Taj Mahal', 'Pink', 'Impressive', 'Land');


INSERT INTO device (device_id, availibility, type, capacity)
VALUES (6, 'Y', 'Smartphone', '128GB');

INSERT INTO device (device_id, availibility, type, capacity)
VALUES (7, 'Y', 'GoPro', 'Full HD video');

INSERT INTO device (device_id, availibility, type, capacity)
VALUES (8, 'Y', 'DSLR', '24.3MP');

INSERT INTO device (device_id, availibility, type, capacity)
VALUES (9, 'Y', 'Smartwatch', '512MB');

INSERT INTO User1 (user_id, username, gender, adress, age)
VALUES (1, 'johnsmith', 'Male', '123 Main Street, New York, NY 10001', 35);

INSERT INTO User1 (user_id, username, gender, adress, age)
VALUES (2, 'janebrown', 'Female', '456 Maple Avenue, Los Angeles, CA 90001', 30);

INSERT INTO User1 (user_id, username, gender, adress, age)
VALUES (3, 'bobgreen', 'Male', '789 Pine Street, Chicago, IL 60601', 40);





INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (6, 'Ski trip in Aspen', 'Happy', 1, 'Yellow', 6);

INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (7, 'Scuba diving in the Great Barrier Reef', 'Together', 2, 'Green', 7);

INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (8, 'Honeymoon in the Maldives', 'Together', 3, 'Green', 8);

INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (9, 'Sunset dinner in Santorini', 'Together', 4, 'Black', 9);

INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (10, 'Wedding at the Taj Mahal', 'Impressive', 5, 'Black', 10);

INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (6, 'Jack', 'Family', 'USA');

INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (7, 'Jill', 'Friend', 'Canada');

INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (8, 'Eve', 'Mate', 'UK');

INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (9, 'Dave', 'BFF', 'Australia');

INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (10, 'Charlie', 'Family', 'New Zealand');


INSERT INTO dev_mem (device_device_id, memories_memory_id)
VALUES (6, 6);

INSERT INTO dev_mem (device_device_id, memories_memory_id)
VALUES (7, 7);

INSERT INTO dev_mem (device_device_id, memories_memory_id)
VALUES (8, 8);

INSERT INTO dev_mem (device_device_id, memories_memory_id)
VALUES (9, 9);

INSERT INTO dev_mem (device_device_id, memories_memory_id)
VALUES (4, 10);


-----Adding Denormalization by having name_people in Memories table as well!
---ALTER TABLE memories
---ADD name_people VARCHAR2(30);


---Updating and seeing it in practice.
---UPDATE memories m
--SET m.name_people = (SELECT p.name_people FROM people p WHERE p.memories_memory_id = m.memory_id);
---commit;



----add the people_count column to the memories table
ALTER TABLE memories ADD people_count NUMBER DEFAULT 0;

----create a trigger that will update the people_count column whenever a new person is inserted into the people table
CREATE OR REPLACE TRIGGER update_people_count
AFTER INSERT ON people
FOR EACH ROW
BEGIN
  UPDATE memories SET people_count = people_count + 1 WHERE memory_id = :new.memories_memory_id;
END;


---create another trigger that will update the people_count column whenever a person is deleted from the people table
--CREATE OR REPLACE TRIGGER update_people_count
--AFTER DELETE ON people
--FOR EACH ROW
--BEGIN
--  UPDATE memories SET people_count = people_count - 1 WHERE memory_id = :old.memories_memory_id;
--END;
commit;


----Populating data
INSERT INTO people (memories_memory_id, name_people, relationship, country)
VALUES (10, 'Sarah', 'Friend', 'USA');
--commit;



-----Diverse SQL queries
---Show only where the gender is Female and age is between 25 and 35
SELECT username, gender, age
FROM User1
WHERE gender = 'Female' AND age BETWEEN 25 AND 35;




----SQL queries
SELECT memories.memory_title, people.name_people, people.country, COUNT(*) AS people_count
FROM memories
JOIN people ON memories.memory_id = people.memories_memory_id
WHERE (memories.type IN ('Happy', 'Together') AND people.relationship = 'Friend') OR memories.type = 'Impressive'
GROUP BY memories.memory_title, people.name_people, people.country
HAVING COUNT(*) > 1 OR COUNT(*) = 1
ORDER BY memories.memory_title ASC;




---SQL complex query using Delete, and subqueries
SELECT * FROM User1 WHERE gender = 'Female' AND age BETWEEN 5 AND 50;

----subquery
UPDATE User1
SET age = 20
WHERE user_id IN (SELECT user_id FROM User1 WHERE gender = 'Female' AND age BETWEEN 5 AND 50);




select *
from memories;



-----changing from in to IN in memory_title
UPDATE memories
SET memory_title = REPLACE(memory_title, 'in', 'IN')
WHERE INSTR(memory_title, 'in') > 0;

----only first 10 characters from memory_title
SELECT SUBSTR(TRIM(memory_title), 1, 10) AS "First 10"
FROM memories;


---Creating a view to show only available devices
CREATE or replace VIEW available_devices AS
SELECT device_id, type, capacity
FROM Device
WHERE availibility = 'Y';
---testing the view
Select *
from available_devices;



----Creating a sequence
CREATE SEQUENCE memories_seq
  START WITH 20
  INCREMENT BY 1;

---testing it
INSERT INTO memories (memory_id, memory_title, type, user_user_id, color, area_size)
VALUES (memories_seq.NEXTVAL, 'Ski trip in Aspen', 'Happy', 1, 'Yellow', 6);

select *
from memories;




----Creating a synonym
CREATE SYNONYM people_syn FOR people;

--testing it
SELECT * FROM people_syn
WHERE (relationship = 'BFF' AND country = 'USA')
OR (relationship = 'Family' AND country = 'Nepal');




-----Granting acess
REVOKE INSERT, SELECT, UPDATE, DELETE ON user1 from PUBLIC;
revoke INSERT, SELECT, UPDATE, DELETE ON memories from PUBLIC;
revoke SELECT ON people from PUBLIC;


---Creating a role for administrators
CREATE ROLE administrator_role;
GRANT CREATE, SELECT, INSERT, UPDATE, 
DELETE ON ALL TABLES TO administrator_role;

-----Creating a role for users
CREATE ROLE users;
GRANT INSERT, SELECT, UPDATE, DELETE ON user1 TO users;
GRANT INSERT, SELECT, UPDATE, DELETE ON memories TO users;
GRANT SELECT ON people TO users;






------transactions
BEGIN
    INSERT INTO people (memories_memory_id, name_people, relationship, country)
    VALUES (100, 'John', 'Friend', 'USA');

    UPDATE memories
    SET people_count = people_count + 1
    WHERE memory_id = 100;

    -- commit the transaction if there s no error
    COMMIT;
EXCEPTION
    -- If any error, then roll back the transaction
    WHEN OTHERS THEN
        ROLLBACK;
END;



set serveroutput on;

CREATE OR REPLACE PROCEDURE iterate_user1 (p_num INTEGER)
AS
  v_counter INTEGER := 1;
BEGIN
  -- Verify that the given number is within the range of the number of rows in the table
  IF p_num <= 0 OR p_num > (SELECT COUNT(*) FROM user1) THEN
    RAISE_APPLICATION_ERROR(-20001, 'Invalid num');
  END IF;
  
  -- Iterate p_num rows
  FOR user_rec IN (SELECT * FROM user1) LOOP
    DBMS_OUTPUT.PUT_LINE('Username: ' || user_rec.username || ', Gender: ' || user_rec.gender);
    v_counter := v_counter + 1;
    -- Exit the loop if we have reached the given number of rows
    EXIT WHEN v_counter > p_num;
  END LOOP;
END;
/


--creating a procedure, cursor, loops, iteration
CREATE OR REPLACE PROCEDURE iterate_user1_rows (num_rows IN INTEGER)
AS
  CURSOR user1_cur IS
    SELECT * FROM User1;
  user1_rec user1_cur%ROWTYPE;
BEGIN
  FOR i IN 1..num_rows
  LOOP
    FETCH user1_cur INTO user1_rec;
    DBMS_OUTPUT.PUT_LINE(user1_rec.user_id || ' - ' || user1_rec.username || ' - ' || user1_rec.gender || ' - ' || user1_rec.adress || ' - ' || user1_rec.age);
  END LOOP;
  CLOSE user1_cur;
END;
/


----to test
BEGIN
  iterate_user1_rows(5);
END;
/



----Creating the function
CREATE OR REPLACE FUNCTION get_memory_title (p_input_string IN VARCHAR2)
RETURN VARCHAR2
AS
  l_output_string VARCHAR2(255);
BEGIN
  SELECT memory_title INTO l_output_string
  FROM memories
  WHERE memory_title = p_input_string;

  RETURN l_output_string;
END;
/

-----testing the function
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_memory_title('Honeymoon IN the Maldives'));
END;
/


-----using triggers and if else conditions
Create or Replace trigger prevent_gender_change
Before Update of gender ON User1
for each row
Begin
IF :NEW.gender <> :OLD.gender THEN
RAISE_APPLICATION_ERROR(-20000, 'Cannot change gender');
END IF;
END;
/



select * 
from memories;





