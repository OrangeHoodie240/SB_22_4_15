DROP DATABASE IF EXISTS medical_db
; 
CREATE DATABASE medical_db;
\c medical_db

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
     first_name TEXT NOT NULL, 
     last_name TEXT NOT NULL, 
     date_of_birth DATE NOT NULL); 

CREATE TABLE patients(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    date_of_birth DATE NOT NULL);

CREATE TABLE patient_to_doctor(
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
     doctor_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE NOT NULL); 

CREATE TABLE visits(
    id SERIAL PRIMARY KEY, 
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE NOT NULL, 
    doctor_id INTEGER  REFERENCES doctors(id) ON DELETE CASCADE NOT NULL, 
    visit_date DATE NOT NULL);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY, 
    disease_name TEXT NOT NULL); 


-- diagnosis_date and unassociated_doctor for diagnosis that took place else where
CREATE TABLE disease_diagnosis(
    doctor_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE NULL, 
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE NOT NULL , 
    visit_id INTEGER REFERENCES visits(id) ON DELETE CASCADE NULL, 
    diagnosis_date DATE NULL, 
    unassociated_doctor_name TEXT NULL, 
    disease_id INTEGER REFERENCES diseases(id) ON DELETE CASCADE NOT NULL);

INSERT INTO doctors(first_name, last_name, date_of_birth) 
    VALUES('David', 'Hoff', '1952-7-17');

INSERT INTO patients(first_name, last_name, date_of_birth)
    VALUES('Zardu', 'Hasselfrau', '1952-7-17');

INSERT INTO patient_to_doctor(patient_id, doctor_id)
    VALUES(1,1);

INSERT INTO visits(patient_id, doctor_id, visit_date)
    VALUES(1,1,'2017-5-5');

INSERT INTO diseases(disease_name)
    VALUES('Funk Fever');

INSERT INTO disease_diagnosis(doctor_id, patient_id, visit_id, diagnosis_date, unassociated_doctor_name, disease_id)
    VALUES(1, 1, 1, NULL ,NULL, 1);
