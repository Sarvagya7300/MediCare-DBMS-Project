USE healthcare_management;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(10),
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200)
);
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    appointment_time TIME,
    status VARCHAR(30) DEFAULT 'Scheduled',

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(200) NOT NULL,
    treatment VARCHAR(200),
    record_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2) NOT NULL,
    bill_date DATE,
    payment_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    CHECK (amount >= 0)
);