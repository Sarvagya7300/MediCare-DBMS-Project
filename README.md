# MediCare - A Healthcare Management System

**MediCare** is a structured relational database project designed to manage and organize hospital information efficiently using MySQL. Traditional manual record-keeping often leads to data duplication, difficult searching, and inefficient billing. This project eliminates those inefficiencies by maintaining medical histories, tracking scheduled appointments, and securing patient data in a centralized, normalized system.

This project was developed at Chandigarh University by Ripanjit Kaur Deol and Sarvagya Mahajan.

### Key Features
* **Patient Management**: Stores and retrieves patient records, including demographics and contact details.
* **Doctor & Department Management**: Maintains doctor specializations and associates medical staff with their respective hospital departments.
* **Appointment Tracking**: Connects patients with doctors and tracks scheduled versus completed appointments.
* **Medical Records**: Stores detailed patient diagnoses, treatments, and medical history dates.
* **Billing Management**: Calculates total hospital revenue, tracks bill amounts, and monitors pending versus paid payment statuses.

### Database Schema
The database consists of six interconnected tables normalized up to Third Normal Form (3NF) to reduce data redundancy, ensure atomic values, and eliminate partial and transitive dependencies.
* **Departments**: `department_id` (PK), `department_name`, `location`
* **Doctors**: `doctor_id` (PK), `doctor_name`, `specialization`, `phone`, `department_id` (FK)
* **Patients**: `patient_id` (PK), `patient_name`, `age`, `gender`, `phone`, `address`
* **Appointments**: `appointment_id` (PK), `patient_id` (FK), `doctor_id` (FK), `appointment_date`, `appointment_time`, `status`
* **Medical_Records**: `record_id` (PK), `patient_id` (FK), `doctor_id` (FK), `diagnosis`, `treatment`, `record_date`
* **Billing**: `bill_id` (PK), `patient_id` (FK), `amount`, `bill_date`, `payment_status`

### Setup Instructions
1. Clone this repository to your local machine.
2. Open MySQL Workbench.
3. Execute the SQL scripts in the `sql/` directory in the following sequential order:
   * **First**: Initialize the database using `01_healthcare.sql`.
   * **Second**: Define the table schemas using `02_database.sql`.
   * **Third**: Insert the sample records using `03_data.sql`.
   * **Fourth**: Run analytical queries using `04_queries.sql`.
   * **Fifth**: Test transactions using `05_advanced.sql`.