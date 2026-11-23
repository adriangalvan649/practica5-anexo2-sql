--11
select *
from juegos
where nombre like '%Final Fantasy%'

--12
select *
from juegos
where genre like '%sports%' and DeveloperCount > 3

--13
select Category, count(*) as numeroJuegos
from juegos
group by Category

--14
select try_convert(int, releaseDate) as releaseYear, count(*) as numeroJuegos
from juegos
group by try_convert(int, releaseDate)

--15
select try_convert(int, releaseDate) as releaseYear,
       avg(cast(Metacritic as decimal(10, 2))) as mediaPuntuacion
from juegos
group by try_convert(int, releaseDate)
having avg(cast(Metacritic as decimal(10, 2))) between 60 and 80

--16
select genre,
       max(Metacritic) as puntuacionMaxima,
       min(Metacritic) as puntuacionMinima,
       avg(cast(Metacritic as decimal(10, 2))) as puntuacionMedia
from juegos
group by genre

--17
select top (10) *
from juegos
where try_convert(int, releaseDate) = 2012
order by Metacritic desc

--18
select top (10) *
from juegos
where Category like '%Single Player%'
order by try_convert(int, releaseDate) desc

--19
select avg(cast(Metacritic as decimal(10, 2))) as mediaPuntuacion
from juegos
where RequiredAge >= 18

--20
select RequiredAge, count(*) as numeroJuegos
from juegos
group by RequiredAge

