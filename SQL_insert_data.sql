DECLARE @i int = 1;

WHILE @i <= 100
BEGIN
  INSERT INTO Cairo.Medical_Equipment
  (Device_Name, Device_version_number, Device_manufacture_company, Maintenance_Records, Usage_Logs, Available)
  VALUES
  ('Random Device Name ' + CONVERT(varchar(10), @i), 
          RAND()*100 + 1, -- Generate random version between 1-100
          'Manufacturer ' + CONVERT(varchar(20), @i),
          GETDATE() - RAND()*365, -- Random date within the last year
          GETDATE() - RAND()*30, -- Random date within the last month
          CASE WHEN RAND() >= 0.5 THEN 'Y' ELSE 'N' END);

  SET @i = @i + 1;
END;


INSERT INTO Cairo.Pharmacist (Name, Phone, Address, Gender, E_mail, Birth_day, SSN, Hire_date, Salary, Time_Work, DepartId, Jop_Title, LicenseNum)
VALUES 
('John Doe', '1234567890', '123 Main St', 'M', 'johndoe@example.com', '1980-01-01', 123456789, '2022-01-01', 50000, 40, 1, 'Pharmacist', 12345),
('Jane Smith', '0987654321', '456 Elm St', 'F', 'janesmith@example.com', '1990-02-02', 987654321, '2022-02-01', 55000, 45, 1, 'Pharmacist', 65432);
-- Add more rows as needed

INSERT INTO Cairo.Pharmacist (Name, Phone, Address, Gender, E_mail, Birth_day, SSN, Hire_date, Salary, Time_Work, DepartId, Jop_Title, LicenseNum)
VALUES 
('Michael Brown', '9876543210', '789 Oak St', 'M', 'mikebrown@example.com', '1985-03-03', 987654320, '2022-03-01', 60000, 50, 1, 'Pharmacist', 34567),
('Emily Davis', '8765432109', '321 Pine St', 'F', 'emilydavis@example.com', '1995-04-04', 876543210, '2022-04-01', 65000, 55, 1, 'Pharmacist', 78901),
('James Johnson', '7654321098', '654 Cedar St', 'M', 'jamesjohnson@example.com', '1988-05-05', 765432109, '2022-05-01', 70000, 60, 1, 'Pharmacist', 23456),
('Grace Miller', '6543210987', '987 Birch St', 'F', 'gracemiller@example.com', '1992-06-06', 654321098, '2022-06-01', 75000, 65, 1, 'Pharmacist', 98765),
('Robert Wilson', '5432109876', '231 Maple St', 'M', 'bobwilson@example.com', '1998-07-07', 543210987, '2022-07-01', 80000, 70, 1, 'Pharmacist', 45678),
('Jessica Taylor', '4321098765', '563 Cherry St', 'F', 'jessica@example.com', '2000-08-08', 432109876, '2022-08-01', 85000, 75, 1, 'Pharmacist', 12345),
('Steven Thompson', '3210987654', '890 Walnut St', 'M', 'steven@example.com', '2005-09-09', 321098765, '2022-09-01', 90000, 80, 1, 'Pharmacist', 65432);

INSERT INTO Cairo.Medical_equipment (Device_Name, Device_version_number, Device_manufacture_company, Maintenance_Records, Usage_Logs, Available)
VALUES
('Ultrasound Machine', 1.5, 'GE Healthcare', '2022-05-09', '2022-05-10', 'Y'),
('X-Ray Machine', 2.3, 'Siemens Healthineers', '2022-05-08', '2022-05-09', 'Y'),
('MRI Machine', 3.1, 'Philips Healthcare', '2022-05-07', '2022-05-08', 'Y'),
('CT Scanner', 4.2, 'Canon Medical Systems', '2022-05-06', '2022-05-07', 'Y'),
('Endoscopy System', 5.0, 'Olympus Corporation', '2022-05-05', '2022-05-06', 'Y'),
('Anesthesia Machine', 2.0, 'Draeger Medical', '2022-04-25', '2022-04-26', 'Y'),
('Defibrillator', 1.2, 'Zoll Medical', '2022-04-24', '2022-04-25', 'Y'),
('Infusion Pump', 3.5, 'B. Braun Medical', '2022-04-23', '2022-04-24', 'Y'),
('Patient Monitor', 4.7, 'Philips Healthcare', '2022-04-22', '2022-04-23', 'Y'),
('Surgical Table', 5.2, 'Stryker Corporation', '2022-04-21', '2022-04-22', 'Y');

INSERT INTO Cairo.Use_Medical_Equipment (medical_id, pharmacist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 8),
(11, 4),
(12, 2),
(13, 1),
(14, 1),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 2);

INSERT INTO Cairo.Client (Name, Phone, Address, Birth_day, E_mail, Gender, SSN, Pharmacist_id)
VALUES
('John Doe', '1234567890', '123 Main St', '1980-01-01', 'johndoe@example.com', 'M', 123456789, 1),
('Jane Smith', '0987654321', '456 Elm St', '1990-02-02', 'janesmith@example.com', 'F', 987654321, 2),
('Mike Johnson', '1112223333', '789 Oak St', '1995-03-03', 'mikejohnson@example.com', 'M', 111222333, 3),
('Emma Stone', '2223334444', '321 Pine St', '2000-04-04', 'emmastone@example.com', 'F', 222333444, 4),
('Daniel Radcliffe', '3334445555', '654 Maple St', '2005-05-05', 'danielradcliffe@example.com', 'M', 333444555, 5),
('Grace Miller', '4445556666', '987 Birch St', '2010-06-06', 'gracemiller@example.com', 'F', 444555666, 6),
('Robert Wilson', '5556667777', '231 Cedar St', '2015-07-07', 'robertwilson@example.com', 'M', 555666777, 7),
('Jessica Taylor', '6667778888', '563 Cherry St', '2020-08-08', 'jessicataylor@example.com', 'F', 666777888, 8),
('Steven Thompson', '7778889999', '890 Walnut St', '2021-09-09', 'steventhompson@example.com', 'M', 777888999, 9),
('Ava Williams', '8889990000', '314 Hickory St', '2022-01-01', 'awilliams@example.com', 'F', 888999000, 8),
('Benjamin Davis', '1112223334', '789 Oak St', '1995-03-04', 'bendavis@example.com', 'M', 111222334, 3),
('Charlotte Brown', '2223334445', '321 Pine St', '2000-04-05', 'charlottebrown@example.com', 'F', 222333445, 4),
('Ethan Wilson', '3334445556', '654 Maple St', '2005-05-06', 'ethanwilson@example.com', 'M', 333444556, 5),
('Harper Miller', '4445556667', '987 Birch St', '2010-06-07', 'harpermiller@example.com', 'F', 444555667, 6),
('Jacob Thompson', '5556667778', '231 Cedar St', '2015-07-08', 'jacobthompson@example.com', 'M', 555666778, 7);

INSERT INTO Cairo.Company (Comp_Name, Comp_Email, Comp_Location)
VALUES
('ABC Pharmacy', 'abcpharmacy@example.com', '123 Main St, Cairo, IL 62914'),
('DEF Medical', 'defmedical@example.com', '456 Elm St, Cairo, IL 62914'),
('GHI Healthcare', 'ghihealthcare@example.com', '789 Oak St, Cairo, IL 62914'),
('JKL Pharmacy', 'jklpharmacy@example.com', '321 Pine St, Cairo, IL 62914'),
('MNO Health', 'mnochealth@example.com', '654 Maple St, Cairo, IL 62914'),
('PQR Medical', 'pqrmedical@example.com', '987 Birch St, Cairo, IL 62914'),
('STU Pharmacy', 'stupharmacy@example.com', '231 Cedar St, Cairo, IL 62914'),
('VWX Medical', 'vwxmedical@example.com', '563 Cherry St, Cairo, IL 62914'),
('YZA Healthcare', 'yzahealthcare@example.com', '890 Walnut St, Cairo, IL 62914'),
('BCD Medical', 'bcdmedical@example.com', '314 Hickory St, Cairo, IL 62914');

INSERT INTO Cairo.Drug (Drug_Name, Company_ID, Mfg_Date, Exp_Date, Quantity, Price, Side_effect, Druginformation, client_id, pharmacist_id)
VALUES
('Ibuprofen', 1, '2022-01-01', '2024-01-01', 1000, 10.99, 'Stomach upset, headache', 'Pain reliever, reduces inflammation', 11, 1),
('Acetaminophen', 2, '2022-02-01', '2024-02-01', 1500, 8.99, 'Nausea, rash', 'Pain reliever, reduces fever', 21, 2),
('Amoxicillin', 3, '2022-03-01', '2024-03-01', 500, 20.99, 'Diarrhea, allergic reaction', 'Antibiotic', 13, 3),
('Lisinopril', 4, '2022-04-01', '2024-04-01', 800, 15.99, 'Dizziness, cough', 'Blood pressure medication', 14, 4),
('Atorvastatin', 5, '2022-05-01', '2024-05-01', 1200, 18.99, 'Muscle pain, constipation', 'Cholesterol medication', 15, 5),
('Metformin', 6, '2022-06-01', '2024-06-01', 1500, 9.99, 'Nausea, diarrhea', 'Diabetes medication', 16, 6),
('Levothyroxine', 7, '2022-07-01', '2024-07-01', 2000, 12.99, 'Fatigue, weight loss', 'Thyroid medication', 17, 7),
('Montelukast', 8, '2022-08-01', '2024-08-01', 1200, 14.99, 'Headache, dizziness', 'Asthma medication', 18, 8),
('Sertraline', 9, '2022-09-01', '2024-09-01', 1000, 16.99, 'Nausea, insomnia', 'Antidepressant', 19, 9),
('Gabapentin', 10, '2022-10-01', '2024-10-01', 1200, 13.99, 'Dizziness, sleepiness', 'Pain medication', 25, 9),
('Sumatriptan', 1, '2022-11-01', '2024-11-01', 800, 25.99, 'Chest pain, tingling', 'Migraine medication', 11, 1),
('Losartan', 4, '2022-12-01', '2024-12-01', 1000, 17.99, 'Dizziness, headache', 'Blood pressure medication', 12, 4),
('Simvastatin', 5, '2023-01-01', '2025-01-01', 1200, 19.99, 'Muscle pain, constipation', 'Cholesterol medication', 13, 5);


INSERT INTO Cairo.Bill (Patient_Information, Prescription_Details, Medication_Details, Date_Time, Price, PharmacyDetails, Notes_Comments, client_id)
VALUES
('John Doe', 'Prescription 11', 'Medication 11', '2024-05-11 10:00:00', 110, 'Pharmacy 11', 'Notes 11', 11),
('Jane Smith', 'Prescription 12', 'Medication 12', '2024-05-11 11:00:00', 120, 'Pharmacy 12', 'Notes 12', 12),
('Mike Johnson', 'Prescription 13', 'Medication 13', '2024-05-11 12:00:00', 130, 'Pharmacy 13', 'Notes 13', 13),
('Sara Williams', 'Prescription 14', 'Medication 14', '2024-05-11 13:00:00', 140, 'Pharmacy 14', 'Notes 14', 14),
('David Brown', 'Prescription 15', 'Medication 15', '2024-05-11 14:00:00', 150, 'Pharmacy 15', 'Notes 15', 15),
('Emma Davis', 'Prescription 16', 'Medication 16', '2024-05-11 15:00:00', 160, 'Pharmacy 16', 'Notes 16', 16),
('James Wilson', 'Prescription 17', 'Medication 17', '2024-05-11 16:00:00', 170, 'Pharmacy 17', 'Notes 17', 17),
('Grace Taylor', 'Prescription 18', 'Medication 18', '2024-05-11 17:00:00', 180, 'Pharmacy 18', 'Notes 18', 18),
('Robert Anderson', 'Prescription 19', 'Medication 19', '2024-05-11 18:00:00', 190, 'Pharmacy 19', 'Notes 19', 19),
('Olivia Thompson', 'Prescription 20', 'Medication 20', '2024-05-11 19:00:00', 200, 'Pharmacy 20', 'Notes 20', 20),
('Amir', 'Prescription 1', 'Medication 1', '2024-05-10 10:00:00', 100, 'Pharmacy 1', 'Notes 1', 23),
('Sofia', 'Prescription 2', 'Medication 2', '2024-05-10 11:00:00', 120, 'Pharmacy 2', 'Notes 2', 24),
('Aya', 'Prescription 3', 'Medication 3', '2024-05-10 12:00:00', 110, 'Pharmacy 3', 'Notes 3', 25);
INSERT INTO Cairo.Bill (Patient_Information, Prescription_Details, Medication_Details, Date_Time, Price, PharmacyDetails, Notes_Comments, client_id)
VALUES
('James Smith, 123 Main St, Anytown USA', '50mg Amoxicillin, 3 times a day for 7 days', 'Amoxicillin 50mg capsule, 28 capsules', '2024-05-11 10:00:00', 25.00, 'CVS Pharmacy, 456 Elm St, Anytown USA', 'Patient reports history of allergies', 11),
('Emily Johnson, 789 Oak St, Anytown USA', '1000mg Metformin, 2 times a day for 30 days', 'Metformin 1000mg tablet, 180 tablets', '2024-05-12 11:00:00', 30.00, 'Walgreens, 1234 Maple St, Anytown USA', 'Patient reports history of kidney disease', 12),
('Michael Davis, 654 Birch St, Anytown USA', '20mg Simvastatin, 1 time a day for 30 days', 'Simvastatin 20mg tablet, 90 tablets', '2024-05-13 12:00:00', 40.00, 'CVS Pharmacy, 456 Elm St, Anytown USA', 'Patient reports history of liver disease', 23),
('Ava Thompson, 345 Willow St, Anytown USA', '500mg Azithromycin, 1 time a day for 3 days', 'Azithromycin 500mg tablet, 6 tablets', '2024-05-14 13:00:00', 20.00, 'Walgreens, 1234 Maple St, Anytown USA', 'Patient reports allergy to sulfa drugs', 24),
('Benjamin Brown, 987 Cedar St, Anytown USA', '10mg Lisinopril, 1 time a day for 30 days', 'Lisinopril 10mg tablet, 90 tablets', '2024-05-15 14:00:00', 50.00, 'CVS Pharmacy, 456 Elm St, Anytown USA', 'Patient reports history of low blood pressure', 25),
('Olivia Wilson, 864 Cherry St, Anytown USA', '1000mg Metformin, 2 times a day for 30 days', 'Metformin 1000mg tablet, 180 tablets', '2024-05-16 15:00:00', 30.00, 'Walgreens, 1234 Maple St, Anytown USA', 'Patient reports history of kidney disease', 16),
('Williams Johnson, 777 Hickory St, Anytown USA', '20mg Simvastatin, 1 time a day for 30 days', 'Simvastatin 20mg tablet, 90 tablets', '2024-05-17 16:00:00', 40.00, 'CVS Pharmacy, 456 Elm St, Anytown USA', 'Patient reports history of liver disease', 17),
('James Davis, 321 Pine St, Anytown USA', '50mg Amoxicillin, 3 times a day for 7 days', 'Amoxicillin 50mg capsule, 28 capsules', '2024-05-18 17:00:00', 25.00, 'Walgreens, 1234 Maple St, Anytown USA', 'Patient reports history of allergies', 18);

INSERT INTO Cairo.Orders (TotalPrice, Quantity, bill_id, client_id)
VALUES
(100, 1, 1, 11),
(120, 2, 2, 12),
(110, 3, 3, 13),
(130, 4, 4, 14),
(140, 5, 5, 15),
(150, 6, 6,16),
(160, 7, 7, 17),
(170, 8, 8, 18),
(180, 9, 9, 19),
(190, 10, 10, 11),
(200, 11, 11, 11),
(210, 12, 12, 12),
(220, 13, 13, 13),
(230, 14, 4, 14),
(240, 15, 5, 15),
(250, 16, 6, 16),
(260, 17, 7, 17),
(270, 18, 8, 18),
(280, 19, 9, 19),
(290, 20, 5, 20),
(300, 21, 11, 21),
(310, 22, 12, 22),
(320, 23, 13, 23),
(330, 24, 4, 24),
(340, 25, 5, 25),
(350, 26, 6, 16),
(360, 27, 7, 17),
(370, 28, 8, 18),
(380, 29, 9, 19),
(390, 30, 10, 20),
(400, 31, 1, 21),
(410, 32, 2, 22),
(420, 33, 3, 23),
(430, 34, 4, 24),
(440, 35, 5, 25),
(450, 36, 6, 16),
(460, 37, 7, 17),
(470, 38, 1, 18),
(480, 39, 1, 19),
(490, 40, 10, 11),
(500, 41, 1, 11),
(510, 42, 2, 12),
(520, 43, 3, 13),
(530, 44, 12, 14),
(540, 45, 13, 15),
(550, 46, 11, 16),
(560, 47, 13, 17),
(570, 48, 12, 18),
(580, 49, 13, 19),
(590, 50, 10, 11);

INSERT INTO Cairo.Item (Name, Quantity, order_id)
VALUES
('Item 1', 10, 1),
('Item 2', 20, 2),
('Item 3', 30, 3),
('Item 4', 40, 4),
('Item 5', 50, 5),
('Item 6', 60, 6),
('Item 7', 70, 7),
('Item 8', 80, 8),
('Item 9', 90, 9),
('Item 10', 100, 10),
('Item 11', 110, 11),
('Item 12', 120, 12),
('Item 13', 130, 13),
('Item 14', 140, 14),
('Item 15', 150, 15),
('Item 16', 160, 16),
('Item 17', 170, 17),
('Item 18', 180, 18),
('Item 19', 190, 19),
('Item 20', 200, 20),
('Item 21', 210, 21),
('Item 22', 220, 22),
('Item 23', 230, 23),
('Item 24', 240, 24),
('Item 25', 250, 25),
('Item 26', 260, 26),
('Item 27', 270, 27),
('Item 28', 280, 28),
('Item 29', 290, 29),
('Item 30', 300, 30),
('Item 31', 310, 31),
('Item 32', 320, 32),
('Item 33', 330, 33),
('Item 34', 340, 34),
('Item 35', 350, 35),
('Item 36', 360, 36),
('Item 37', 370, 37),
('Item 38', 380, 38),
('Item 39', 390, 39),
('Item 40', 400, 40),
('Item 41', 410, 41),
('Item 42', 420, 42),
('Item 43', 430, 43),
('Item 44', 440, 44),
('Item 45', 450, 45),
('Item 46', 460, 46),
('Item 47', 470, 47),
('Item 48', 480, 48),
('Item 49', 490, 49),
('Item 50', 500, 50);

INSERT INTO Cairo.Payment (Amount, bill_id)
VALUES
(100.00, 1),
(120.00, 2),
(150.00, 3),
(80.00, 4),
(75.00, 5),
(200.00, 6),
(180.00, 7),
(110.00, 8),
(130.00, 9),
(160.00, 10),
(90.00, 11),
(140.00, 12),
(125.00, 13),
(175.00, 14),
(200.00, 15),
(150.00, 16),
(100.00, 17),
(120.00, 18),
(150.00, 19),
(80.00, 20),
(75.00, 21),
(200.00, 12),
(180.00, 13),
(110.00, 14),
(130.00, 15),
(160.00, 16),
(90.00, 17),
(140.00, 18),
(125.00, 19),
(175.00, 20);

INSERT INTO Cairo.Cash (payment_id)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO Cairo.Credit (payment_id, number, type, expireDate)
VALUES
(21, '1234567890123456', 'VISA', '2025-05-10'),
(22, '1234567890123457', 'MASTERCARD', '2026-05-10'),
(23, '1234567890123458', 'AMEX', '2024-05-10'),
(24, '1234567890123459', 'DISCOVER', '2025-05-10'),
(25, '1234567890123460', 'VISA', '2026-05-10'),
(26, '1234567890123461', 'MASTERCARD', '2027-05-10'),
(27, '1234567890123462', 'AMEX', '2025-05-10'),
(28, '1234567890123463', 'DISCOVER', '2026-05-10'),
(29, '1234567890123464', 'VISA', '2027-05-10'),
(30, '1234567890123465', 'MASTERCARD', '2028-05-10');

INSERT INTO Cairo.Digital_Markter (Name, Phone, Address, Gender, E_mail, Birth_day, SSN, Hire_date, Salary, TimeWork, Company_id)
VALUES
('John Doe', '5551234567', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '123456789', '2022-01-01', 50000, 'Full-time', 1),
('Jane Smith', '5559876543', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '987654321', '2022-02-01', 55000, 'Full-time', 1),
('Bob Johnson', '5552345678', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '555123456', '2022-03-01', 60000, 'Full-time', 2),
('Alice Williams', '5556789012', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '888221111', '2022-04-01', 65000, 'Full-time', 2),
('Charlie Brown', '5553456789', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '777332222', '2022-05-01', 70000, 'Full-time', 6),
('Lucy Van Pelt', '5557890123', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '666443333', '2022-06-01', 75000, 'Full-time', 5),
('Linus Van Pelt', '5554567890', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '555555555', '2022-07-01', 80000, 'Full-time', 4),
('Sally Brown', '5556780123', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '999666666', '2022-08-01', 85000, 'Full-time', 9),
('Schroeder', '5558901234', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '444777777', '2022-09-01', 90000, 'Full-time', 10);

INSERT INTO Cairo.Manger (Name, Phone, Address, Gender, E_mail, Birth_day, SSN, Hire_date, Salary, TimeWork, Department)
VALUES
('John Doe', '5551234567', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '123456789', '2022-01-01', 80000, 8, 'HR'),
('Jane Smith', '5559876543', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '987654321', '2022-02-01', 85000, 8, 'IT'),
('Bob Johnson', '5552345678', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '555123456', '2022-03-01', 90000, 12, 'Finance'),
('Alice Williams', '5556789012', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '888221111', '2022-04-01', 95000, 8, 'Marketing'),
('Charlie Brown', '5553456789', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '77332222', '2022-05-01', 100000, 5, 'Sales'),
('Lucy Van Pelt', '5557890123', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '666443333', '2022-06-01', 105000, 12, 'Operations'),
('Linus Van Pelt', '5558901234', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '555555555', '2022-07-01', 110000, 12, 'Research'),
('Sally Brown', '5556780123', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '999666666', '2022-08-01', 115000, 12, 'Legal'),
('Schroeder', '5558901234', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '444777777', '2022-09-01', 120000, 5, 'Admin');

INSERT INTO Cairo.Company_Owner (Name, Phone, Address, Gender, E_mail, Birth_day, SSN, Hire_date, Salary, TimeWork, Company_id, manager_id)
VALUES
('John Doe', '555-123-4567', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '123-45-6789', '2022-01-01', 80000, 'Full-time', 1, 1),
('Jane Smith', '555-987-6543', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '987-65-4321', '2022-02-01', 85000, 'Full-time', 2, 2),
('Bob Johnson', '555-234-5678', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '555-12-3456', '2022-03-01', 90000, 'Full-time', 3, 3),
('Alice Williams', '555-678-9012', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '888-22-1111', '2022-04-01', 95000, 'Full-time', 4, 4),
('Charlie Brown', '555-345-6789', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '777-33-2222', '2022-05-01', 100000, 'Full-time', 5, 5),
('Lucy Van Pelt', '555-789-0123', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '666-44-3333', '2022-06-01', 105000, 'Full-time', 6, 6),
('Linus Van Pelt', '555-890-1234', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '555-55-5555', '2022-07-01', 110000, 'Full-time', 7, 7),
('Sally Brown', '555-678-0123', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '999-66-6666', '2022-08-01', 115000, 'Full-time', 8, 8),
('Schroeder', '555-890-1234', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '444-77-7777', '2022-09-01', 120000, 'Full-time', 9, 9);

insert into Cairo.Accountant(Name, Address, Gender, E_mail, Birth_day, Hire_date, Salary, SSN, TimeWork, Phone, manager_id)
values
('John Doe', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '2022-01-01', 80000, '123-45-6789', 'Full-time', '555-123-4567', 1),
('Jane Smith', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '2022-02-01', 85000, '987-65-4321', 'Full-time', '555-987-6543', 2),
('Bob Johnson', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '2022-03-01', 90000, '555-12-3456', 'Full-time', '555-234-5678', 3),
('Alice Williams', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '2022-04-01', 95000, '888-22-1111', 'Full-time', '555-678-9012', 4),
('Charlie Brown', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '2022-05-01', 100000, '777-33-2222', 'Full-time', '555-345-6789', 5),
('Lucy Van Pelt', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '2022-06-01', 105000, '666-44-3333', 'Full-time', '555-789-0123', 6),
('Linus Van Pelt', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '2022-07-01', 110000, '444-77-7777', 'Full-time', '555-890-1234', 7),
('Sally Brown', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '2022-08-01', 115000, '999-66-6666', 'Full-time', '555-678-0123', 8),
('Schroeder', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '2022-09-01', 120000, '555-890-1234', 'Full-time', '555-123-4567', 9);

INSERT INTO Cairo.HR (Name, Address, Gender, E_mail, Birth_day, Hire_date, Salary, SSN, Phone, Time_Work, manager_id)
VALUES
('John Doe', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '2022-01-01', 80000, '123-45-6789', '555-123-4567', 'Full-time', 1),
('Jane Smith', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '2022-02-01', 85000, '987-65-4321', '555-987-6543', 'Full-time', 2),
('Bob Johnson', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '2022-03-01', 90000, '555-12-3456', '555-234-5678', 'Full-time', 3),
('Alice Williams', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '2022-04-01', 95000, '888-22-1111', '555-678-9012', 'Full-time', 4),
('Charlie Brown', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '2022-05-01', 100000, '777-33-2222', '555-345-6789', 'Full-time', 5),
('Lucy Van Pelt', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '2022-06-01', 105000, '666-44-3333', '555-789-0123', 'Full-time', 6),
('Linus Van Pelt', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '2022-07-01', 110000, '444-77-7777', '555-890-1234', 'Full-time', 7),
('Sally Brown', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '2022-08-01', 115000, '999-66-6666', '555-678-0123', 'Full-time', 8),
('Schroeder', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '2022-09-01', 120000, '555-890-1234', '555-123-4567', 'Full-time', 9);

INSERT INTO Cairo.TAX (Revenues, Expenses, Accountant_id)
VALUES
(10000.00, 5000.00, 1),
(15000.00, 7000.00, 2),
(20000.00, 10000.00, 3),
(25000.00, 12000.00, 4),
(30000.00, 15000.00, 5),
(35000.00, 18000.00, 6),
(40000.00, 20000.00, 7),
(45000.00, 23000.00, 8),
(50000.00, 25000.00, 9),
(55000.00, 28000.00, 1),
(60000.00, 30000.00, 1),
(65000.00, 33000.00, 2),
(70000.00, 35000.00, 3),
(75000.00, 38000.00, 4),
(80000.00, 40000.00, 5),
(85000.00, 43000.00, 6),
(90000.00, 45000.00, 7),
(95000.00, 48000.00, 8),
(100000.00, 50000.00, 9),
(105000.00, 53000.00, 2),
(110000.00, 55000.00, 1);

INSERT INTO Cairo.Employee (Name, Phone, SSN, Time_Work, Address, Gender, E_mail, Birth_day, Hire_date, Salary, DepartId, Jop_Title, Hr)
VALUES
('John Doe', '555-123-4567', '123456789', 'Full-time', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '2022-01-01', 80000, 1, 'Software Engineer', 1),
('Jane Smith', '555-987-6543', '987654321', 'Full-time', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '2022-02-01', 85000, 2, 'Project Manager', 2),
('Bob Johnson', '555-456-7890', '555123456', 'Full-time', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '2022-03-01', 90000, 3, 'Data Analyst', 3),
('Alice Williams', '555-789-0123', '777222333', 'Full-time', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '2022-04-01', 95000, 4, 'UX Designer', 4),
('Charlie Brown', '555-234-5678', '666333222', 'Full-time', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '2022-05-01', 100000, 5, 'QA Engineer', 5),
('Lucy Van Pelt', '555-345-6789', '888444333', 'Full-time', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '2022-06-01', 105000, 6, 'DevOps Engineer', 6),
('Linus Van Pelt', '555-456-7890', '555666444', 'Full-time', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '2022-07-01', 110000, 7, 'System Administrator', 7),
('Sally Brown', '555-567-8901', '999555666', 'Full-time', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '2022-08-01', 115000, 8, 'Network Engineer', 8),
('Schroeder', '555-678-9012', '555777888', 'Full-time', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '2022-09-01', 120000, 9, 'Database Administrator' , 9);

INSERT INTO Cairo.System_Admin (Name, Phone, SSN, Time_Work, Address, Gender, E_mail, Birth_day, Hire_date, Salary, manager_id)
VALUES
('John Doe', '555-123-4567', '123456789', 'Full-time', '123 Main St, Anytown USA', 'M', 'johndoe@example.com', '1980-01-01', '2022-01-01', 80000, 1),
('Jane Smith', '555-987-6543', '987654321', 'Full-time', '456 Elm St, Anytown USA', 'F', 'janesmith@example.com', '1990-02-02', '2022-02-01', 85000, 2),
('Bob Johnson', '555-456-7890', '555123456', 'Full-time', '789 Oak St, Anytown USA', 'M', 'bjohnson@example.com', '1985-03-03', '2022-03-01', 90000, 3),
('Alice Williams', '555-789-0123', '777222333', 'Full-time', '321 Maple St, Anytown USA', 'F', 'awilliams@example.com', '1995-04-04', '2022-04-01', 95000, 4),
('Charlie Brown', '555-234-5678', '666333222', 'Full-time', '654 Pine St, Anytown USA', 'M', 'cbrown@example.com', '2000-05-05', '2022-05-01', 100000, 5),
('Lucy Van Pelt', '555-345-6789', '888444333', 'Full-time', '987 Cedar St, Anytown USA', 'F', 'lucy@example.com', '2001-06-06', '2022-06-01', 105000, 6),
('Linus Van Pelt', '555-456-7890', '555666444', 'Full-time', '888 Birch St, Anytown USA', 'M', 'linus@example.com', '2002-07-07', '2022-07-01', 110000, 7),
('Sally Brown', '555-567-8901', '999555666', 'Full-time', '777 Hickory St, Anytown USA', 'F', 'sally@example.com', '2003-08-08', '2022-08-01', 115000, 8),
('Schroeder', '555-678-9012', '555777888', 'Full-time', '666 Cherry St, Anytown USA', 'M', 'schroeder@example.com', '2004-09-09', '2022-09-01', 120000, 9);
 
select * from cairo.Drug;