--Primary Table
Create TABLE CourseDetails
(
CourseID INT PRIMARY KEY IDENTITY,
CourseName NVARCHAR (40) NOT NULL,
Duration NVARCHAR (30),
SeatAvailability Int
);
GO
-- TSP Table

CREATE TABLE TSPs
(
TSPID INT PRIMARY KEY IDENTITY (101, 1),
TSPName NVARCHAR (MAX),
TSPLocation NVARCHAR (200),
Manager NVARCHAR (50) SPARSE NULL,
ContactNumber VARCHAR (15),
Email VARCHAR (30),
CourseID INT FOREIGN KEY REFERENCES CourseDetails(CourseID),
NumberOfSeats INT
);
GO
--Trainer Table
CREATE TABLE TrainerList
(
TrainerID INT PRIMARY KEY IDENTITY (201, 1),
TrainerName NVARCHAR (50) NOT NULL,
TrainerContact VARCHAR (15),
TrainerEmail VARCHAR (60),
TSPName NVARCHAR (MAX),
TSPID INT FOREIGN KEY REFERENCES TSPs(TSPID),
AssignedCourse NVARCHAR (MAX) SPARSE NULL
);
GO
--Trainee Table

Create TABLE Trainees
(
TraineeID INT PRIMARY KEY IDENTITY (127500, 1),
TraineeName NVARCHAR (50) NOT NULL,
DOB DATE,
Gender NVARCHAR (20) SPARSE NULL,
TraineeContact VARCHAR (15) CHECK (TraineeContact LIKE '01%'),
Email VARCHAR (40) CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com' OR Email LIKE '@outlook.com'),
University VARCHAR (50),
CFScore INT NOT NULL,
PreferredCourses NVARCHAR (MAX),
MotivationBehindTheChoice VARCHAR (MAX) NOT NULL,
TraineeImage VARCHAR (MAX) SPARSE NULL,
CourseID INT FOREIGN KEY REFERENCES CourseDetails(CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
CourseName VARCHAR (50) DEFAULT 'NOT ASSIGNED YET',
TSPID INT FOREIGN KEY REFERENCES TSPs(TSPID) ON UPDATE CASCADE ON DELETE CASCADE,
TspName VARCHAR (50) DEFAULT 'NOT ASSIGNED YET',
--CONSTRAINT [fk_Constraint] FOREIGN KEY (TSPID, CourseID) REFERENCES TSPs(TSPID, CourseID),
);
GO
--LoginInfo Table
CREATE TABLE LoginInfo
(
TraineeID INT FOREIGN KEY REFERENCES Trainees(TraineeID),
RegistraionID INT PRIMARY KEY IDENTITY(1001,1),
UserName VARCHAR (50) NOT NULL UNIQUE,
Pass VARCHAR (50) NOT NULL,
)
GO

--Login Insert Attempt
INSERT INTO LoginInfo (TraineeID, UserName, Pass) VALUES (@@IDENTITY, 'arosh', '123456');
GO
SELECT * FROM LoginInfo
GO

SELECT @@IDENTITY
GO
-- Test Store Procedure for Inserting in both Trainees And LoginInfo Tables
ALTER PROC sp_TraineeInsertLoginInsert
@traineeID INT,
@traineeName NVARCHAR (50),
@dob DATE,
@gender NVARCHAR (20),
@traineeContact VARCHAR(20),
@email VARCHAR (40),
@university VARCHAR (50),
@cfScore INT,
@preferredCourses NVARCHAR (MAX),
@motivationBehindTheChoice VARCHAR(MAX),
@traineeImage VARCHAR (MAX),
--@courseID INT,
--@courseName VARCHAR (50),
--@tspID INT,
--@tspName VARCHAR (50),
@userName VARCHAR (50),
@pass VARCHAR (50)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO Trainees (TraineeName, DOB, Gender,TraineeContact,Email,University,CFScore,PreferredCourses, MotivationBehindTheChoice, TraineeImage) VALUES (@traineeName, @dob, @gender, @traineeContact, @email, @university, @cfScore, @preferredCourses, @motivationBehindTheChoice, @traineeImage)
			DECLARE @tID INT =  SCOPE_IDENTITY()
			--IF(@traineeID !=NUll)
			INSERT INTO LoginInfo VALUES (@tID, @userName, @pass)
			--ELSE PRINT 'REGISTRATION FAILED'
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'REGISTRATION FAILD'
		END CATCH
END
GO

EXEC sp_TraineeInsertLoginInsert 1, 'Jamal','01/01/1990','Male', '0170000000','jamal@gmail.com','BIUC',87,'C#,Java,Python','I Love Programming','','kamal','123456'
SELECT * FROM LoginInfo
SELECT * FROM Trainees

--Join Attempt

SELECT * FROM Trainees tr
JOIN LoginInfo li
ON tr.TraineeID = li.TraineeID
WHERE li.UserName = 'jamal'


--Store Procedure
DROP PROC sp_TraineeSaveCourseUpdate
GO
CREATE PROC sp_TraineeSaveCourseUpdate
@traineeName NVARCHAR (50),
@dob VARCHAR (MAX),
@gender NVARCHAR(20),
@traineeContact VARCHAR (15),
@email VARCHAR (40),
@selectedCourse NVARCHAR (30),
@courseId INT,
@traineeImage VARCHAR (MAX)
AS
BEGIN
INSERT INTO Trainees(TraineeName,DOB, Gender,TraineeContact,Email,SelectedCourse,CourseID, TraineeImage) VALUES (@traineeName,@dob,@gender,@traineeContact,@email,@selectedCourse, @courseId, @traineeImage)
UPDATE CourseDetails SET SeatAvailability = SeatAvailability - 1
WHERE CourseID =@courseId
END
GO

EXEC sp_TraineeSaveCourseUpdate @traineeName, @dob, gender, trainneContact, email, selectedCourse, courseId, traineeImage

ALTER TABLE Trainees
DROP COLUMN RemainingSeats

DROP TABLE Trainees
DROP TABLE EnrollmentInfo

INSERT INTO Trainees (TraineeName, Gender, TraineeContact, Email) VALUES ('A', 'Male', '01718766666','a@yahoo.com' )
GO

SELECT * FROM Trainees
GO





--ALTER TABLE CourseDetails
--DROP COLUMN TotalSeats



Create TABLE EnrollmentInfo
(
AdmissionSerial INT IDENTITY (20211,1) PRIMARY KEY,
CourseID INT FOREIGN KEY REFERENCES CourseDetails (CourseID) ,
TSPID INT FOREIGN KEY REFERENCES TSPs (TSPID),
TraineeID  INT UNIQUE FOREIGN KEY REFERENCES Trainees (TraineeID) ON UPDATE CASCADE ,
StartDate DATETIME DEFAULT SYSDATETIME ()
);
GO






--Experiment


SELECT * FROM TSPs
GO
SELECT * FROM Trainees
GO

SELECT * FROM TrainerList
GO

SELECT * FROM CourseDetails
GO

DROP TABLE CourseDetails

SELECT * FROM EnrollmentInfo
GO


DROP TABLE TrainerList
DROP TABLE EnrollmentInfo

SELECT CourseID, CourseName FROM TSPs WHERE TSPID = 101