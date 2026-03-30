USE riversideclinicdb;

-- =========================
-- NOTE:
-- Changed to INSERT IGNORE so seed.sql can be run multiple times
-- without duplicate key errors
-- =========================
INSERT IGNORE INTO Roles (Role_ID, Role_Name) VALUES
  (1, 'Administrator'),
  (2, 'Doctor'),
  (3, 'Receptionist'),
  (4, 'Nurse');

-- =========================
-- USERS
-- Existing users + 5 more doctors + 5 more nurses
-- =========================
INSERT IGNORE INTO Users (User_ID, First_Name, Last_Name, Role_ID, Phone_Number, Email, Is_Disabled) VALUES
  (1001, 'Fernando', 'Doctor', 2, '555-0001', 'fernando@clinic.com', 0),
  (1002, 'Andrea', 'Receptionist', 3, '555-0002', 'andrea@clinic.com', 0),
  (1003, 'Logan', 'Nurse', 4, '555-0003', 'logan@clinic.com', 0),
  (1004, 'Reyna', 'Administrator', 1, '555-0004', 'reyna@clinic.com', 0),
  (1005, 'Michael', 'Phillips', 1, '555-0005', 'michael@clinic.com', 0),

  (1006, 'Emily', 'Carter', 2, '555-0106', 'emily.carter@clinic.com', 0),
  (1007, 'James', 'Walker', 2, '555-0107', 'james.walker@clinic.com', 0),
  (1008, 'Olivia', 'Hughes', 2, '555-0108', 'olivia.hughes@clinic.com', 0),
  (1009, 'Noah', 'Bennett', 2, '555-0109', 'noah.bennett@clinic.com', 0),
  (1010, 'Sophia', 'Reed', 2, '555-0110', 'sophia.reed@clinic.com', 0),

  (1011, 'Ava', 'Brooks', 4, '555-0111', 'ava.brooks@clinic.com', 0),
  (1012, 'Liam', 'Cooper', 4, '555-0112', 'liam.cooper@clinic.com', 0),
  (1013, 'Mia', 'Foster', 4, '555-0113', 'mia.foster@clinic.com', 0),
  (1014, 'Ethan', 'Price', 4, '555-0114', 'ethan.price@clinic.com', 0),
  (1015, 'Grace', 'Kelly', 4, '555-0115', 'grace.kelly@clinic.com', 0);

-- =========================
-- USER LOGIN INFO
-- Reused valid bcrypt hashes so seeded users can authenticate
-- using the app's existing login structure
-- =========================

INSERT IGNORE INTO User_Login_Info
(User_ID, Username, Password_Hash, Must_Change_Password, Password_Changed_At, Created_At) VALUES
(1001, 'fernando', '$2y$10$AhB5JENZpGrJ6CY/QcRG2O5ehqWfkzwwle05LwHc2QZawZ5oA6cWG', 0, NOW(), NOW()),
(1002, 'andrea',   '$2y$10$.jyGfjaLWJAnGtWOU7uqjenWO3ly/535/2aGrymDlBgJoSDJEgxSW', 0, NOW(), NOW()),
(1003, 'logan',    '$2y$10$KDAfkIhvURQAZN6NgIkzoOJVwKKYWilTiZ5wHzyx9klk2kDLe2VoS', 0, NOW(), NOW()),
(1004, 'reyna',    '$2y$10$ZkxkygA2Vu5ZLAYpltSgFu0pWImICpoRBl0ml/LYPC59pwQAZ1t9W', 0, NOW(), NOW()),
(1005, 'michael',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),

(1006, 'ecarter',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1007, 'jwalker',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1008, 'ohughes',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1009, 'nbennett', '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1010, 'sreed',    '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),

(1011, 'abrooks',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1012, 'lcooper',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1013, 'mfoster',  '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1014, 'eprice',   '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW()),
(1015, 'gkelly',   '$2y$10$6NdPKJvbtPHQphd28GYGzu85wmilKB1mQIcFYd0Qz64zJvp2/5Pua', 0, NOW(), NOW());

-- =========================
-- PATIENTS
-- Existing test patient + 29 more = 30 total patients
-- =========================
INSERT INTO Patient (Patient_ID, First_Name, Last_Name, Phone_Number, Email, Date_Of_Birth) VALUES
  (2001, 'Test', 'Patient', '555-1010', 'test.patient@clinic.com', '1995-06-15'),
  (2002, 'John', 'Smith', '555-2002', 'john.smith@email.com', '1987-02-14'),
  (2003, 'Mary', 'Johnson', '555-2003', 'mary.johnson@email.com', '1990-07-21'),
  (2004, 'David', 'Brown', '555-2004', 'david.brown@email.com', '1978-11-09'),
  (2005, 'Sarah', 'Davis', '555-2005', 'sarah.davis@email.com', '1993-05-30'),
  (2006, 'Chris', 'Miller', '555-2006', 'chris.miller@email.com', '1985-08-12'),
  (2007, 'Ashley', 'Wilson', '555-2007', 'ashley.wilson@email.com', '1996-03-17'),
  (2008, 'Daniel', 'Moore', '555-2008', 'daniel.moore@email.com', '1982-10-04'),
  (2009, 'Jessica', 'Taylor', '555-2009', 'jessica.taylor@email.com', '1991-12-28'),
  (2010, 'Matthew', 'Anderson', '555-2010', 'matthew.anderson@email.com', '1989-06-08'),
  (2011, 'Amanda', 'Thomas', '555-2011', 'amanda.thomas@email.com', '1994-01-19'),
  (2012, 'Joshua', 'Jackson', '555-2012', 'joshua.jackson@email.com', '1980-04-25'),
  (2013, 'Brittany', 'White', '555-2013', 'brittany.white@email.com', '1998-09-13'),
  (2014, 'Andrew', 'Harris', '555-2014', 'andrew.harris@email.com', '1975-07-07'),
  (2015, 'Lauren', 'Martin', '555-2015', 'lauren.martin@email.com', '1992-02-02'),
  (2016, 'Kevin', 'Thompson', '555-2016', 'kevin.thompson@email.com', '1988-05-11'),
  (2017, 'Megan', 'Garcia', '555-2017', 'megan.garcia@email.com', '1997-08-29'),
  (2018, 'Ryan', 'Martinez', '555-2018', 'ryan.martinez@email.com', '1984-03-03'),
  (2019, 'Nicole', 'Robinson', '555-2019', 'nicole.robinson@email.com', '1995-11-16'),
  (2020, 'Tyler', 'Clark', '555-2020', 'tyler.clark@email.com', '1986-01-27'),
  (2021, 'Hannah', 'Rodriguez', '555-2021', 'hannah.rodriguez@email.com', '1999-06-06'),
  (2022, 'Brandon', 'Lewis', '555-2022', 'brandon.lewis@email.com', '1983-09-22'),
  (2023, 'Kayla', 'Lee', '555-2023', 'kayla.lee@email.com', '1991-10-15'),
  (2024, 'Justin', 'Walker', '555-2024', 'justin.walker@email.com', '1979-12-01'),
  (2025, 'Rachel', 'Hall', '555-2025', 'rachel.hall@email.com', '1996-04-18'),
  (2026, 'Zachary', 'Allen', '555-2026', 'zachary.allen@email.com', '1981-07-26'),
  (2027, 'Courtney', 'Young', '555-2027', 'courtney.young@email.com', '1993-03-10'),
  (2028, 'Nathan', 'Hernandez', '555-2028', 'nathan.hernandez@email.com', '1987-11-23'),
  (2029, 'Emily', 'King', '555-2029', 'emily.king@email.com', '1990-08-05'),
  (2030, 'Jordan', 'Wright', '555-2030', 'jordan.wright@email.com', '1985-02-20')
ON DUPLICATE KEY UPDATE
  First_Name = VALUES(First_Name),
  Last_Name = VALUES(Last_Name),
  Phone_Number = VALUES(Phone_Number),
  Email = VALUES(Email),
  Date_Of_Birth = VALUES(Date_Of_Birth);

-- =========================
-- APPOINTMENTS
-- Existing test appointment + 14 more = 15 total appointments
-- =========================
INSERT INTO Appointment (Appointment_ID, Patient_ID, Provider_User_ID, Scheduled_Start, Scheduled_End, Status) VALUES
  (3001, 2001, 1001, '2026-03-24 09:00:00', '2026-03-24 09:30:00', 'CHECKED_IN'),
  (3002, 2002, 1006, '2026-03-24 09:30:00', '2026-03-24 10:00:00', 'SCHEDULED'),
  (3003, 2003, 1007, '2026-03-24 10:00:00', '2026-03-24 10:30:00', 'SCHEDULED'),
  (3004, 2004, 1008, '2026-03-24 10:30:00', '2026-03-24 11:00:00', 'COMPLETED'),
  (3005, 2005, 1009, '2026-03-24 11:00:00', '2026-03-24 11:30:00', 'SCHEDULED'),
  (3006, 2006, 1010, '2026-03-24 01:00:00', '2026-03-24 01:30:00', 'CHECKED_IN'),
  (3007, 2007, 1001, '2026-03-25 09:00:00', '2026-03-25 09:30:00', 'SCHEDULED'),
  (3008, 2008, 1006, '2026-03-25 09:30:00', '2026-03-25 10:00:00', 'CANCELLED'),
  (3009, 2009, 1007, '2026-03-25 10:00:00', '2026-03-25 10:30:00', 'SCHEDULED'),
  (3010, 2010, 1008, '2026-03-25 11:00:00', '2026-03-25 11:30:00', 'COMPLETED'),
  (3011, 2011, 1009, '2026-03-25 02:00:00', '2026-03-25 02:30:00', 'SCHEDULED'),
  (3012, 2012, 1010, '2026-03-26 08:30:00', '2026-03-26 09:00:00', 'SCHEDULED'),
  (3013, 2013, 1001, '2026-03-26 10:30:00', '2026-03-26 11:00:00', 'NO_SHOW'),
  (3014, 2014, 1006, '2026-03-26 01:30:00', '2026-03-26 02:00:00', 'CHECKED_IN'),
  (3015, 2015, 1007, '2026-03-26 03:00:00', '2026-03-26 03:30:00', 'SCHEDULED')
ON DUPLICATE KEY UPDATE
  Patient_ID = VALUES(Patient_ID),
  Provider_User_ID = VALUES(Provider_User_ID),
  Scheduled_Start = VALUES(Scheduled_Start),
  Scheduled_End = VALUES(Scheduled_End),
  Status = VALUES(Status);

  -- =========================
-- EXTRA APPOINTMENTS
-- Added for calendar/testing
-- =========================
INSERT INTO Appointment (Appointment_ID, Patient_ID, Provider_User_ID, Scheduled_Start, Scheduled_End, Status) VALUES
  (3016, 2016, 1008, '2026-03-27 09:00:00', '2026-03-27 09:30:00', 'SCHEDULED'),
  (3017, 2017, 1009, '2026-03-27 10:00:00', '2026-03-27 10:30:00', 'CHECKED_IN'),
  (3018, 2018, 1010, '2026-03-27 11:30:00', '2026-03-27 12:00:00', 'COMPLETED'),
  (3019, 2019, 1001, '2026-03-28 09:30:00', '2026-03-28 10:00:00', 'SCHEDULED'),
  (3020, 2020, 1006, '2026-03-28 01:30:00', '2026-03-28 02:00:00', 'CANCELLED'),
  (3021, 2021, 1007, '2026-03-29 10:30:00', '2026-03-29 11:00:00', 'CHECKED_IN')
ON DUPLICATE KEY UPDATE
  Patient_ID = VALUES(Patient_ID),
  Provider_User_ID = VALUES(Provider_User_ID),
  Scheduled_Start = VALUES(Scheduled_Start),
  Scheduled_End = VALUES(Scheduled_End),
  Status = VALUES(Status);

-- =========================
-- CLINIC HOURS
-- 1=Sunday, 2=Monday, ..., 7=Saturday
-- =========================
INSERT INTO Clinic_Hours (Day_Of_Week, Is_Open, Open_Time, Close_Time) VALUES
  (1, 0, NULL, NULL),
  (2, 1, '08:00:00', '17:00:00'),
  (3, 1, '08:00:00', '17:00:00'),
  (4, 1, '08:00:00', '17:00:00'),
  (5, 1, '08:00:00', '17:00:00'),
  (6, 1, '08:00:00', '17:00:00'),
  (7, 1, '08:00:00', '13:00:00')
ON DUPLICATE KEY UPDATE
  Is_Open = VALUES(Is_Open),
  Open_Time = VALUES(Open_Time),
  Close_Time = VALUES(Close_Time);

-- =========================
-- PROVIDER SCHEDULES
-- 1=Sunday, 2=Monday, ..., 7=Saturday
-- =========================
INSERT INTO Provider_Schedule
  (Schedule_ID, Provider_User_ID, Day_Of_The_Week, Start_Time, End_Time)
VALUES
  -- Dr. Fernando Doctor (1001)
  (4001, 1001, 2, '08:00:00', '12:00:00'),
  (4002, 1001, 2, '13:00:00', '17:00:00'),
  (4003, 1001, 3, '08:00:00', '12:00:00'),
  (4004, 1001, 4, '08:00:00', '12:00:00'),
  (4005, 1001, 5, '13:00:00', '17:00:00'),
  (4006, 1001, 6, '08:00:00', '13:00:00'),

  -- Dr. Emily Carter (1006)
  (4007, 1006, 2, '08:00:00', '17:00:00'),
  (4008, 1006, 3, '08:00:00', '17:00:00'),
  (4009, 1006, 4, '08:00:00', '17:00:00'),
  (4010, 1006, 5, '08:00:00', '17:00:00'),
  (4011, 1006, 6, '08:00:00', '17:00:00'),

  -- Dr. James Walker (1007)
  (4012, 1007, 2, '09:00:00', '15:00:00'),
  (4013, 1007, 3, '09:00:00', '15:00:00'),
  (4014, 1007, 4, '09:00:00', '15:00:00'),
  (4015, 1007, 5, '09:00:00', '15:00:00'),
  (4016, 1007, 6, '09:00:00', '13:00:00'),

  -- Dr. Olivia Hughes (1008)
  (4017, 1008, 2, '10:00:00', '16:00:00'),
  (4018, 1008, 3, '10:00:00', '16:00:00'),
  (4019, 1008, 5, '10:00:00', '16:00:00'),
  (4020, 1008, 7, '08:00:00', '12:00:00'),

  -- Dr. Noah Bennett (1009)
  (4021, 1009, 3, '08:00:00', '12:00:00'),
  (4022, 1009, 3, '13:00:00', '17:00:00'),
  (4023, 1009, 4, '08:00:00', '12:00:00'),
  (4024, 1009, 4, '13:00:00', '17:00:00'),
  (4025, 1009, 6, '08:00:00', '12:00:00'),
  (4026, 1009, 6, '13:00:00', '17:00:00'),

  -- Dr. Sophia Reed (1010)
  (4027, 1010, 2, '08:00:00', '12:00:00'),
  (4028, 1010, 4, '08:00:00', '12:00:00'),
  (4029, 1010, 6, '08:00:00', '12:00:00'),
  (4030, 1010, 7, '08:00:00', '13:00:00')
ON DUPLICATE KEY UPDATE
  Provider_User_ID = VALUES(Provider_User_ID),
  Day_Of_The_Week = VALUES(Day_Of_The_Week),
  Start_Time = VALUES(Start_Time),
  End_Time = VALUES(End_Time);