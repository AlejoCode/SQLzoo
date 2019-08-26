SELECT COUNT(*)
FROM stops

SELECT id
FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name
FROM stops
    JOIN route ON id=stop
WHERE company = 'LRT' AND num=4


SELECT company, num, COUNT(*) AS visits
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING visits=2

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149


SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name = 'London Road'


SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company =b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'

SELECT DISTINCT a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'


SELECT stopa.name, a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'


SELECT DISTINCT to_craiglockhart.num, to_craiglockhart.company, to_craiglockhart.transfer_stop, to_sighthill.num, to_sighthill.company
FROM (SELECT stopa.name AS transfer_stop, a.company, a.num, stopb.name
	  FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
	  JOIN stops stopa ON (a.stop = stopa.id)
	  JOIN stops stopb ON (b.stop = stopb.id)
	  WHERE stopb.name = 'Craiglockhart') to_craiglockhart
JOIN (SELECT stopa.name AS transfer_stop, a.company, a.num, stopb.name
	  FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
	  JOIN stops stopa ON (a.stop = stopa.id)
	  JOIN stops stopb ON (b.stop = stopb.id)
	  WHERE stopb.name = 'Sighthill') to_sighthill
ON to_craiglockhart.transfer_stop = to_sighthill.transfer_stop
ORDER BY CAST(to_craiglockhart.num AS int)