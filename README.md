# Airbnb-Data-Analysis

Overview
This project aims to perform an analysis of Airbnb data to gain insights into property listings, hosts, and guest preferences. The dataset used for this analysis contains information about Airbnb listings in a specific location.

Dataset
The dataset used for this analysis is sourced from Airbnb and includes the following columns:

Id: Unique identifier for each property listing.
Name: Name of the property listing.
host_Id: Unique identifier for the host of the property.
host_name: Name of the host.
neighbourhood_group: Neighbourhood group where the property is located.
Neighborhood: Specific neighborhood where the property is located.
Latitude: Latitude coordinate of the property.
Longitude: Longitude coordinate of the property.
room_type: Type of room offered in the listing (e.g., Entire home/apt, Private room, Shared room).
Price: Price per night for the property.
Minimum_nights: Minimum number of nights required for booking.
number_of_reviews: Total number of reviews for the property.
last_review: Date of the last review.
reviews_per_month: Average number of reviews per month.
calculated_host_listings_count: Number of listings by the host.
availability_365: Number of days the property is available for booking in a year.
Analysis
This analysis aims to answer the following questions:

In which neighborhood group are the maximum number of properties listed?
Which host has the maximum number of properties listed?
Which host is the busiest based on the number of listings?
What is the most preferred room type in each neighborhood group?
What is the average price for different property types?
What is the total availability of properties for each room type?
Which property has the maximum number of reviews?
Methodology
The analysis is conducted using SQL queries to extract relevant information from the dataset. Each question is addressed using appropriate SQL queries that retrieve the required data and provide insights into the Airbnb listings.

Dependencies
SQL database management system (e.g., MySQL, PostgreSQL)
Dataset (provided in CSV format)
Usage
Ensure that you have set up a database management system (DBMS) and imported the dataset.
Execute the SQL queries provided in the analysis section to retrieve insights from the dataset.
Analyze the results to gain insights into Airbnb property listings, hosts, and guest preferences.
