############################ TASK 2 ########################################################

USE Travego;

-- a. How many female passengers traveled a minimum distance of 600 KMs?

SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END) Female FROM passenger WHERE Distance >= 600; 

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
   
SELECT * FROM Passenger where Distance > 500 AND Bus_type = 'Sleeper';

-- c. Select passenger names whose names start with the character 'S'.

SELECT * FROM Passenger WHERE Passenger_name like 'S%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output.

SELECT P1.Passenger_name, P1.Boarding_city, P1.Destination_city, P1.Bus_type, P2.Price FROM Passenger P1, Price P2
WHERE P1.Distance = P2.Distance;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 

SELECT P1.Passenger_name, P2.Price FROM Passenger P1, Price P2 WHERE P1.Distance > 1000 and P1.Bus_type ='Sitting';
# RETURN : No one traveled to 1000Kms whose in sitting bus. 

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT Bus_type, Price FROM Price WHERE Distance = (SELECT Distance FROM Passenger WHERE Passenger_name = 'Pallavi');

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper

SELECT * FROM Passenger;
UPDATE Passenger SET Category = 'NON-AC' WHERE Bus_type = 'Sleeper';
SELECT * FROM Passenger;

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.

DELETE FROM Passenger WHERE Passenger_name = 'Piyush';
COMMIT;
SELECT * FROM Passenger;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required).

TRUNCATE TABLE Passenger;
SELECT * FROM Passenger;  -- Checking , if the data is deleted or not

-- j. Delete the table passenger from the database.

DROP TABLE Passenger; 