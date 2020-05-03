CREATE DATABASE kstds;

USE kstds;

SHOW TABLES;

-- TABLEs
-- done
CREATE TABLE Actor ( 
  kfupmID int not null, 
  fName varchar(255), 
  lName varchar(255), 
  deptID int not null, 
  typeID int not null, 
   
  primary key (kfupmID), 
  foreign key (deptID) references Department(deptID), 
  foreign key (typeID) references type(typeID) 
);

-- done
CREATE TABLE Cards(
  cardID int,
  playerID int,
  cardType varchar(255),
  cardDescription varchar(255),
  
  
  PRIMARY KEY(cardID), 
  foreign key (playerID) references Players(playerID)
 
);

-- done
CREATE TABLE Category ( 
  catID int not null, 
  name varchar(255), 
  descc varchar(255), 
   
  primary key (catID) 
);

-- done
CREATE TABLE Contact ( 
  kfupmID int not null, 
  contTypeID int not null, 
  valuec varchar(255), 
   
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (contTypeID) references contactType(contTypeID) 
);

-- done
CREATE TABLE Department ( 
  deptID int not null, 
  codet varchar(255), 
  name varchar(255), 
   
  primary key (deptID) 
);

-- done
CREATE TABLE Eventt ( 
  matchID int not null, 
  kfupmID int not null, 
  typeID int not null, 
  timec int, 
   
  foreign key (matchID) references Matcht(matchID), 
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (typeID) references Type(typeID) 
);

-- done
CREATE TABLE Fieldt ( 
  fieldID int not null, 
  name varchar(255), 
  descc varchar(255), 
  Avalible Boolean,
   
  primary key (fieldID) 
);

-- done
CREATE TABLE Goals(
  matchID int,
  torID int,
  playerID int,
  timeOfGoal varchar(255),
  
  
  PRIMARY KEY(matchID, torID, playerID), 
  foreign key (playerID) references Players(playerID),
  foreign key (torID) references Tournament(torID),
  foreign key (matchID) references Matcht(matchID)
 
);

-- done
CREATE TABLE MatchActor ( 
  matchID int not null, 
  kfupmID int not null, 
  typeID int not null, 
   
  foreign key (matchID) references Matcht(matchID),
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (typeID) references Type(typeID) 
);

-- done
CREATE TABLE Matcht ( 
  matchID int not null, 
  team1ID int not null, 
  team2ID int not null, 
  fieldID int not null, 
  datet date, 
  timec int, 
  team1Goals int, 
  team2Goals int, 
 refreeid int,
   
  primary key (matchID), 
  foreign key (team1ID) references Team(teamID), 
  foreign key (team2ID) references Team(teamID), 
  foreign key (fieldID) references Fieldt(fieldID),
    foreign key (refreeid) references Refree(refreeid) 

);

-- done
CREATE TABLE Players(
  playerID int,
  playerNumber int,
  kfupmID int,
  
 
   PRIMARY KEY(playerID), 
  foreign key (kfupmid) references Actor(kfupmid)
 
);

-- done
CREATE TABLE Refree ( 
 RefreeID int,
 kfupmID int,
 
   PRIMARY KEY(RefreeID), 
  foreign key (kfupmid) references Actor(kfupmid) 
);

-- done
CREATE TABLE Team ( 
  teamID int not null, 
  name varchar(255), 
   
  primary key (teamID) 
);

-- done
CREATE TABLE TorActor ( 
  torID int not null, 
  kfupmID int not null, 
  teamID int not null, 
  typeID int not null, 
   
  foreign key (torID) references Tournament(torID), 
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (teamID) references Team(teamID), 
  foreign key (typeID) references Type(typeID) 
);
-- a fix for the above table
ALTER TABLE TorActor
ADD PRIMARY KEY (torID, kfupmID, teamID, typeID);

-- done
CREATE TABLE Tournament ( 
  torID int not null, 
  name varchar(255), 
  startDate date, 
  endDate date, 
  primary key (torID) 
);

-- done
CREATE TABLE Type ( 
  typeID int not null, 
  catID int not null, 
  name varchar(255), 
   
  primary key (typeID), 
  foreign key (catID) references Category(catID) 
);

-- done
CREATE TABLE contactType ( 
  contTypeID int not null, 
  name varchar(255), 
  descc varchar(255), 
   
  primary key (contTypeID) 
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
