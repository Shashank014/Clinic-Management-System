# Clinic Management System

## Overview

This project is a Clinic Management System developed as part of the INFO 579: SQL/NoSQL Databases for Data and Information Sciences course at the University of Arizona. 
The system is designed to replace manual data handling in small clinics by automating the management of patient information, treatments, diagnostic tests, and medical equipment.

### By building a relational database, the project aims to:

* Improve operational efficiency

* Enhance data accuracy

* Support better patient care and clinic management

## Data Sources

Datasets sourced from Kaggle covering:

* Patient records

* Diagnostic procedures

* Medical equipment

* Available treatments

* Healthcare providers (doctors)

## Database Design

### Entities:

* Patients

* Doctors

* Treatments

* Medications

* Equipment

### Relationships:
* One-to-Many: Doctor → Patients

* One-to-Many: Doctor → Treatments

* One-to-Many: Patient → Medications

* Many-to-Many: Patients ↔ Treatments (via PatientTreatment junction table)

* Many-to-Many: Patients ↔ Equipment (via PatientEquipment junction table)

### Key Junction Tables:
* PatientTreatment: Links patients and treatments

* PatientEquipment: Links patients and equipment

### Physical Model:
All entities and junction tables were implemented using SQL DDL statements (CREATE TABLE), with data inserted using DML statements (INSERT INTO). Advanced SQL queries were created to retrieve and manipulate data.

## SQL Operations
* Database Creation: ClinicDB

* Tables Created: Patients, Doctors, Treatments, Medications, Equipment, PatientTreatment, PatientEquipment

* Data Manipulation:

    * Basic SELECT

    * INNER JOIN and LEFT OUTER JOIN

    * Subqueries (single-row, multi-row, NOT IN, NOT EXISTS)

    * Aggregations (SUM, GROUP BY)

    * Conditional logic (CASE statements)

## Features
* Comprehensive Database Modeling (Conceptual → Logical → Physical)

* Many-to-Many Relationship Resolution

* Advanced Querying Techniques

* Data Aggregation and Analysis

* Operational Reporting with SQL

## Summary
This Clinic Management System demonstrates practical database design principles and advanced SQL usage to transform manual recordkeeping into an efficient digital system, improving healthcare delivery in a small clinic environment.
