#Airbnb Data Analysis 
# DATA Addition(extraction)
CREATE TABLE AB_NYC_2019 (
    Id INT,
    Name VARCHAR(60),
    host_Id INT,
    host_name VARCHAR(50),
    neighbourhood_group CHAR(50),
    Neighborhood CHAR(50),
    Latitude FLOAT,
    Longitude FLOAT,
    room_type CHAR(20),
    Price INT,
    Minimum_nights INT,
    number_of_reviews INT,
    last_review DATE,
    reviews_per_month INT,
    calculayed_hots_listings_count INT,
    availability_365 INT
);

show table status;
Show FULL COLUMNS FROM AB_NYC_2019;
SET GLOBAL local_infile =1;

SELECT * FROM AB_NYC_2019;

# DATA cleansing 

UPDATE AB_NYC_2019
SET last_review = NULL
WHERE last_review = '';

UPDATE AB_NYC_2019
SET reviews_per_month = NULL
WHERE reviews_per_month = '';

SELECT * FROM AB_NYC_2019;

DELETE FROM ab_nyc_2019
WHERE reviews_per_month IS NULL;

UPDATE AB_NYC_2019
SET last_review = 2017-01-07
WHERE last_review IS NULL;

#Verify
SELECT * FROM AB_NYC_2019;

# Grouping by price per neighbourhood_group:
SELECT DISTINCT neighbourhood_group, AVG (Price) AS avg_price
  FROM AB_NYC_2019
GROUP BY neighbourhood_group  

# DATA Visualisation questions
#Q1. In which Neighbourhood group there is maximum number of properties listed ?

SELECT neighbourhood_group, COUNT(*) AS property_count
FROM AB_NYC_2019
GROUP BY neighbourhood_group
ORDER BY property_count DESC
LIMIT 1;

#Ans :-It shows that Neighbourhood Brooklyn has the highest number of property count,which is 27.

#Q2.Which host has maximum number of properties listed ?

SELECT host_id, host_name, COUNT(*) AS property_count
FROM AB_NYC_2019
GROUP BY host_id, host_name
ORDER BY property_count DESC
LIMIT 1;

#Ans :- Host ID 22486 Lisel has the highest number of property count of 3.

#Q3. Which host has maximum properties listed in neighbourhood groups having maximum properties listed ?

SELECT host_id, host_name, COUNT(*) AS property_count
FROM AB_NYC_2019
WHERE neighbourhood_group IN (
    SELECT neighbourhood_group
    FROM AB_NYC_2019
    GROUP BY neighbourhood_group
    HAVING COUNT(*) = (
        SELECT MAX(property_count)
        FROM (
            SELECT COUNT(*) AS property_count
            FROM AB_NYC_2019
            GROUP BY neighbourhood_group
        ) AS subquery
    )
)
GROUP BY host_id, host_name
ORDER BY property_count DESC
LIMIT 1;

#Ans:- Host ID 22486 Lisel has the highest number of property count of 3.

#Q4. What is the average price in different properties listed ?

SELECT room_type, AVG(Price) AS average_price
FROM AB_NYC_2019
GROUP BY room_type;

#Ans:- Average Prices according to Room types are as follows :- Private Room - 86.9630, Entire home/apt - 152.2000, Shared Room - 40.0000.

#Q5. What is the most prefered room type in the every neighbourhood groups ?

SELECT 
    neighbourhood_group,
    room_type
FROM (
    SELECT 
        neighbourhood_group,
        room_type,
        RANK() OVER (PARTITION BY neighbourhood_group ORDER BY room_type_count DESC) AS room_rank
    FROM (
        SELECT 
            neighbourhood_group,
            room_type,
            COUNT(*) AS room_type_count
        FROM AB_NYC_2019
        GROUP BY neighbourhood_group, room_type
    ) AS counts
) AS ranked_room_types
WHERE room_rank = 1;

#Ans:- In Brooklyn it is Entire Appartment , Manhattan it is Private Room, Queens it is Private Room.

#Q6. Total availability of properties having different room type?

SELECT 
    room_type,
    SUM(availability_365) AS total_availability
FROM AB_NYC_2019
GROUP BY room_type;

#Ans:- Total Availability of properties having different room types are Private Room:- 6489, Entire home/apt :- 3634, Shared Room :- 188.

#Q7. Which one is the busiest host ?

SELECT 
    host_id,
    host_name,
    COUNT(*) AS total_listings
FROM AB_NYC_2019
GROUP BY host_id, host_name
ORDER BY total_listings DESC
LIMIT 1;

#Ans:- It is Lisel 22486 having total listings as 3.

#Q8. Which property has maximum number of reviews ?

SELECT 
    Id,
    Name,
    host_id,
    host_name,
    neighbourhood_group,
    Neighbourhood,
    Latitude,
    Longitude,
    room_type,
    Price,
    Minimum_nights,
    number_of_reviews,
    last_review,
    reviews_per_month,
    calculated_host_listings_count,
    availability_365
FROM AB_NYC_2019
ORDER BY number_of_reviews DESC
LIMIT 1;

#Ans:- Property having maximum number of reviews is Large Furnished Room near B'way having a total of 430 reviews.

#Thankyou!