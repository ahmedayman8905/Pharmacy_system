CREATE SCHEMA Cairo;
go

Create Table Cairo.Medical_Equipment
(
	ID int Identity(1,1) primary key,
	Device_Name Varchar(Max),
	Device_version_number int,
	Device_manufacture_company Varchar(Max),
	Maintenance_Records date,
	Usage_Logs date,
	Available char(1) Check (Available = 'Y' or Available = 'N')
);

create table Cairo.Pharmacist
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
Time_Work int,
DepartId int,
Jop_Title varchar(20),
LicenseNum int
);

create table Cairo.Use_Medical_Equipment
(
	medical_id int references Cairo.Medical_Equipment(ID),
	pharmacist_id int references  Cairo.Pharmacist(ID),
);

create table Cairo.Client
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Pharmacist_id int references Cairo.Pharmacist (ID),
);

Create Table Cairo.Drug
(
ID int Identity(1,1) primary key, 
Drug_Name varchar(50),
Company_ID int,
Mfg_Date Date,
Exp_Date Date,
Quantity int,
Price decimal(10,2),
Side_effect Varchar(Max),
Druginformation Varchar(Max),
client_id int references Cairo.Client (ID),
pharmacist_id int references Cairo.Pharmacist(ID), 
);

Create Table Cairo.Bill
(
Bill_ID int Identity(1,1) primary key,
Patient_Information varchar(max),
Prescription_Details varchar(max),
Medication_Details varchar(max),
Date_Time DateTime, 
Price decimal(10,1),
PharmacyDetails varchar(max),
Notes_Comments varchar(max),
client_id int references Cairo.Client(ID),  
);

create table Cairo.Orders
(
ID int Identity(1,1) primary key,
TotalPrice decimal(10,2),
Quantity int,
bill_id int references Cairo.Bill(Bill_ID),
client_id int references Cairo.Client(ID),
);

create table Cairo.Item
(
ID int Identity(1,1) primary key,
Name varchar(50),
Quantity int,
order_id int references Cairo.Orders(ID),
);

create table Cairo.Payment
(
PayID int identity(1,1) primary key,
Amount decimal(10,4) not null,
bill_id int references Cairo.Bill(Bill_ID),
);

create table Cairo.Cash
(
CashID int identity(1,1) primary key,
payment_id int references Cairo.Payment(PayId),
);
create table Cairo.Credit
(
Credit_ID int identity(1,1) primary key,
payment_id int references Cairo.Payment(PayId),
);

create table Cairo.Company
(
ID int primary key identity(1,1),
Comp_Name varchar(50) not null,
Comp_Email varchar(50) not null,
Comp_Location varchar(50) not null
);

create table  Cairo.Digital_Markter
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN varchar(50),
Hire_date date,
Salary int,
TimeWork varchar(50),
Company_id int references Cairo.Company(ID),
);

create table Cairo.Manger
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
TimeWork int,
Department varchar(20)
);


create table Cairo.Company_Owner
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(30),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN varchar(50),
Hire_date date,
Salary int,
TimeWork varchar(50),
Company varchar(20),
Company_id int references Cairo.Company(ID),
manager_id int references Cairo.Manger(ID),
);

create table Cairo.Accountant
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
TimeWork int,
manager_id int references Cairo.Manger(ID),
);


create table Cairo.TAX
(
ID int Identity(1,1) primary key,
Revenues decimal(10,2),
Expenses decimal(10,2),
Accountant_id int references Cairo.Accountant(ID),
);


create table Cairo.System_Admin
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
Time_Work int,
manager_id int references Cairo.Manger(ID),
);

create table Cairo.HR
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
Time_Work int,
manager_id int references Cairo.Manger(ID),
);
create table Cairo.Employee
(
ID int Identity(1,1) primary key,
Name varchar(50),
Phone varchar(11),
Address varchar(50),
Gender varchar(1) check(Gender = 'F' or Gender = 'M'),
E_mail varchar(50),
Birth_day date, 
SSN int,
Hire_date date,
Salary int,
Time_Work int,
DepartId int,
Jop_Title varchar(20),
Hr int references Cairo.HR(ID),
);


alter table Cairo.Credit
add number decimal  , type varchar(50), expireDate date;
go;
alter table Cairo.Manger
drop column SSN;
go;
alter table Cairo.Manger
add SSN varchar(50);
go;
alter table Cairo.Accountant
drop column SSN , TimeWork , Phone;
go
alter table Cairo.Accountant
add SSN varchar(50) , TimeWork varchar(50) , Phone varchar(50);
go;
alter table Cairo.HR
drop column SSN , Time_Work , Phone;
go
alter table Cairo.HR
add SSN varchar(50) , Time_Work varchar(50) , Phone varchar(50);
go;
alter table Cairo.Employee
drop column SSN , Time_Work , Phone;
go
alter table Cairo.Employee
add SSN varchar(50) , Time_Work varchar(50) , Phone varchar(50);
go;
alter table Cairo.Employee
drop column Jop_Title;
go
alter table Cairo.Employee
add Jop_Title varchar(50); 
go;
alter table Cairo.System_Admin
drop column SSN , Time_Work , Phone;
go
alter table Cairo.System_Admin
add SSN varchar(50) , Time_Work varchar(50) , Phone varchar(50);
