CREATE DATABASE DB_APP;
USE DB_APP;
show TABLES;
/* Create tables */
CREATE TABLE IF NOT EXISTS patient (
    id_patient INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    genre VARCHAR(10) NOT NULL,
    statut_marital VARCHAR(20) NOT NULL,
    CIN VARCHAR(10) NOT NULL UNIQUE,
    telephone VARCHAR(20) NOT NULL,
    adresse VARCHAR(200)
);
CREATE TABLE IF NOT EXISTS StaffMedical (
    id_staff INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    specialite VARCHAR(100) NOT NULL,
    CIN VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    telephone VARCHAR(20) NOT NULL,
    adresse VARCHAR(200),
    date_embauche DATE NOT NULL,
    salaire DECIMAL(10,2),
    role VARCHAR(50) NOT NULL 
);
CREATE TABLE IF NOT EXISTS File_attente (
    ID_file INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date DATETIME NOT NULL,
    Statut VARCHAR(50) NOT NULL,
    id_patient INT NOT NULL,
    FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
    id_staff INT NOT NULL,
    FOREIGN KEY (id_staff) REFERENCES StaffMedical(id_staff)
);
CREATE TABLE IF NOT EXISTS Consultation (
    id_consultation INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_consultation DATETIME NOT NULL,
    diagnostic TEXT,
    traitement TEXT,
    ordonnance TEXT,
    id_patient INT NOT NULL,
    FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
    id_staff INT NOT NULL,
    FOREIGN KEY (id_staff) REFERENCES StaffMedical(id_staff)
);
CREATE TABLE IF NOT EXISTS Users (
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    id_staff INT,
    FOREIGN KEY (id_staff) REFERENCES StaffMedical(id_staff)
);
ALTER TABLE Consultation
CHANGE COLUMN diagnostic diagnostic_path VARCHAR(500) NULL,
CHANGE COLUMN traitement traitement_path VARCHAR(500) NULL,
CHANGE COLUMN ordonnance ordonnance_path VARCHAR(500) NULL,
ADD COLUMN scanner_path VARCHAR(500) NULL,
ADD COLUMN analyse_path VARCHAR(500) NULL;
INSERT INTO Users (username, password, role) VALUES ('admin', '12345', 'Administrateur');


