-- Consultas del Anexo II en MySQL 8.0 (BD bd/steam-mysql.sql).
-- Las notas (Metacritic) van de 0 a 100; 0 significa "sin nota" y se excluye en medias y mínimos.

-- 1. Lista todas las columnas de la tabla.
-- Comando clave: SELECT *
SELECT * FROM juegos;

-- 2. Lista todos los diferentes géneros, eliminando duplicados.
-- Comando clave: DISTINCT
SELECT DISTINCT Genre FROM juegos;

-- 3. Lista únicamente aquellos juegos que puedan ser jugados únicamente en Linux.
-- Comando clave: WHERE … AND
SELECT Nombre, PlatformLinux, PlatformWindows, PlatformMac FROM juegos
WHERE PlatformLinux = 'True' AND PlatformWindows = 'False' AND PlatformMac = 'False'
ORDER BY Nombre;

-- 4. Lista todos los juegos de rol, ordenados por nota.
-- Comando clave: LIKE + ORDER BY … DESC
SELECT Nombre, Genre, Metacritic FROM juegos
WHERE Genre LIKE '%RPG%'
ORDER BY Metacritic DESC;

-- 5. Lista todos aquellos juegos que puedan ser jugados en Español pero no en Francés.
-- Comando clave: NOT LIKE
SELECT Nombre, SupportedLanguages FROM juegos
WHERE SupportedLanguages LIKE '%Spanish%' AND SupportedLanguages NOT LIKE '%French%'
ORDER BY Nombre;

-- 6. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.
-- Comando clave: Columna calculada con AS
SELECT Nombre, PriceInitial, PriceFinal, PriceInitial - PriceFinal AS Diferencia FROM juegos
ORDER BY Diferencia DESC;

-- 7. ¿Cuántos juegos hay del siglo pasado?
-- Comando clave: COUNT(*) + CAST
SELECT COUNT(*) AS JuegosSigloPasado FROM juegos
WHERE CAST(ReleaseDate AS UNSIGNED) BETWEEN 1900 AND 1999;

-- 8. Devuelve todos los juegos que terminen o en N o en O.
-- Comando clave: LIKE '%n' OR LIKE '%o'
SELECT Nombre FROM juegos
WHERE Nombre LIKE '%n' OR Nombre LIKE '%o';

-- 9. Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.
-- Comando clave: LIKE 'A%'
SELECT Nombre, ControllerSupport FROM juegos
WHERE Nombre LIKE 'A%' AND ControllerSupport = 'True';

-- 10. Devuelve todos aquellos juegos que estén entre el 2000 y el 2010.
-- Comando clave: BETWEEN
SELECT Nombre, ReleaseDate FROM juegos
WHERE CAST(ReleaseDate AS UNSIGNED) BETWEEN 2000 AND 2010
ORDER BY ReleaseDate;

-- 11. Devuelve todos los juegos que sean de la saga Final Fantasy.
-- Comando clave: LIKE '%…%'
SELECT Nombre, ReleaseDate FROM juegos
WHERE Nombre LIKE '%Final Fantasy%';

-- 12. Devuelve todos los juegos que sean de deportes y haya trabajado más de 3 desarrolladores.
-- Comando clave: LIKE + AND >
SELECT Nombre, Genre, DeveloperCount FROM juegos
WHERE Genre LIKE '%Sports%' AND DeveloperCount > 3;

-- 13. ¿Cuántos juegos hay asociados a cada categoría?
-- Comando clave: GROUP BY + COUNT
SELECT Category, COUNT(*) AS NumJuegos FROM juegos
GROUP BY Category
ORDER BY NumJuegos DESC;

-- 14. ¿Cuántos juegos se han sacado en cada año?
-- Comando clave: GROUP BY
SELECT ReleaseDate AS Anio, COUNT(*) AS NumJuegos FROM juegos
GROUP BY ReleaseDate
ORDER BY ReleaseDate;

-- 15. En base a la consulta anterior, devuelve aquellos años en los que la media de puntuación esté entre un 6 y un 8.
-- Comando clave: HAVING
SELECT ReleaseDate AS Anio, ROUND(AVG(Metacritic), 2) AS Media FROM juegos
WHERE Metacritic > 0
GROUP BY ReleaseDate
HAVING AVG(Metacritic) BETWEEN 60 AND 80
ORDER BY ReleaseDate;

-- 16. ¿Cuál es la máxima, mínima y puntuación media por género?
-- Comando clave: MAX, MIN, AVG
SELECT Genre, MAX(Metacritic) AS Maxima, MIN(Metacritic) AS Minima, ROUND(AVG(Metacritic), 2) AS Media
FROM juegos WHERE Metacritic > 0
GROUP BY Genre
ORDER BY Media DESC;

-- 17. Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.
-- Comando clave: LIMIT
SELECT Nombre, ReleaseDate, Metacritic FROM juegos
WHERE ReleaseDate = '2012'
ORDER BY Metacritic DESC
LIMIT 10;

-- 18. Usando LIMIT, devuelve el top 10 de juegos más nuevos de género single player.
-- Comando clave: LIMIT + ORDER BY
SELECT Nombre, ReleaseDate FROM juegos
WHERE Category LIKE '%Single Player%'
ORDER BY CAST(ReleaseDate AS UNSIGNED) DESC
LIMIT 10;

-- 19. Devuelve la media de nota de todos aquellos juegos que sean para mayores de 18 años.
-- Comando clave: AVG
SELECT ROUND(AVG(Metacritic), 2) AS MediaMayores18 FROM juegos
WHERE RequiredAge >= 18 AND Metacritic > 0;

-- 20. ¿Cuántos juegos hay asociados a cada tipo (mayor de 18, de 17…)?
-- Comando clave: GROUP BY + COUNT
SELECT RequiredAge, COUNT(*) AS NumJuegos FROM juegos
GROUP BY RequiredAge
ORDER BY RequiredAge;

-- 21. Devuelve todos aquellos años en los que haya menos de 300 juegos.
-- Comando clave: HAVING COUNT
SELECT ReleaseDate AS Anio, COUNT(*) AS NumJuegos FROM juegos
GROUP BY ReleaseDate
HAVING COUNT(*) < 300
ORDER BY ReleaseDate;

-- 22. Devuelve todos los juegos que estén para Mac pero no para Windows.
-- Comando clave: WHERE … AND
SELECT Nombre, PlatformMac, PlatformWindows FROM juegos
WHERE PlatformMac = 'True' AND PlatformWindows = 'False';

-- 23. Devuelve todos los juegos donde su precio final sea mayor a su precio inicial.
-- Comando clave: Comparar dos columnas
SELECT Nombre, PriceInitial, PriceFinal FROM juegos
WHERE PriceFinal > PriceInitial;

-- 24. Devuelve todos los juegos que no estén valorados en dólares.
-- Comando clave: <>
SELECT Nombre, PriceCurrency FROM juegos
WHERE PriceCurrency <> 'USD';

-- 25. Devuelve todos los juegos que tengan una mayor nota que 0, pero que hayan suspendido.
-- Comando clave: AND con dos condiciones
SELECT Nombre, Metacritic FROM juegos
WHERE Metacritic > 0 AND Metacritic < 50
ORDER BY Metacritic;

-- 26. Devuelve el top 15 de juegos con mayor número de DLC.
-- Comando clave: ORDER BY + LIMIT
SELECT Nombre, DLCCount FROM juegos
ORDER BY DLCCount DESC
LIMIT 15;

-- 27. Devuelve la información de los juegos que sólo se puedan jugar en Inglés.
-- Comando clave: = (igualdad exacta)
SELECT Nombre, SupportedLanguages FROM juegos
WHERE SupportedLanguages = 'English';

-- 28. Devuelve el nombre (en minúscula) y la web (en mayúscula) de los juegos de acción o casuales.
-- Comando clave: LOWER y UPPER
SELECT LOWER(Nombre) AS nombre, UPPER(Website) AS web FROM juegos
WHERE Genre LIKE '%Action%' OR Genre LIKE '%Casual%';

-- 29. ¿Cuál es el juego indie con mayor nota?
-- Comando clave: ORDER BY DESC + LIMIT 1
SELECT Nombre, Genre, Metacritic FROM juegos
WHERE Genre LIKE '%Indie%'
ORDER BY Metacritic DESC
LIMIT 1;

-- 30. ¿Y con menor nota?
-- Comando clave: ORDER BY ASC + LIMIT 1
SELECT Nombre, Genre, Metacritic FROM juegos
WHERE Genre LIKE '%Indie%' AND Metacritic > 0
ORDER BY Metacritic ASC
LIMIT 1;

-- ===== Parte complicada: subconsultas =====

-- 31. Devuelve toda la información del juego con menor nota, siempre que sea mayor a cero.
-- Comando clave: Subconsulta con MIN
SELECT * FROM juegos
WHERE Metacritic = (SELECT MIN(Metacritic) FROM juegos WHERE Metacritic > 0);

-- 32. Devuelve aquellos juegos que tengan mayor nota que la media.
-- Comando clave: Subconsulta con AVG
SELECT Nombre, Metacritic FROM juegos
WHERE Metacritic > (SELECT AVG(Metacritic) FROM juegos WHERE Metacritic > 0)
ORDER BY Metacritic DESC;

-- 33. Devuelve el juego con mayor nota del año 2008.
-- Comando clave: Subconsulta con MAX
SELECT Nombre, ReleaseDate, Metacritic FROM juegos
WHERE ReleaseDate = '2008'
  AND Metacritic = (SELECT MAX(Metacritic) FROM juegos WHERE ReleaseDate = '2008');

-- 34. Devuelve toda la información de los juegos que valgan más que la media.
-- Comando clave: Subconsulta con AVG
SELECT * FROM juegos
WHERE PriceFinal > (SELECT AVG(PriceFinal) FROM juegos);

-- 35. Devuelve toda la información de los juegos de Linux que tengan el mayor número de logros (achievements).
-- Comando clave: Subconsulta con MAX
SELECT * FROM juegos
WHERE PlatformLinux = 'True'
  AND AchievementCount = (SELECT MAX(AchievementCount) FROM juegos WHERE PlatformLinux = 'True');
