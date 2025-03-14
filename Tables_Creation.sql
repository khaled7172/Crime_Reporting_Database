-- Use the Crime_Reporting_System database
USE [Crime_Reporting_System];
GO

-- Create Residents Table
CREATE TABLE Residents (
    SSN INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Number VARCHAR(15),
    City VARCHAR(50),
    Street VARCHAR(50), 
    Apartment VARCHAR(10), 
    Gender CHAR(1),  
    Date_Of_Birth DATE
);
GO

-- Create Categories Table
CREATE TABLE Categories (
    Code VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Degree_Of_Affection VARCHAR(50)
);
GO

-- Create Policemen Table
CREATE TABLE Policemen (
    SSN INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Number VARCHAR(15),
    City VARCHAR(50),
    Street VARCHAR(50),
    Apartment VARCHAR(10),
    Joining_Date DATE,
    Salary DECIMAL(10, 2)
);
GO

-- Create Crime_Reports Table
CREATE TABLE Crime_Reports (
    ID INT PRIMARY KEY,
    Date_Time_Of_Witness DATETIME,
    Location_City VARCHAR(50),
    Location_Street VARCHAR(50),
    Location_Apartment VARCHAR(10),
    Description TEXT,
    Images VARBINARY(MAX),
    Status VARCHAR(20),
    Policeman_SSN INT,
    Resident_SSN INT,
    Category_Code VARCHAR(10),
    FOREIGN KEY (Policeman_SSN) REFERENCES Policemen(SSN),
    FOREIGN KEY (Resident_SSN) REFERENCES Residents(SSN),
    FOREIGN KEY (Category_Code) REFERENCES Categories(Code)
);
GO

-- Create Response_Actions Table
CREATE TABLE Response_Actions (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Target VARCHAR(50),
    Description TEXT,
    Date_Time_Of_Action DATETIME,
    Status VARCHAR(20),
    Policeman_SSN INT,
    Crime_Report_ID INT,
    FOREIGN KEY (Policeman_SSN) REFERENCES Policemen(SSN),
    FOREIGN KEY (Crime_Report_ID) REFERENCES Crime_Reports(ID)
);
GO

-- Insert Data into Residents Table
INSERT INTO Residents (SSN, First_Name, Middle_Name, Last_Name, Contact_Number, City, Street, Apartment, Gender, Date_Of_Birth)
VALUES 
(101, 'John', 'A', 'Doe', '555-1234', 'Beirut', 'Street 1', 'Apt 1', 'M', '1990-01-01'),
(102, 'Jane', 'B', 'Doe', '555-2345', 'Tripoli', 'Street 2', 'Apt 2', 'F', '1985-02-02'),
(103, 'Jim', 'C', 'Bean', '555-3456', 'Sidon', 'Street 3', 'Apt 3', 'M', '1980-03-03'),
(104, 'Jill', 'D', 'Hill', '555-4567', 'Tyre', 'Street 4', 'Apt 4', 'F', '1995-04-04'),
(105, 'Jack', 'E', 'Black', '555-5678', 'Zahle', 'Street 5', 'Apt 5', 'M', '2000-05-05');
GO

-- Insert Data into Categories Table
INSERT INTO Categories (Code, Name, Degree_Of_Affection)
VALUES 
('SEC01', 'Social Security Threat', 'High'),
('SEC02', 'Theft', 'High'),
('SEC03', 'Assault', 'Medium'),
('SEC04', 'Fraud', 'Low'),
('SEC05', 'Vandalism', 'Medium');
GO

-- Insert Data into Policemen Table
INSERT INTO Policemen (SSN, First_Name, Middle_Name, Last_Name, Contact_Number, City, Street, Apartment, Joining_Date, Salary)
VALUES 
(201, 'John', 'A', 'Smith', '555-1111', 'Beirut', 'Street A', 'Apt A', '2021-01-01', 3000.00),
(202, 'Jane', 'B', 'Doe', '555-2222', 'Tripoli', 'Street B', 'Apt B', '2020-02-02', 3200.00),
(203, 'Jim', 'C', 'Beam', '555-3333', 'Sidon', 'Street C', 'Apt C', '2019-03-03', 3100.00),
(204, 'Jill', 'D', 'Hill', '555-4444', 'Tyre', 'Street D', 'Apt D', '2022-04-04', 3300.00),
(205, 'Jack', 'E', 'Black', '555-5555', 'Zahle', 'Street E', 'Apt E', '2023-05-05', 3400.00);
GO

-- Insert Data into Crime_Reports Table
INSERT INTO Crime_Reports (ID, Date_Time_Of_Witness, Location_City, Location_Street, Location_Apartment, Description, Images, Status, Policeman_SSN, Resident_SSN, Category_Code)
VALUES 
(301, '2023-12-01 08:00:00', 'Beirut', 'Street 1', 'Apt 1', 'Sample description 1', NULL, 'Pending', 201, 101, 'SEC01'),
(302, '2023-12-02 09:00:00', 'Tripoli', 'Street 2', 'Apt 2', 'Sample description 2', NULL, 'Resolved', 202, 102, 'SEC02'),
(303, '2023-12-03 10:00:00', 'Sidon', 'Street 3', 'Apt 3', 'Sample description 3', NULL, 'Open', 203, 103, 'SEC03'),
(304, '2023-12-04 11:00:00', 'Tyre', 'Street 4', 'Apt 4', 'Sample description 4', NULL, 'Pending', 204, 104, 'SEC04'),
(305, '2023-12-05 12:00:00', 'Zahle', 'Street 5', 'Apt 5', 'Sample description 5', NULL, 'Resolved', 205, 105, 'SEC05');
GO

-- Insert Data into Response_Actions Table
INSERT INTO Response_Actions (ID, Name, Target, Description, Date_Time_Of_Action, Status, Policeman_SSN, Crime_Report_ID)
VALUES 
(401, 'Patrol', 'Location 1', 'Patrolling the area', '2023-12-01 08:30:00', 'Completed', 201, 301),
(402, 'Investigation', 'Location 2', 'Investigating the crime', '2023-12-02 09:30:00', 'In Progress', 202, 302),
(403, 'Arrest', 'Location 3', 'Arresting suspects', '2023-12-03 10:30:00', 'Pending', 203, 303),
(404, 'Report Writing', 'Location 4', 'Writing the report', '2023-12-04 11:30:00', 'Completed', 204, 304),
(405, 'Surveillance', 'Location 5', 'Conducting surveillance', '2023-12-05 12:30:00', 'In Progress', 205, 305);
GO
