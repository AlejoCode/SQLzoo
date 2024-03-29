SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
WHERE continent = 'Europe' AND
   gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

SELECT name, continent
FROM world
WHERE continent = 'South America' OR continent  = 'Oceania'
ORDER BY name

SELECT name, population
FROM world 
WHERE population > 35427524 AND population < 38496000

SELECT name, CONCAT(ROUND((population*100)/80716000),'%' ) FROM world WHERE continent = 'Europe'


SELECT name
  FROM world
 WHERE gdp> ALL(SELECT gdp
    FROM world
    WHERE continent = 'Europe' AND gdp > 0)

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name
                  FROM world y
                  WHERE x.continent = y.continent);

SELECT name, continent, population
FROM world
WHERE continent IN (SELECT continent
                    FROM world x
                    WHERE 25000000 >= ALL(SELECT population
                                          FROM world y
                                          WHERE x.continent = y.continent AND population >0));

SELECT name, continent
FROM world x
WHERE population/3 > ALL(SELECT population
                         FROM world y
                         WHERE x.continent = y.continent AND y.name <> x.name);

