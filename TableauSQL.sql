/*
Queries used for Tableau Project
*/



-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths_csv_csv
--Where location like '%India%'
where continent != ''
--Group By date
order by total_cases , total_deaths 


-- 2. 

-- We take these out as they are not inluded in the above query and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths_csv_csv
--Where location like '%India%'
Where continent = ''
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.


Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max(cast(total_cases as float)/population)*100 as PercentPopulationInfected
From CovidDeaths_csv_csv
--Where location like '%India%'
Group by Location, Population
order by PercentPopulationInfected desc

-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max(cast(total_cases as float)/population)*100 as PercentPopulationInfected
From CovidDeaths_csv_csv
--Where location like '%India%'
Group by Location, Population, date
order by PercentPopulationInfected desc


