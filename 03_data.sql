USE healthcare_management;
INSERT INTO Departments
(department_id, department_name, location)
VALUES
(101, 'Cardiology', 'Block A'),
(102, 'Neurology', 'Block B'),
(103, 'Orthopedics', 'Block C'),
(104, 'Pediatrics', 'Block D'),
(105, 'Dermatology', 'Block E');

SELECT * FROM Departments;
-- Insert Doctors Data
INSERT INTO Doctors
(doctor_id, doctor_name, specialization, phone, department_id)
VALUES
(201, 'Dr. Sharma', 'Cardiologist', '9876543210', 101),
(202, 'Dr. Mehta', 'Neurologist', '9876543211', 102),
(203, 'Dr. Singh', 'Orthopedic Surgeon', '9876543212', 103),
(204, 'Dr. Gupta', 'Pediatrician', '9876543213', 104),
(205, 'Dr. Kapoor', 'Dermatologist', '9876543214', 105);

SELECT * FROM Doctors;
-- Insert Patients Data
INSERT INTO Patients
(patient_id, patient_name, age, gender, phone, address)
VALUES
(301, 'Aman Sharma', 35, 'Male', '9811100001', 'Chandigarh'),
(302, 'Simran Kaur', 28, 'Female', '9811100002', 'Mohali'),
(303, 'Rahul Verma', 42, 'Male', '9811100003', 'Ludhiana'),
(304, 'Priya Singh', 24, 'Female', '9811100004', 'Patiala'),
(305, 'Harpreet Kaur', 31, 'Female', '9811100005', 'Amritsar'),
(306, 'Rohit Kumar', 50, 'Male', '9811100006', 'Jalandhar'),
(307, 'Neha Gupta', 27, 'Female', '9811100007', 'Bathinda'),
(308, 'Karan Mehta', 39, 'Male', '9811100008', 'Ferozepur'),
(309, 'Jaspreet Singh', 45, 'Male', '9811100009', 'Moga'),
(310, 'Anjali Kapoor', 33, 'Female', '9811100010', 'Pathankot');

SELECT * FROM Patients;
-- Insert Appointments Data
INSERT INTO Appointments
(appointment_id, patient_id, doctor_id,
 appointment_date, appointment_time, status)
VALUES
(401, 301, 201, '2026-11-12', '09:00:00', 'Scheduled'),
(402, 302, 202, '2026-11-12', '10:00:00', 'Scheduled'),
(403, 303, 203, '2026-11-13', '11:00:00', 'Scheduled'),
(404, 304, 204, '2026-11-13', '12:00:00', 'Scheduled'),
(405, 305, 205, '2026-11-14', '09:30:00', 'Scheduled'),
(406, 306, 201, '2026-11-10', '10:30:00', 'Completed'),
(407, 307, 202, '2026-11-10', '11:30:00', 'Completed'),
(408, 308, 203, '2026-11-09', '12:30:00', 'Completed'),
(409, 309, 204, '2026-11-09', '14:00:00', 'Completed'),
(410, 310, 205, '2026-11-15', '15:00:00', 'Scheduled');
SELECT * FROM Appointments;
-- Insert Medical Records Data
INSERT INTO Medical_Records
(record_id, patient_id, doctor_id, diagnosis, treatment, record_date)
VALUES
(501, 301, 201, 'Hypertension', 'Blood pressure medication', '2026-11-01'),
(502, 302, 202, 'Migraine', 'Pain management therapy', '2026-11-02'),
(503, 303, 203, 'Fracture', 'Plaster and physiotherapy', '2026-11-03'),
(504, 304, 204, 'Viral Fever', 'Rest and medication', '2026-11-04'),
(505, 305, 205, 'Skin Allergy', 'Antihistamine treatment', '2026-11-05'),
(506, 306, 201, 'Heart Disease', 'Cardiac medication', '2026-11-06'),
(507, 307, 202, 'Headache', 'Pain relief medication', '2026-11-07'),
(508, 308, 203, 'Joint Pain', 'Physiotherapy', '2026-11-08'),
(509, 309, 204, 'Common Cold', 'Symptomatic treatment', '2026-11-09'),
(510, 310, 205, 'Acne', 'Skin care treatment', '2026-11-10');
SELECT * FROM Medical_Records;
-- Insert Billing Data
INSERT INTO Billing
(bill_id, patient_id, amount, bill_date, payment_status)
VALUES
(601, 301, 2500.00, '2026-11-01', 'Paid'),
(602, 302, 1800.00, '2026-11-02', 'Paid'),
(603, 303, 5500.00, '2026-11-03', 'Pending'),
(604, 304, 1200.00, '2026-11-04', 'Paid'),
(605, 305, 2000.00, '2026-11-05', 'Pending'),
(606, 306, 8500.00, '2026-11-06', 'Paid'),
(607, 307, 1500.00, '2026-11-07', 'Paid'),
(608, 308, 3200.00, '2026-11-08', 'Pending'),
(609, 309, 1000.00, '2026-11-09', 'Paid'),
(610, 310, 2200.00, '2026-11-10', 'Pending');
SELECT * FROM Billing;