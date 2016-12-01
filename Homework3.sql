/*  Programmer: Dalton Lobosky
	Class: CS2300 Databases and File Systems
	Homework: SQL Practice
*/

/*------------------------------------------------------------------------------------Create Tables------------------------------------------------------------------------------------------*/

CREATE TABLE Employee (
Fname VARCHAR(12) NOT NULL,
Minit CHAR(1),
Lname VARCHAR(15) NOT NULL,
SSN CHAR(9) NOT NULL,
Bdate DATE,
Address VARCHAR(30),
Sex CHAR (1),
Salary INT(6),
Super_ssn VARCHAR (9) REFERENCES Employee(SSN),
Dno INT REFERENCES Department(Dnumber),
PRIMARY KEY(SSN)
);

CREATE TABLE Department (
Dname VARCHAR(10),
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) REFERENCES Employee(SSN),
Mgr_start_date DATE,
PRIMARY KEY(Dnumber)
);

CREATE TABLE Dept_Locations (
Dnumber INT NOT NULL REFERENCES Department(Dnumber),
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY(Dnumber, Dlocation)
);

CREATE TABLE Project (
Pname VARCHAR(10),
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT REFERENCES Department(Dnumber),
PRIMARY KEY(Pnumber)
);

CREATE TABLE Works_On (
Essn VARCHAR(9) NOT NULL REFERENCES Employee(SSN),
Pno INT NOT NULL REFERENCES Project(Pnumber),
Hours FLOAT,
PRIMARY KEY(Essn, Pno)
);

CREATE TABLE Dependent (
Essn VARCHAR(9) NOT NULL REFERENCES Employee(SSN),
Dependent_name VARCHAR (20) NOT NULL,
Sex CHAR(1),
Bdate DATE,
Relationship VARCHAR(10),
PRIMARY KEY(Essn, Dependent_name)
);
/*------------------------------------------------------------------------------ Failed Attmept to add Foreign Keys -----------------------------------------------------------------------*/

/*ALTER TABLE Employee ADD FOREIGN KEY (Dno) REFERENCES Department(Dnumber);
ALTER TABLE Employee ADD FOREIGN KEY (Super_ssn) REFERENCES Employee(SSN);
ALTER TABLE Department ADD FOREIGN KEY (Mgr_ssn) REFERENCES Employee(SSN);
ALTER TABLE Dept_Locations ADD FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);
ALTER TABLE Project ADD FOREIGN KEY (Dnum) REFERENCES Department(Dnumber);
ALTER TABLE Works_On ADD FOREIGN KEY (Pno) REFERENCES Project(Pnumber);
ALTER TABLE Works_On ADD FOREIGN KEY (Essn) REFERENCES Employee(SSN);
ALTER TABLE Dependent ADD FOREIGN KEY (Essn) REFERENCES Employee(SSN);*/

/*-------------------------------------------------------------------------------------INSERTIONS--------------------------------------------------------------------------------------------*/

INSERT INTO Employee (Fname, Minit, Lname, SSN, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren Houston, TX', 'M', 30000, '333445555', 5),
	('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
	('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4),
	('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
	('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
	('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
	('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
	('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES ('Research', 5, '333445555', '1988-05-22'),
	('Administration', 4, '987654321', '1995-01-01'),
	('Headquarters', 1, '888665555', '1981-06-19');

INSERT INTO Dept_Locations (Dnumber, Dlocation) VALUES (1, 'Houston'),
	(4, 'Stafford'),
	(5, 'Bellaire'),
	(5, 'Sugarland'),
	(5, 'Houston');

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum) VALUES ('ProductX', 1, 'Bellaire', 5),
	('ProductY', 2, 'Sugarland', 5),
	('ProductZ', 3, 'Houston', 5),
	('Computerization', 10, 'Stafford', 4),
	('Reorganization', 20, 'Houston', 1),
	('Newbenefits', 30, 'Stafford', 4);

INSERT INTO Works_On (Essn, Pno, Hours) VALUES ('123456798', 1, 32.5),
	('123456789', 2, 7.5),
	('666884444', 3, 40.0),
	('453453453', 1, 20.0),
	('453453453', 2, 20.0),
	('333445555', 2, 10.0),
	('333445555', 3, 10.0),
	('333445555', 10, 10.0),
	('333445555', 20, 10.0),
	('999887777', 30, 30.0),
	('999887777', 10, 10.0),
	('987987987', 10, 35.0),
	('987987987', 30, 5.0),
	('987654321', 30, 20.0),
	('987654321', 20, 15.0),
	('888665555', 20, NULL);

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES('333445555','Alice','F','1986-04-05','Daughter'),
	('333445555','Theodore','M','1983-10-25','Son'),
	('333445555','Joy','F','1958-05-03','Spouse'),
	('987654321','Abner','M','1942-02-28','Spouse'),
	('123456789','Michael','M','1988-01-04','Son'),
	('123456789','Alice','F','1988-12-20','Daughter'),
	('123456789','Elizabeth','F','1967-05-05','Spouse');

/*-------------------------------------------------------------------------------Show Contents of All Tables----------------------------------------------------------------------------*/
	
SELECT *
FROM Employee;

SELECT *
FROM Department;

SELECT *
FROM Dept_Locations;

SELECT *
FROM Works_On;

SELECT *
FROM Project;

SELECT *
FROM Dependent;

/*---------------------------------------------------------------------------------------- Queries -------------------------------------------------------------------------------------*/
/* A */
SELECT E.Fname, E.Lname
FROM Employee AS E, Works_On AS W, Project AS P
WHERE E.SSN = W.Essn AND P.Pnumber = W.Pno AND E.Dno = 5 AND W.Hours > 10 AND P.Pname = 'ProductX';

/* B */
SELECT E.Fname, E.Lname
FROM Employee AS E, Dependent AS D
WHERE E.SSN = D.Essn AND E.Fname = D.Dependent_name;

/* C */
SELECT Fname, Lname
FROM Employee
WHERE Super_ssn = (SELECT SSN
					FROM Employee
					WHERE Fname = 'Franklin' AND Lname = 'Wong');
					
/* D */		
SELECT P.Pname, SUM(W.Hours)
FROM Project AS P, Works_On AS W
WHERE P.Pnumber = W. Pno
GROUP BY Pname;

/* E */		
SELECT Fname, Lname
FROM Employee
WHERE (NOT EXISTS (SELECT Pnumber
					FROM Project
					WHERE (NOT EXISTS (SELECT *
										FROM Works_On
										WHERE Pnumber = Pno AND Essn = SSN))));

/* F */		
SELECT Fname, Lname
FROM Employee
WHERE (NOT EXISTS(SELECT *
					FROM Works_On
					WHERE Essn = SSN));

/* G */		
SELECT Dname, AVG(Salary)
FROM Department, Employee
WHERE Dnumber = DNO
GROUP BY Dname;

/* H */		
SELECT AVG(Salary)
FROM Employee
WHERE Sex = 'F';

/* I */		
SELECT Fname, Lname, Address
FROM Employee
WHERE (EXISTS(SELECT *
				FROM Works_On, Project
				WHERE SSN = Essn AND Pnumber = Pno AND Plocation = 'Houston')) AND (NOT EXISTS(SELECT *
																								FROM Dept_Locations
																								WHERE Dno = Dnumber AND Dlocation = 'Houston'));

/* J */		
SELECT Fname, Lname
FROM Employee
WHERE (EXISTS(SELECT *
				FROM Department
				WHERE SSN = Mgr_ssn AND (NOT EXISTS(SELECT *
														FROM Dependent
														WHERE SSN = Essn))));
														
														
/* ----------------------------------------------------------------------- DROP TABLES -------------------------------------------------------------------------------------------------------*/

DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE Dependent;
DROP TABLE Works_On;
DROP TABLE Project;
DROP TABLE Dept_Locations;




