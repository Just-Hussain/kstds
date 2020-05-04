-- R 1 --??????--







-- R 2  -- DONE --
SELECT fname, lname
FROM Actor
WHERE kfupmID in (
  SELECT kfupmID
  FROM Players
  WHERE goalsTotal > 2
);


-- R 3 -- DONE --
SELECT 
M.matchID AS id,
M.datet AS date,
M.team1Goals AS goals1,
M.team2Goals AS goals2,
M.refreeid AS referee,
F.name AS field,
T1.name AS team1,
T1.teamID AS team1ID,
T2.teamID AS team2ID,  
T2.name AS team2
FROM Matcht AS M
JOIN Fieldt F ON M.fieldid = F.fieldID
JOIN Team T1 ON M.team1id = T1.teamID
JOIN Team T2 ON M.team2id = T2.teamID;

-- R 3 helper -- DONE --
SELECT P.playerid, A.fname, A.lname
FROM PlayerTeams as PT
Join Players P on PT.playerid = P.playerid
JOIN Actor A ON P.kfupmid = A.kfupmID
WHERE PT.teamid = 1;


-- FOR R 5 used with R 3
SELECT fname
FROM actor
WHERE kfupmid in (
  SELECT kfupmID
  FROM refree
  WHERE RefreeID = 17
)


-- R 4 -- DONE --
SELECT fname, lname
FROM Actor
WHERE kfupmid in (
  SELECT kfupmid
  FROM Players
  WHERE playerid in (
    SELECT playerid
	  FROM PlayerTeams
	  WHERE teamid in (
  		SELECT team1id
  		FROM Matcht
  		WHERE matchid = 2
    )
  )
);




SELECT * from Matcht;
SELECT * from Team;
SELECT * from fieldt;
SELECT * from refree;
SELECT * from goals;
SELECT * from players;
SELECT * from cards;
SELECT * from playerteams;



