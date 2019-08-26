SELECT matchid, player FROM goal 
  WHERE teamid LIKE 'GER'

  SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE goal.teamid = 'GER'

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE goal.player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

 SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

SELECT player FROM game JOIN goal ON(id=matchid) 
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT goal.player FROM goal JOIN game ON(id=matchid) 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';


SELECT teamname, COUNT(player) FROM eteam JOIN goal ON(id=teamid)
GROUP BY teamname;

SELECT stadium,  COUNT(player)  FROM game JOIN goal ON(id=matchid)
GROUP BY stadium;

SELECT game.id, game.mdate, COUNT(teamid) AS goals FROM game
JOIN goal ON game.id = goal.matchid
WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY game.id, game.mdate
ORDER BY game.id;

SELECT matchid, mdate, COUNT(player)  FROM goal 
JOIN game ON(matchid=id)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

SELECT mdate, team1,
SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate, matchid, team1, team2

