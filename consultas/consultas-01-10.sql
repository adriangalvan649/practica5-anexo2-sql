--1
select *
from juegos

--2
select genre
from juegos
group by genre

--3
select *
from juegos
where PlatformLinux = 'True'
  and PlatformWindows = 'False'
  and PlatformMac = 'False'
order by nombre ASC

--4
select *
from juegos
where genre like '%RPG%'
order by Metacritic desc

--5
select *
from juegos
where SupportedLanguages like '%Spanish%' and SupportedLanguages not like '%French%'
order by nombre ASC

--6
select nombre, priceInitial, priceFinal, (priceInitial - priceFinal) as priceDifference
from juegos
order by priceDifference DESC

--7
select *, try_convert(int, releaseDate) as releaseYear
from juegos
where try_convert(int, releaseDate) < 2000
order by releaseYear desc

--8
select *
from juegos
where nombre like '%N' or nombre like '%O'

--9
select *
from juegos
where nombre like 'A%' and ControllerSupport = 'True'

--10
select *
from juegos
where try_convert(int, releaseDate) between 2000 and 2010

