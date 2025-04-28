-- Create Database
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- CREATE
-- Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY NOT NULL,
    DoctorName VARCHAR(30) NOT NULL,
    ConsultationFees DECIMAL(10, 2) NOT NULL
);

-- Create Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    VisitDate DATE NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Equipment Table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY NOT NULL,
    EquipmentName VARCHAR(30) NOT NULL,
    EquipmentPrice DECIMAL(10,2) NOT NULL
);

-- Create Treatments Table
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY NOT NULL,
    TreatmentName VARCHAR(30) NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create PatientTreatment Junction Table
CREATE TABLE PatientTreatment (
    PatientID INT NOT NULL,
    TreatmentID INT NOT NULL,
    PRIMARY KEY (PatientID, TreatmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

-- Create PatientEquipment Junction Table
CREATE TABLE PatientEquipment (
    PatientID INT NOT NULL,
    EquipmentID INT NOT NULL,
    PRIMARY KEY (PatientID, EquipmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Create Medications Table
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY NOT NULL,
    MedicationName VARCHAR(30) NOT NULL,
    MedicationPrice DECIMAL(10,2) NOT NULL,
    TreatmentID INT NOT NULL,
    PatientID INT NOT NULL,
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- INSERT
-- Inserting Data into Doctors Table
INSERT INTO Doctors (DoctorID, DoctorName, ConsultationFees) VALUES
(1, 'Dr.Laura Taylor', 150.00), 
(2, 'Dr. William Brown', 180.00), 
(3, 'Dr. Sophia Harris', 140.00), 
(4, 'Dr. Maria Gomez', 160.00), 
(5, 'Dr. Michael Adams', 155.00), 
(6, 'Dr. Henry Martinez', 165.00), 
(7, 'Dr. Lisa Clark', 170.00), 
(8, 'Dr. Daniel Wilson', 175.00);

-- Inserting Data into Patients Table
INSERT INTO Patients (PatientID, FirstName, LastName, PhoneNumber, Address, 
VisitDate, DoctorID) VALUES
(1, 'Alice', 'Green', '2125551234', '123 Health St', '2023-01-10', 2),
(2, 'Michael', 'Johnson', '5185552233', '234 Health St', '2023-05-12', 1),
(3, 'John', 'Black', '2125555678', '456 Wellness Blvd', '2023-03-15', 3),
(4, 'Olivia', 'Roberts', '4785553344', '567 Wellness Blvd', '2023-09-25', 7),
(5, 'Emily', 'White', '2125558765', '789 Medical Rd', '2023-07-20', 8),
(6, 'Liam', 'Thompson', '2125555566', '890 Medical Rd', '2023-11-30', 6);

-- Inserting Data into Equipment Table
INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentPrice) VALUES
(1, 'Glucose Meters', 80.00), 
(2, 'Sphygmomanometers', 120.00), 
(3, 'Cholesterol Meters', 95.00), 
(4, 'ECG Machines', 250.00), 
(5, 'Spirometers', 130.00), 
(6, 'Weighing Scales', 70.00), 
(7, 'TENS Units', 200.00);

-- Inserting Data into Treatment Table
INSERT INTO Treatment (TreatmentID, TreatmentName, DoctorID) VALUES
(1, 'Diabetes Management', 3),
(2, 'Hypertension Control', 8),
(3, 'Cholesterol Management', 1),
(4, 'Cardiovascular Checkup', 2),
(5, 'Asthma Control', 7),
(6, 'Weight Loss Management', 4),
(7, 'Chronic Pain Management', 6);

-- Inserting Data into PatientTreatment Table
INSERT INTO PatientTreatment (PatientID, TreatmentID) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 5),
(5, 2),
(6, 7);

-- Inserting Data into PatientEquipment Table
INSERT INTO PatientEquipment (PatientID, EquipmentID) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 5),
(5, 2),
(6, 7);

-- Inserting Data into Medications Table
INSERT INTO Medications (MedicationID, MedicationName, MedicationPrice, TreatmentID, PatientID) VALUES
(11, 'Insulin', 30.00, 1, 3),
(22, 'Atorvastatin', 15.00, 3, 2),
(33, 'Aspirin', 5.00, 2, 5),
(44, 'Amlodipine', 10.00, 4, 1),
(55, 'Montelukast', 20.00, 5, 4),
(66, 'Acetaminophen', 25.00, 7, 6);

-- 7. Create a variety of SQL queries to retrieve data from one or many tables:

-- 1. Retrieve the data from each table by using the SELECT * statement and order by PK column(s).
-- Doctors Table
SELECT * FROM Doctors ORDER BY DoctorID;

-- Patients Table
SELECT * FROM Patients ORDER BY PatientID;

-- Equipment Table
SELECT * FROM Equipment ORDER BY EquipmentID;

-- Treatment Table
SELECT * FROM Treatment ORDER BY TreatmentID;

-- PatientTreatment Table
SELECT * FROM PatientTreatment ORDER BY PatientID, TreatmentID;

-- PatientEquipment Table
SELECT * FROM PatientEquipment ORDER BY PatientID, EquipmentID;

-- Medication Table
SELECT * FROM Medications ORDER BY MedicationID;

-- 2. Write an SQL involving the junction table and two other related tables. 
-- You must use the INNER JOIN to connect with all three tables. 
-- The database that you created must be included in your SQL queries.
SELECT p.PatientID, p.FirstName, p.LastName, t.TreatmentName, d.DoctorName
FROM PatientTreatment pt
INNER JOIN Patients p ON pt.PatientID = p.PatientID
INNER JOIN Treatment t ON pt.TreatmentID = t.TreatmentID
INNER JOIN Doctors d ON t.DoctorID = d.DoctorID
ORDER BY p.PatientID;

-- 3. Write an SQL by including two or more tables and using the LEFT OUTER JOIN. 
-- Show the results and sort the results by key field(s). 
-- Interpret the results compared to what an INNER JOIN does.
SELECT p.PatientID, p.FirstName, p.LastName, t.TreatmentName, d.DoctorName
FROM Patients p
LEFT OUTER JOIN PatientTreatment pt ON p.PatientID = pt.PatientID
LEFT OUTER JOIN Treatment t ON pt.TreatmentID = t.TreatmentID
LEFT OUTER JOIN Doctors d ON t.DoctorID = d.DoctorID
ORDER BY p.PatientID;

-- 4. Write a single-row subquery. 
-- Show the results and sort the results by key field(s). Interpret the output.
SELECT MedicationName, MedicationPrice
FROM Medications
WHERE MedicationPrice = (
    SELECT MAX(MedicationPrice)
    FROM Medications
    WHERE TreatmentID = 1
);

-- 5. Write a multiple-row subquery. Show the results and sort the results by key field(s).
-- Interpret the output.
SELECT FirstName, LastName
FROM Patients
WHERE DoctorID IN (
    SELECT DoctorID
    FROM Doctors
    WHERE ConsultationFees > 130.00
);

-- 6. Write an SQL to aggregate the results by using multiple columns in the SELECT clause. 
-- Interpret the output.
SELECT d.DoctorName, SUM(d.ConsultationFees) AS TotalFees
FROM Doctors d
JOIN Patients p ON d.DoctorID = p.DoctorID
GROUP BY d.DoctorName;

-- 7. Write a subquery using the NOT IN operator. Show the results and sort the results by key field(s). 
-- Interpret the output.
SELECT DoctorName
FROM Doctors
WHERE DoctorID NOT IN (
    SELECT DoctorID
    FROM Patients
);

-- 8. Write a query using a CASE statement. Show the results and sort the results by key field(s).
--  Interpret the output.
SELECT MedicationName,
       CASE
           WHEN MedicationPrice > 10.00 THEN 'Expensive'
           ELSE 'Affordable'
       END AS PriceCategory
FROM Medications;

-- 9. Write a query using the NOT EXISTS operator. Show the results and sort the results by key field(s). 
-- Interpret the output.
SELECT TreatmentName
FROM Treatment t
WHERE NOT EXISTS (
    SELECT 1
    FROM PatientTreatment pt
    WHERE t.TreatmentID = pt.TreatmentID
);

-- 10. Write a subquery using the NOT NULL operator in the inner query. 
-- Show the results and sort the results by key field(s). Interpret the output.
SELECT FirstName, LastName
FROM Patients
WHERE PhoneNumber IS NOT NULL;













