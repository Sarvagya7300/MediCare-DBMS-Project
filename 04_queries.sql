-- Query 1: Display All Patients
SELECT * FROM Patients;
-- Query 2: Display Patients Above Age 30
SELECT *
FROM Patients
WHERE age > 30;
-- Query 3: Sort Patients by Age (Descending Order)
SELECT patient_id, patient_name, age
FROM Patients
ORDER BY age DESC;
-- Query 4: Display Unique Patient Cities
SELECT DISTINCT address
FROM Patients
ORDER BY address ASC;
-- Query 5: Search Patients Whose Names Start with 'A'
SELECT patient_id, patient_name, age, address
FROM Patients
WHERE patient_name LIKE 'A%';
-- Query 6: Find Patients Between Ages 25 and 40
SELECT patient_id, patient_name, age
FROM Patients
WHERE age BETWEEN 25 AND 40
ORDER BY age ASC;
-- Query 7: Count Total Patients
SELECT COUNT(*) AS total_patients
FROM Patients;
-- Query 8: Calculate Average Patient Age
SELECT ROUND(AVG(age), 2) AS average_age
FROM Patients;
-- Query 9: Calculate Total Hospital Revenue
SELECT SUM(amount) AS total_revenue
FROM Billing
WHERE payment_status = 'Paid';
-- Query 10: Find Highest and Lowest Hospital Bill
SELECT
    MAX(amount) AS highest_bill,
    MIN(amount) AS lowest_bill
FROM Billing;
-- Query 11: Count Appointments by Status
SELECT
    status,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY status
ORDER BY status;
-- Query 12: Find Doctors with More Than One Appointment
SELECT
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
INNER JOIN Appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING COUNT(a.appointment_id) > 1
ORDER BY d.doctor_id;
-- Query 13: Display Patients with Their Doctors
SELECT
    p.patient_id,
    p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date
FROM Patients p
INNER JOIN Appointments a
    ON p.patient_id = a.patient_id
INNER JOIN Doctors d
    ON a.doctor_id = d.doctor_id
ORDER BY p.patient_id;
-- Query 14: Display All Doctors and Their Appointments
SELECT
    d.doctor_id,
    d.doctor_name,
    a.appointment_id,
    a.patient_id,
    a.appointment_date,
    a.status
FROM Doctors d
LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
ORDER BY d.doctor_id, a.appointment_id;
-- Query 15: Display All Appointments with Doctor Details
SELECT
    a.appointment_id,
    a.patient_id,
    d.doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM Doctors d
RIGHT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
ORDER BY a.appointment_id;
-- Query 16: Find Patients Having Bills Above Average Amount
SELECT
    p.patient_id,
    p.patient_name,
    b.amount
FROM Patients p
INNER JOIN Billing b
    ON p.patient_id = b.patient_id
WHERE b.amount > (
    SELECT AVG(amount)
    FROM Billing
)
ORDER BY b.amount DESC;
-- Query 17: Find Patients with Pending Payments
SELECT
    patient_id,
    patient_name,
    phone
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Billing
    WHERE payment_status = 'Pending'
)
ORDER BY patient_id;
-- Query 18: Find Patients Having Medical Records
SELECT
    p.patient_id,
    p.patient_name,
    p.age
FROM Patients p
WHERE EXISTS (
    SELECT 1
    FROM Medical_Records m
    WHERE m.patient_id = p.patient_id
)
ORDER BY p.patient_id;
-- Query 19: Department-wise Doctor Count
SELECT
    dep.department_id,
    dep.department_name,
    COUNT(d.doctor_id) AS total_doctors
FROM Departments dep
LEFT JOIN Doctors d
    ON dep.department_id = d.department_id
GROUP BY dep.department_id, dep.department_name
ORDER BY dep.department_id;
-- Query 20: Total Billing Amount by Payment Status
SELECT
    payment_status,
    COUNT(*) AS total_bills,
    SUM(amount) AS total_amount
FROM Billing
GROUP BY payment_status
ORDER BY payment_status;