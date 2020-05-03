CREATE DATABASE kstds;

USE kstds;

SHOW TABLES;
----------------------------------------------------



-- !! order of executing these does not matter !! --
-- done
CREATE TABLE Department ( 
  deptID int not null, 
  codet varchar(255), 
  name varchar(255), 
   
  primary key (deptID) 
);

-- done
CREATE TABLE Category ( 
  catID int not null, 
  name varchar(255), 
  descc varchar(255), 
   
  primary key (catID) 
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
CREATE TABLE Team ( 
  teamID int not null, 
  name varchar(255), 
   
  primary key (teamID) 
);

-- done
CREATE TABLE Tournament ( 
  torID int not null, 
  name varchar(255), 
  startDate date, 
  endDate date, 
  primary key (torID) 
);

-- done
CREATE TABLE contactType ( 
  contTypeID int not null, 
  name varchar(255), 
  descc varchar(255), 
   
  primary key (contTypeID) 
);
 

-- !! Now order matters !! --

-- done
CREATE TABLE Type ( 
  typeID int not null, 
  catID int not null, 
  name varchar(255), 
   
  primary key (typeID), 
  foreign key (catID) references Category(catID) 
);

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
CREATE TABLE Refree ( 
 RefreeID int,
 kfupmID int,
 
  PRIMARY KEY(RefreeID), 
  foreign key (kfupmid) references Actor(kfupmid) 
);

-- done
CREATE TABLE Players(
  playerID int,
  playerNumber int,
  kfupmID int,
  goalsId int,
  goalsTotal int,
  
 
  PRIMARY KEY(playerID), 
  foreign key (kfupmid) references Actor(kfupmid)
);



CREATE TABLE PlayerTeams(
  torId int,
  teamId int,
  playerId int,
  teamLeader int,

  foreign key (torId) references Tournament(torId),
  foreign key (teamId) references Team(teamId),
  foreign key (playerId) references Players(playerId)
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
CREATE TABLE Contact ( 
  kfupmID int not null, 
  contTypeID int not null, 
  valuec varchar(255), 
   
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (contTypeID) references contactType(contTypeID) 
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
CREATE TABLE MatchActor ( 
  matchID int not null, 
  kfupmID int not null, 
  typeID int not null, 
   
  foreign key (matchID) references Matcht(matchID),
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (typeID) references Type(typeID) 
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
CREATE TABLE Goals(
  goalsId int,
  matchID int,
  torID int,
  playerID int,
  timeOfGoal varchar(255),
  
  
  PRIMARY KEY(goalsId), 
  foreign key (playerID) references Players(playerID),
  foreign key (torID) references Tournament(torID),
  foreign key (matchID) references Matcht(matchID)
 
);
ALTER TABLE Players
ADD FOREIGN KEY (goalsId) references Goals(goalsId);


-- done
CREATE TABLE TorActor ( 
  torID int not null, 
  kfupmID int not null, 
  teamID int not null, 
  typeID int not null, 
   
  PRIMARY KEY (torID, kfupmID, teamID, typeID),
  foreign key (torID) references Tournament(torID), 
  foreign key (kfupmID) references Actor(kfupmID), 
  foreign key (teamID) references Team(teamID), 
  foreign key (typeID) references Type(typeID) 
);








-- to drop all tables if needed
SELECT concat('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'kstds';


SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `actor`;
DROP TABLE IF EXISTS `cards`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `contact`;
DROP TABLE IF EXISTS `contacttype`;
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `eventt`;
DROP TABLE IF EXISTS `fieldt`;
DROP TABLE IF EXISTS `goals`;
DROP TABLE IF EXISTS `matchactor`;
DROP TABLE IF EXISTS `matcht`;
DROP TABLE IF EXISTS `players`;
DROP TABLE IF EXISTS `playerteams`;
DROP TABLE IF EXISTS `refree`;
DROP TABLE IF EXISTS `team`;
DROP TABLE IF EXISTS `toractor`;
DROP TABLE IF EXISTS `tournament`;
DROP TABLE IF EXISTS `type`;
SET FOREIGN_KEY_CHECKS = 1;
