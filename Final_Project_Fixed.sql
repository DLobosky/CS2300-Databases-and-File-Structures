/* Final Project */

CREATE TABLE Library(

Library_no 		INT  			NOT NULL 			PRIMARY KEY,
Street 			VARCHAR(30)	    NOT NULL, 
City			VARCHAR(20)		NOT NULL,
State_			VARCHAR(20)		NOT NULL, 
Zip				INT(5)			NOT NULL 

);

CREATE TABLE Inventory(

Stock_no  		INT  NOT NULL PRIMARY KEY,
Title 			VARCHAR(30)    	NOT NULL, 
In_stock		INT				NOT NULL, 
Library_no		INT  			NOT NULL			REFERENCES  Library(Library_no), 
Genre			VARCHAR(30),
Rented_times	INT				NOT NULL

);


CREATE TABLE Book(

ISBN  			BIGINT(13)  		NOT NULL 			PRIMARY KEY,
Author 			VARCHAR(30)    	NOT NULL,
Stock_no		INT				NOT NULL			REFERENCES Inventory(Stock_no)

);

CREATE TABLE DVD(

DVD_ISBN  		BIGINT(13)  	NOT NULL 			PRIMARY KEY,
Publisher  		VARCHAR(30) 	NOT NULL,
Stock_no		INT				NOT NULL			REFERENCES Inventory(Stock_no)

);

CREATE TABLE Student(

Student_no  	INT(8)			NOT NULL			PRIMARY Key,
Fname   		VARCHAR(15)  	NOT NULL,
Lname   		VARCHAR(15)  	NOT NULL,
Balance_due		FLOAT,
email			VARCHAR(15)

);

CREATE TABLE Staff(

Employee_no  	INT				NOT NULL			PRIMARY Key,
Fname   		VARCHAR(15)  	NOT NULL,
Lname   		VARCHAR(15)  	NOT NULL

);

CREATE TABLE Rented(

Stock_no  		INT				NOT NULL			REFERENCES Inventory(Stock_no),
Student_no  	INT				NOT NULL			REFERENCES Student(Student_no),
title   		VARCHAR(15)  	NOT NULL,
out_date		DATE			NOT NULL,
due_date		DATE			NOT NULL,
late_fee		FLOAT			NOT NULL

);

INSERT INTO Library VALUES (1, '731 Fondren', 'Houston', 'TX', 95467);
INSERT INTO Library VALUES (2, '638 Voss', 'Houston', 'TX', 95466);
INSERT INTO Library VALUES (3, '3321 Castle', 'Spring', 'TX', 95465);
INSERT INTO Library VALUES (4, '291 Berry', 'Bellaire', 'TX', 95464);
INSERT INTO Library VALUES (5, '975 Fire Oak', 'Humble', 'TX', 95463);

INSERT INTO Inventory VALUES (00001, 'Murder at swamp lake', 10 , 3 , 'Mystery', 9);
INSERT INTO Inventory VALUES (00002, 'Revere Chenwei Gong', 50 , 5 , 'Biography', 100);
INSERT INTO Inventory VALUES (00003, 'Why is Sean Sikorski so good', 60 , 4 , 'Biography', 55);
INSERT INTO Inventory VALUES (00004, 'How to beat up everybody?', 10 , 1 , 'Education', 15);
INSERT INTO Inventory VALUES (00005, 'How to alienate your friends using your religon?', 20 , 2 , 'Tutorial', 20);

INSERT INTO Book VALUES (5594021192837, 'Sean Sikorski', 10);
INSERT INTO Book VALUES (2894587374103, 'Sean Sikorski', 50);
INSERT INTO Book VALUES (5906693822712, 'Chenwei Gong', 60);

INSERT INTO DVD VALUES (4958372819384, 'Judah Friedlander', 10);
INSERT INTO DVD VALUES (5883920193817, 'Adolf Hitler', 20);

INSERT INTO Student VALUES (12412046, 'Adolf', 'Hitler', 12.3, 'gasjew@tamu.edu');
INSERT INTO Student VALUES (12412045, 'Donald', 'Trump', 6012036.73, 'greatagain@trump.edu');
INSERT INTO Student VALUES (12412044, 'Hillary', 'Clinton', 6012036.72, 'notmypresident@rigged.edu');
INSERT INTO Student VALUES (12412043, 'Seymore', 'Butts', 6.72, 'morebutts7@trolls.edu');
INSERT INTO Student VALUES (12412042, 'AK', 'Fourtyseven', 1126.72, 'cooldude1@trolls.edu');

INSERT INTO Staff VALUES (16420, 'Tery', 'Rist');
INSERT INTO Staff VALUES (16421, 'AL', 'Qaeda');
INSERT INTO Staff VALUES (16422, 'Barack', 'Obama');
INSERT INTO Staff VALUES (16423, 'Tony', 'Stark');
INSERT INTO Staff VALUES (16424, 'Phil', 'Coulson');

INSERT INTO Rented VALUES (00004, 12412045, 'How to beat up everybody?', '1968-6-1','1968-8-1', 6000000);
INSERT INTO Rented VALUES (00001, 12412043, 'Murder at swamp lake', '1968-6-2','1968-8-2', 20);
