/*
CREATE DATABASE OlaDB;
GO
*/

/*
USE OlaDB
*/

/*
SELECT * 
FROM pune_ride_data_july_2026;
GO
*/

---------------------------------------
---------------------------------------
-- SQL Questions --->
-- #1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT *
FROM pune_ride_data_july_2026
WHERE Booking_Status = 'Success';

-- #2. Find the average ride distance for each vehicle type:
CREATE VIEW Avg_Ride_Distance_For_Each_Vehicle AS
SELECT
	Vehicle_Type,
	ROUND(AVG(Ride_Distance), 2) AS Avg_Ride_Distance
FROM pune_ride_data_july_2026
GROUP BY Vehicle_Type;

-- #3. Get the total number of cancelled rides by customers:
CREATE VIEW Cancelled_Rides_By_Customers AS 
SELECT COUNT(*) AS Cancelled_Rides_By_Customers
FROM pune_ride_data_july_2026
WHERE Booking_Status = 'Canceled by Customer';

-- #4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Highest_Rides_Top_5_Customers AS
SELECT TOP 5
	Customer_ID,
	COUNT(Booking_ID) AS Total_Rides
FROM pune_ride_data_july_2026
GROUP BY Customer_ID
ORDER BY Total_Rides DESC;

-- #5. Get the number of rides cancelled by drivers due to personal 
-- and car-related issues:
CREATE VIEW Rides_Cancelled_By_Drivers_P_C_Issues AS
SELECT 
	COUNT(*) AS Cancelled_by_Driver
FROM pune_ride_data_july_2026
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issues';

-- #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_and_Min_Driver_Ratings AS
SELECT 
	MAX(Driver_Ratings) AS Max_Driver_Ratings,
	MIN(Driver_Ratings) AS Min_Driver_Ratings
FROM pune_ride_data_july_2026
WHERE Vehicle_Type = 'Prime Sedan';

-- #7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT *
FROM pune_ride_data_july_2026
WHERE Payment_Method = 'UPI'

-- #8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Customer_Rating AS
SELECT
	Vehicle_Type,
	ROUND( AVG(Customer_Rating), 2 ) AS Avg_Customer_Ratings
FROM pune_ride_data_july_2026
GROUP BY Vehicle_Type;

-- #9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_Successful_Ride_Value AS
SELECT
	FORMAT( SUM(Booking_Value), 'C0', 'en-US') AS Total_Successful_Ride_Value
FROM pune_ride_data_july_2026
WHERE Booking_Status = 'Success'

--10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT 
	Booking_ID,
	Incomplete_Rides_Reason
FROM pune_ride_data_july_2026
WHERE Incomplete_Rides = 1


---------------------------------------
---------------------------------------
-- Views --->
-- #1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;

-- #2. Find the average ride distance for each vehicle type:
SELECT * FROM Avg_Ride_Distance_For_Each_Vehicle;

-- #3. Get the total number of cancelled rides by customers:
SELECT * FROM Cancelled_Rides_By_Customers;

-- #4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM Highest_Rides_Top_5_Customers;

-- #5. Get the number of rides cancelled by drivers due to personal 
-- and car-related issues:
SELECT * FROM Rides_Cancelled_By_Drivers_P_C_Issues;

-- #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM Max_and_Min_Driver_Ratings;

-- #7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_Payment;

-- #8. Find the average customer rating per vehicle type:
SELECT * FROM Avg_Customer_Rating;

-- #9. Calculate the total booking value of rides completed successfully:
SELECT * FROM Total_Successful_Ride_Value;

-- #10. List all incomplete rides along with the reason:
SELECT * FROM Incomplete_Rides_Reason;
