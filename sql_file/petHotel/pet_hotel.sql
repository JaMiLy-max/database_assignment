create database pethotel;

use pethotel;

-- PetOwners 테이블 생성
CREATE TABLE PetOwners (
    ownerID INT PRIMARY KEY,
    name VARCHAR(255),
    contact VARCHAR(255)
);

-- Pets 테이블 생성
CREATE TABLE Pets (
    petID INT PRIMARY KEY,
    ownerID INT,
    name VARCHAR(255),
    species VARCHAR(255),
    breed VARCHAR(255),
    FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);

-- Rooms 테이블 생성
CREATE TABLE Rooms (
    roomID INT PRIMARY KEY,
    roomNumber VARCHAR(255),
    roomType VARCHAR(255),
    pricePerNight INT
);

-- Reservations 테이블 생성
CREATE TABLE Reservations (
    reservationID INT PRIMARY KEY,
    petID INT,
    roomID INT,
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (petID) REFERENCES Pets(petID),
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

-- Services 테이블 생성
CREATE TABLE Services (
    serviceID INT PRIMARY KEY,
    reservationID INT,
    serviceName VARCHAR(255),
    servicePrice INT,
    FOREIGN KEY (reservationID) REFERENCES Reservations(reservationID) on delete cascade
);

/*
alter drop foreign key > alter add foreign key
FOREIGN KEY Option
  1) On Delete 
  v : 부모 데이터 삭제시 자식 데이터도 동시 삭제.
 Set null : 부모 데이터 삭제시 해당되는 자식 데이터의 Columm은  Null 로 처리.
 Set default : 부모 데이터 삭제시 자식 데이터의 Columm은 기본 값(Default) 으로 Update.
 Restrict : 자식 테이블에 데이터가 남아 있는 경우 부모 테이블의 데이터는 삭제 불가.
 
  2) On Update
Cascade : 부모 데이터 수정시 자식 데이터도 동시 수정.
Set null : 부모 데이터 수정시 해당되는 자식 데이터의 Columm은 Null 로 처리.
Set default : 부모 데이터 수정시 자식 데이터의 Columm은 기본 값(Default) 으로 Update. 
Restrict : 자식 테이블에 데이터가 남아 있는 경우 부모 테이블의 데이터는 수정 불가.
*/