-- Parte complicada
--31
select *
from juegos
where Metacritic = (
    select min(Metacritic)
    from juegos
    where Metacritic > 0
) and Metacritic > 0

--32
select *
from juegos
where Metacritic > (
    select avg(cast(Metacritic as decimal(10, 2)))
    from juegos
)

--33
select top (1) *
from juegos
where try_convert(int, releaseDate) = 2008
order by Metacritic desc

--34
select *
from juegos
where PriceFinal > (
    select avg(cast(PriceFinal as decimal(10, 2)))
    from juegos
)

--35
select *
from juegos
where PlatformLinux = 'True'
  and AchievementCount = (
      select max(AchievementCount)
      from juegos
      where PlatformLinux = 'True'
  )