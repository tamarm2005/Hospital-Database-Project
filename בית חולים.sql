create table Doctors
(
DoctorCode int identity(200,1) primary key,
D_id nvarchar(20) NOT NULL,
lname nvarchar(20),
fname nvarchar(20) not null,
entranceHour nvarchar (5),
exitHour nvarchar (5),
specialization nvarchar (30) not null,
DepartmentCode int FOREIGN KEY (DepartmentCode)
REFERENCES Departments(DepartmentCode)
)

create table Nurses
(
NurseCode int identity(400,5) primary key,
N_id nvarchar(20) NOT NULL,
lname nvarchar (20),
fname nvarchar (20) not null,
specialization nvarchar (30) not null,
exitHour nvarchar (5),
entranceHour nvarchar (5),
specializationFloor int
)

create table suppliers
(
supplierCode int identity(800,5) primary key,
supplierName nvarchar (20) not null,
deliveryDate date,
deliveryProduct nvarchar (20) not null,
ProductQuantity int,
LandOfImport nvarchar (20) not null
)

CREATE TABLE Diseases 
( 
DiseaseCode INT IDENTITY(1,1) PRIMARY KEY, 
DiseaseName nvarchar(50) NOT NULL UNIQUE, 
DiseaseDescription nvarchar(255) NULL,
)

create table Departments
(
DepartmentCode int identity(1,1) primary key,
DepartmentName nvarchar (20) not null,
WardFloor int,
SpecialistDoctorCode int NULL,
NumberOfRooms int,
NumberOfPatient int,
)

create table Room
(
RoomsCode int identity(1,1) primary key,
numBed int,
numFloor int,
vip bit,
refrigerator bit,
DepartmentCode int null,
CONSTRAINT FK_RoomDepartment FOREIGN KEY (DepartmentCode)
REFERENCES Departments(DepartmentCode)
)

create table MedicalEquipment
(
ProductCode int identity(1000,1) primary key,
QuantityInStock float,
ProductName nvarchar (20) not null,
productPrice float,
LastDeliveryDate date,
supplierCode int null,
CONSTRAINT FK_EquipmentSupplier FOREIGN KEY (supplierCode)
REFERENCES suppliers(supplierCode)
)

CREATE TABLE Patients
(
PatientCode INT IDENTITY(600,5) PRIMARY KEY,
P_id NVARCHAR(20) NOT NULL,
lname NVARCHAR(20),
fname NVARCHAR(20) NOT NULL,
DiseaseCode INT NOT NULL, 
age TINYINT NOT NULL,
AssignedRoomCode INT NULL, 
CONSTRAINT FK_PatientDisease FOREIGN KEY (DiseaseCode) REFERENCES Diseases(DiseaseCode), 
CONSTRAINT FK_PatientRoom FOREIGN KEY (AssignedRoomCode) REFERENCES Room(RoomsCode) 
)

CREATE TABLE treatments
(
TreatmentID INT IDENTITY(1,1) PRIMARY KEY,
SpecialistDoctorCode INT NULL,
ConsumableEquipmentCode INT NULL,
DiseaseCode INT NOT NULL,
TreatmentFloor INT NULL,
costOfTreatment FLOAT NULL,
HealthInsuranceParticipation FLOAT NULL,
CONSTRAINT FK_TreatmentDoctor FOREIGN KEY (SpecialistDoctorCode)
REFERENCES Doctors(DoctorCode),
CONSTRAINT FK_TreatmentEquipment FOREIGN KEY (ConsumableEquipmentCode)
REFERENCES MedicalEquipment(ProductCode),

CONSTRAINT FK_TreatmentDisease FOREIGN KEY (DiseaseCode)
REFERENCES Diseases(DiseaseCode)
)

create table Salary
(
EmployeeID nvarchar(20) PRIMARY KEY,
EmployeeType nvarchar(10) NOT NULL,
DoctorCode INT ,
NurseCode INT ,
hourSalary FLOAT NULL,
monthSalary float NULL,
numHour int NULL,
deductions float NULL,
bonus float NULL,
CONSTRAINT FK_SalaryDoctor FOREIGN KEY (DoctorCode)
REFERENCES Doctors(DoctorCode),
CONSTRAINT FK_SalaryNurse FOREIGN KEY (NurseCode)
REFERENCES Nurses(NurseCode),
 )


insert into doctors (D_id, lname, fname, entranceHour, exitHour, specialization)
values ('323232323', 'יצחק' ,'לוי', '08:00', '16:00', 'אף אוזן גרון'),
       ('303030303', 'אברהם' ,'כהן', '09:00', '17:00', 'ראות'),
       ('313131313', 'שמעון' ,'כהן', '16:00', '00:00', 'מח'),
	   ('334433553', 'יעקב' ,'ישראלי', '17:30', '23:30', 'אורטופד')
insert into nurses (N_id, lname, fname, specialization, exitHour, entranceHour, specializationFloor)
values ('505050505','ילין','דור','אף אוזן גרון','12:00','20:00',2),
       ('515151515','דורון','גורן','כירוגיה','09:30','22:00',3),
	   ('525252525','גלית','וייס','נירולוג','08:00','00:00',1),
	   ('535353535','ארז','זית','כירופרקט','11:00','21:30',2)
insert into suppliers (supplierName, deliveryProduct, ProductQuantity, LandOfImport)
values ('איגור', 'אינפוזיה', 100, 'גרמניה'),
       ('ציקו', 'מחטי אינפוזיה', 1500 , 'סין'),
	   ('דור', 'חומר גבס', 500, 'ארצות הברית'),
	   ('גקוב', 'מבחנות', 2500, 'גרמניה')
INSERT INTO Diseases (DiseaseName, DiseaseDescription)
VALUES ('שפעת', 'מחלת חום נפוצה.'),
       ('ראות', 'מחלה נשימתית.'),
       ('דלקת אוזניים', 'זיהום באוזן.'),
       ('כוויות', 'פגיעה בעור מחום/כימיקלים.');
insert into Departments (DepartmentName,WardFloor,SpecialistDoctorCode,NumberOfRooms,NumberOfPatient)
values ('פנימית',2,200,25,29),
       ('מיון',1,201,30,40),
	   ('ילדים',3,202,30,35),
	   ('טיפול נמרץ', 1,203,20,29)
insert into room (numBed, numFloor, vip, refrigerator)
values (3, 2 ,0, 1),
       (3, 3 ,0, 0),
	   (2, 2 ,1, 1),
	   (1, 1 ,1, 1)
insert into MedicalEquipment (QuantityInStock,ProductName,productPrice,LastDeliveryDate)
values (1.5,'מזרקים', 5,'06-03-2024'),
       (0.2,'מחטים', 2,'06-03-2024'),
	   (2.8,'תחבושות', 3,'06-03-2024'),
	   (120.5,'מד לחץ דם', 90,'06-03-2023')
INSERT INTO Patients (P_id, DiseaseCode, fname, lname, age)
VALUES ('404040404', 2, 'יעל', 'כהן', 77),
       ('414141414', 1, 'רחל', 'לוי', 67), 
       ('424242424', 3, 'רבקה', 'כץ', 91),
       ('434343434', 4, 'משה', 'אברהם', 89); 
INSERT INTO treatments (SpecialistDoctorCode, ConsumableEquipmentCode, DiseaseCode, TreatmentFloor, costOfTreatment, HealthInsuranceParticipation)
VALUES (200, 1000, 2, 2, 300, 50),
       (201, 1001, 3, 1, 500, 80), 
       (202, 1002, 1, 2, 250, 30), 
       (203, 1003, 4, 3, 400, 60); 
insert into salary (EmployeeID, EmployeeType, DoctorCode, hourSalary, monthSalary, numHour, deductions, bonus)
values ('D200', 'רופא', 200, 55, 10000, 180, 1000, 200), 
       ('N400', 'אחות', NULL, 60, 12000, 200, 1200, 300),
	   ('D201', 'רופא', 201, 55, 10000, 190, 1000, 250),
	   ('N401', 'אחות', NULL, 70, 15000, 210, 1500, 400)

select * from Doctors
select * from Nurses
select * from suppliers
select * from Diseases
select * from Departments
select * from Room
select * from MedicalEquipment
select * from Patients
select * from treatments
select * from Salary

--מזניק (Trigger)

DROP TRIGGER IF EXISTS trg_UpdateMedicalEquipmentStock;
GO

CREATE TRIGGER trg_UpdateMedicalEquipmentStock
ON suppliers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ME
    SET QuantityInStock = ME.QuantityInStock + I.ProductQuantity
    FROM MedicalEquipment AS ME
    JOIN inserted AS I ON ME.ProductName = I.deliveryProduct;

    PRINT 'מזניק: מלאי ציוד רפואי עודכן בעקבות קבלת אספקה חדשה.';
END;
GO

-- --- דוגמאות לבדיקת המזניק ---

PRINT '--- בדיקת המזניק: עדכון מלאי ציוד רפואי ---';

SELECT ProductCode, ProductName, QuantityInStock
FROM MedicalEquipment
WHERE ProductName = 'מזרקים';

INSERT INTO suppliers (supplierName, deliveryDate, deliveryProduct, ProductQuantity, LandOfImport)
VALUES ('איגור', GETDATE(), 'מזרקים', 50, 'ישראל');

SELECT ProductCode, ProductName, QuantityInStock
FROM MedicalEquipment
WHERE ProductName = 'מזרקים';

PRINT '--- בדיקה נוספת: מוצר שלא קיים במלאי ---';
INSERT INTO suppliers (supplierName, deliveryDate,
deliveryProduct,ProductQuantity, LandOfImport)
VALUES ('חדש ספק', GETDATE(), 'כפפות', 200, 'סין');

SELECT ProductCode, ProductName, QuantityInStock
FROM MedicalEquipment
WHERE ProductName = 'כפפות';

--אילוצים 
--1.
ALTER TABLE Doctors ADD CONSTRAINT UQ_DoctorID UNIQUE (D_id);

--2.
ALTER TABLE nurses ADD CONSTRAINT UQ_NursesrID UNIQUE (N_id);

--3.
ALTER TABLE patients ADD CONSTRAINT UQ_PatientsID UNIQUE (P_id);

--4.
ALTER TABLE Doctors ALTER COLUMN lname nvarchar(20) NOT NULL;

--5.
ALTER TABLE nurses ALTER COLUMN lname nvarchar(20) NOT NULL;

--6.
ALTER TABLE patients ALTER COLUMN lname nvarchar(20) NOT NULL;

--7.
ALTER TABLE Patients ADD CONSTRAINT CK_PatientAge CHECK (age > 0);

--8.
ALTER TABLE Room ADD CONSTRAINT DF_RoomVIP DEFAULT 0 FOR vip;

--9.
ALTER TABLE Room ADD CONSTRAINT DF_RoomRefrigerator DEFAULT 0 FOR refrigerator;

--10.
ALTER TABLE Salary ADD CONSTRAINT CK_SalaryMonth CHECK (monthSalary BETWEEN 5000 AND 30000);

--11.
ALTER TABLE Salary ADD CONSTRAINT CK_SalaryHour CHECK (hourSalary BETWEEN 30 AND 200);

-- שאילתות

--1
select [lname] 
from Doctors d join Salary s on d.D_id= s.EmployeeID 
WHERE s.EmployeeType = 'רופא'
group by [lname] 
having avg ([bonus])>300;

--2
SELECT P.lname, P.fname, SUM(T.costOfTreatment * 0.9) AS TotalCostAfterInsurance
FROM Patients AS P JOIN treatments AS T ON P.DiseaseCode = T.DiseaseCode 
WHERE P.age > 40
GROUP BY P.PatientCode, P.lname, P.fname, P.age 
HAVING SUM(T.costOfTreatment * 0.9) > 250;

--3
update rooms
set vip=1
where numBed=1 and refrigerator=1

--4
SELECT fname, lname, 'רופא' AS JobTitle, exitHour
FROM Doctors
WHERE exitHour > '20:00'
UNION ALL
SELECT fname, lname, 'אחות' AS JobTitle, exitHour
FROM Nurses
WHERE exitHour > '20:00';

--5
SELECT p.fname, p.lname, p.age, d.DiseaseName
FROM Patients AS p
JOIN Diseases AS d ON p.DiseaseCode = d.DiseaseCode 
WHERE p.age > 80;

--6
SELECT Dp.DepartmentName, Dp.NumberOfRooms, Dr.fname AS SpecialistFirstName, Dr.lname AS SpecialistLastName
FROM Departments AS Dp
JOIN Doctors AS Dr ON Dp.SpecialistDoctorCode = Dr.DoctorCode
WHERE Dp.NumberOfRooms > 25;

--7
SELECT supplierName, deliveryProduct, ProductQuantity
FROM suppliers
WHERE LandOfImport = 'גרמניה' AND ProductQuantity > 1000;

--8
SELECT ProductName, QuantityInStock, productPrice, LastDeliveryDate
FROM MedicalEquipment
WHERE LastDeliveryDate < DATEADD(month, -6, GETDATE())
ORDER BY LastDeliveryDate ASC;


--טבלה מדומה
DROP VIEW Name_Patients;

CREATE VIEW Name_Patients(lname, fname, DiseaseName, DoctorCode)
AS SELECT P.lname, P.fname, D_Name.DiseaseName, Dr.DoctorCode 
FROM Patients AS P INNER JOIN Diseases AS D_Name 
ON P.DiseaseCode = D_Name.DiseaseCode
INNER JOIN treatments AS T 
ON P.DiseaseCode = T.DiseaseCode 
INNER JOIN Doctors AS Dr 
ON Dr.DoctorCode = T.SpecialistDoctorCode
GROUP BY P.PatientCode, P.lname, P.fname, D_Name.DiseaseName, Dr.DoctorCode; 

--פונקציה

DROP FUNCTION IF EXISTS GetPatientDisease;
GO
CREATE FUNCTION GetPatientDisease (@patientCode INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @diseaseName NVARCHAR(50); 
    SELECT @diseaseName = D.DiseaseName
    FROM Patients AS P
    JOIN Diseases AS D ON P.DiseaseCode = D.DiseaseCode 
    WHERE P.PatientCode = @patientCode;
    RETURN @diseaseName;
END;
GO

SELECT dbo.GetPatientDisease(600) AS PatientDisease;

SELECT PatientCode, fname, lname, dbo.GetPatientDisease(PatientCode) 
AS DiseaseNameByFunction
FROM Patients;


--פרוצדורות

--1
DROP PROCEDURE UpdateDoctorBonus

CREATE PROCEDURE UpdateDoctorBonus
    @doctorCode INT,
    @bonusIncreaseAmount FLOAT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Doctors WHERE DoctorCode = @doctorCode)
    BEGIN
        UPDATE Salary
        SET bonus = bonus + @bonusIncreaseAmount
        WHERE DoctorCode = @doctorCode AND EmployeeType = 'רופא';

        PRINT 'בונוס הרופא עודכן בהצלחה.';
    END
    ELSE
    BEGIN
        PRINT 'קוד הרופא אינו קיים.';
    END
END;
GO

EXEC UpdateDoctorBonus @doctorCode = 200, @bonusIncreaseAmount = 50;


EXEC UpdateDoctorBonus @doctorCode = 999, @bonusIncreaseAmount = 20;


SELECT D.fname, D.lname, S.bonus
FROM Doctors AS D
JOIN Salary AS S ON D.DoctorCode = S.DoctorCode
WHERE D.DoctorCode = 200;

--2
DROP PROCEDURE AddMedicalEquipment


CREATE PROCEDURE AddMedicalEquipment
    @quantity INT,
    @productName NVARCHAR(20),
    @productPrice FLOAT,
    @lastDeliveryDate DATE,
    @supplierCode INT = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM MedicalEquipment WHERE ProductName = @productName)
    BEGIN
        PRINT 'מוצר בשם זה כבר קיים. אנא השתמש/י בעדכון כמות.';
        RETURN;
    END

    INSERT INTO MedicalEquipment (QuantityInStock, ProductName, productPrice, LastDeliveryDate, supplierCode)
    VALUES (@quantity, @productName, @productPrice, @lastDeliveryDate, @supplierCode);

    PRINT 'הציוד הרפואי נוסף בהצלחה.';
END;
GO

EXEC AddMedicalEquipment @quantity = 50, @productName = 'מסיכות N95', @productPrice = 12.50,
@lastDeliveryDate = '2025-05-20', @supplierCode = 800;

EXEC AddMedicalEquipment @quantity = 10, @productName = 'אלונקות', @productPrice = 500.00, @lastDeliveryDate = '2025-05-22';

SELECT * FROM MedicalEquipment WHERE ProductName IN ('מסיכות N95', 'אלונקות','חיטוי');


--3
DROP PROCEDURE IF EXISTS GetDepartmentDoctors;


CREATE PROCEDURE GetDepartmentDoctors
    @DepartmentName NVARCHAR(20)
AS
BEGIN
    SELECT D.fname, D.lname, D.specialization, D.entranceHour, D.exitHour
    FROM
        Doctors AS D
    JOIN
        Departments AS Dep ON D.DoctorCode = Dep.SpecialistDoctorCode 
    WHERE
        Dep.DepartmentName = @DepartmentName;
END;
GO

EXEC GetDepartmentDoctors @DepartmentName = 'פנימית';

EXEC GetDepartmentDoctors @DepartmentName = 'מיון';


--4
DROP PROCEDURE IF EXISTS AdmitPatient;
GO

CREATE PROCEDURE AdmitPatient
    @P_id NVARCHAR(20), @lname NVARCHAR(20), @fname NVARCHAR(20),@DiseaseCode INT, @age TINYINT, @DepartmentCode INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @AssignedRoomCode INT;
    DECLARE @PatientCode INT;
    DECLARE @CurrentNumPatients INT;
    DECLARE @DiseaseName NVARCHAR(50);
    BEGIN TRY
        BEGIN TRANSACTION;
        SELECT TOP 1 @AssignedRoomCode = R.RoomsCode
        FROM Room AS R
        WHERE R.DepartmentCode = @DepartmentCode
          AND NOT EXISTS (SELECT 1 FROM Patients WHERE AssignedRoomCode = R.RoomsCode);
        IF @AssignedRoomCode IS NULL
        BEGIN
            RAISERROR('אין חדרים פנויים במחלקה זו. לא ניתן לאשפז את המטופל.', 16, 1);
        END
        SELECT @DiseaseName = DiseaseName FROM Diseases WHERE DiseaseCode = @DiseaseCode;
        IF @DiseaseName IS NULL
        BEGIN
            RAISERROR('קוד המחלה אינו קיים במערכת. אנא ודא/י קוד מחלה תקין.', 16, 1);
        END

        INSERT INTO Patients (P_id, lname, fname, DiseaseCode, age, AssignedRoomCode) 
        VALUES (@P_id, @lname, @fname, @DiseaseCode, @age, @AssignedRoomCode); 
        SET @PatientCode = SCOPE_IDENTITY();
        SELECT @CurrentNumPatients = NumberOfPatient
        FROM Departments
        WHERE DepartmentCode = @DepartmentCode;
        UPDATE Departments
        SET NumberOfPatient = @CurrentNumPatients + 1
        WHERE DepartmentCode = @DepartmentCode;

        COMMIT TRANSACTION;
        PRINT 'המטופל ' + @fname + ' ' + @lname + ' עם מחלת ' + @DiseaseName +
        ' אושפז בהצלחה בחדר ' + CAST(@AssignedRoomCode AS NVARCHAR(10)) + '.';

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;
        PRINT 'שגיאה באשפוז מטופל: ' + ERROR_MESSAGE();
    END CATCH
  END;
  GO


SELECT * FROM Patients WHERE AssignedRoomCode = 1;

SELECT NumberOfPatient FROM Departments WHERE DepartmentCode = 1; 

EXEC AdmitPatient @P_id = '444444444', @lname = 'כהן', @fname = 'דוד',
@DiseaseCode = 1, @age = 55, @DepartmentCode = 1;


--5
DROP PROCEDURE IF EXISTS DischargePatient;



CREATE PROCEDURE DischargePatient
    @PatientCode INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @AssignedRoomCode INT;
    DECLARE @DepartmentCode INT;
    DECLARE @CurrentNumPatients INT;
    BEGIN TRY
        BEGIN TRANSACTION;
        SELECT
            @AssignedRoomCode = P.AssignedRoomCode,
            @DepartmentCode = R.DepartmentCode
        FROM Patients AS P
        JOIN Room AS R ON P.AssignedRoomCode = R.RoomsCode
        WHERE P.PatientCode = @PatientCode;
        IF @AssignedRoomCode IS NULL OR @DepartmentCode IS NULL
        BEGIN
            RAISERROR('המטופל אינו משויך לחדר או למחלקה, או שקוד המטופל אינו קיים.', 16, 1);
        END

        UPDATE Patients
        SET AssignedRoomCode = NULL 
        WHERE PatientCode = @PatientCode;

        SELECT @CurrentNumPatients = NumberOfPatient
        FROM Departments
        WHERE DepartmentCode = @DepartmentCode;

        UPDATE Departments
        SET NumberOfPatient = @CurrentNumPatients - 1
        WHERE DepartmentCode = @DepartmentCode;

        COMMIT TRANSACTION;
        PRINT 'המטופל שוחרר בהצלחה מחדר ' + CAST(@AssignedRoomCode AS NVARCHAR(10)) +
		' מהמחלקה ' + CAST(@DepartmentCode AS NVARCHAR(10)) + '.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'שגיאה בשחרור מטופל: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

SELECT * FROM Patients WHERE P_id = '444444444';

EXEC DischargePatient @PatientCode = 620; 

SELECT NumberOfPatient FROM Departments WHERE DepartmentCode = 1;

EXEC DischargePatient @PatientCode = 979;

