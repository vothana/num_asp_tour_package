USE TourPackage;

CREATE TABLE TBLCATEGORIES (
  CATID INT PRIMARY KEY IDENTITY(1,1),
  CATEGORY NVARCHAR(50) NOT NULL,
);

CREATE TABLE TBLTOURTYPES (
  TYPEID INT PRIMARY KEY IDENTITY(1,1),
  [TYPE] NVARCHAR(50) NOT NULL,
);

CREATE TABLE TBLTOURPACKAGES (
  ID INT PRIMARY KEY IDENTITY(1,1),
  PACKAGENAME NVARCHAR(50),
  TYPEID INT,
  COUNTRY NVARCHAR(50),
  CITY NVARCHAR(50),
  DURATION INT,
  [DESCRIPTION] NVARCHAR(250),
  DESURL NVARCHAR(200),
  IMAGE_URL VARCHAR(200),
  IN_DATE DATETIME,
  USERNAME VARCHAR(50),
  CATID INT,
  FOREIGN KEY (TYPEID) REFERENCES TBLTOURTYPES(TYPEID),
  FOREIGN KEY (CATID) REFERENCES TBLCATEGORIES(CATID)
);

INSERT INTO TBLCATEGORIES (CATEGORY) 
VALUES('Place to visit');

INSERT INTO TBLTOURTYPES ([TYPE]) 
VALUES
('Nature Tour'),
('Advanture Tour'),
('Classic Tour'),
('Traditional Tour');