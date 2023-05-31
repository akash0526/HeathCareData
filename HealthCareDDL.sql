create table dbo.Doctor (
Doctor_ID int identity(1,1) primary key,
Phone_Number Bigint not null,
Name varchar(200) not null,
InsertDate datetime default(getdate()),
Check (len(Phone_Number)=10)
);
alter table dbo.Doctor add Doctor_SSN varchar (10) not null;

Insert into dbo.doctor(Doctor_SSN,Name,Phone_Number) values(9190841246,'John','7630399848'), ('9017595693','sita','1694362521');


create Table dbo.Patient(
Patient_Id int identity(1,1) primary key,
Patient_SSN varchar(10) not null,
Doctor_ID int Not Null foreign key (Doctor_ID) references dbo.Doctor,
Name Varchar (200) not null ,
Gender Varchar(100) not null

);
alter table dbo.Patient add InsertDate datetime default(getdate());
insert into dbo.Patient()

create table dbo.PayCheck(
Check_Number int identity(1,1) primary key,
Doctor_ID int not null foreign key (Doctor_ID) references dbo.Doctor,
Salary float check (Salary > 0) ,
Bonus Float check (Bonus > 0),
Pay_Date datetime ,
InsertDate Datetime default(getdate())
);

Create table dbo.Insurance(
Company_ID int identity (1,1) primary key ,
	Company_Name varchar(200) not null,
	Phone_Number BigInt not null check (len(Phone_Number)=10)
	
);
alter table dbo.Insurance add InsertDate datetime default (getdate());

Create table dbo.CoveredBy(
Patient_ID int not null foreign key references dbo.Patient,
Company_ID int foreign key references dbo.Insurance,
Insurance_Serial_Number varchar(20),
Insurance_Expairy_Date datetime,
InsertDate datetime default(getdate())
);

Create table dbo.Dignosis(
Dignosis_ID int identity(1,1) primary key,
Dignosis_Category Varchar(200) not null,
Base_Price float not null check (Base_Price > 0),
InsertDate Datetime default(getdate())

);
Create table dbo.CPT(
CPT_ID int identity(1,1) primary key,
CPT_Category varchar(200) not null,
CPT_Price float Not null check (CPT_Price > 0)
);
alter table dbo.CPT add InsertDate DateTime default(getDate());


Create Table dbo.Medicine(
Medicine_Inventory_ID int identity(1,1) primary key,
Medicine_Name  varchar(200) not null,
Manufacturer varchar(200) not null,
Quantity int ,
Price float not null check (Price> 0),
InsertDate datetime Default(getdate())

);
Create Table dbo.Prescription(
Prescription_ID int identity(1,1) primary key,
Patient_ID int not null foreign key references dbo.Patient,
Prescription_Date datetime,
InsertDate datetime default(getdate())
);
Create table Prescriped_Medicine(
Prescription_ID int not null foreign key references dbo.Prescription,
Medicine_Inventory_ID int not null  foreign key references dbo.Medicine,
Quantity float,
InsertDate datetime default(getDate()),
primary key(Prescription_ID,Medicine_Inventory_ID)
);

create table Dbo.Invoice (
Invoice_Number int identity(1,1) primary key ,
Patient_ID int not null foreign key references dbo.Patient,
CPT_ID int not null	foreign key references dbo.CPT,
Dignosis_ID int not null foreign key references dbo.Dignosis,
Prescription_ID int not null foreign key references dbo.Prescription,
Amount float  check (Amount > =0),
InvoiceDate datetime,
InsertDate datetime Default (getDate())

);

Create Table dbo.payment(
Payment_ID int identity(1,1) not null primary key,
Invoice_Number int not null foreign key references dbo.Invoice,
Payment_Status Varchar (20) ,
Payment_Method varchar(20),
Payment_Date datetime,
InsertDate Datetime default(getdate())
 );








