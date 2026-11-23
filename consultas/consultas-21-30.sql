--21
select try_convert(int, releaseDate) as releaseYear, count(*) as numeroJuegos
from juegos
group by try_convert(int, releaseDate)
having count(*) < 300

--22
select *
from juegos
where PlatformMac = 'True' and PlatformWindows = 'False'

--23
select *
from juegos
where PriceFinal > PriceInitial

--24
select *
from juegos
where PriceCurrency <> 'USD'

--25
select *
from juegos
where Metacritic > 0 and Metacritic < 50

--26
select top (15) *
from juegos
order by DLCCount desc

--27
select *
from juegos
where SupportedLanguages = 'English'

--28
select lower(nombre) as nombre, upper(Website) as web
from juegos
where genre like '%Action%' or genre like '%Casual%'

--29
select top (1) *
from juegos
where genre like '%Indie%'
order by Metacritic desc

--30
select top (1) *
from juegos
where genre like '%Indie%'
order by Metacritic asc

