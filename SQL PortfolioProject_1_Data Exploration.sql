

select *
from PortfolioProject1..CovidDeaths
order by 3,4


select *
from PortfolioProject1..CovidVaccinations
order by 3,4



Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject1..CovidDeaths
order by 1,2




--total case vs total deaths

Select location, date, total_cases,total_deaths, (CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS DeathPercentage
from PortfolioProject1..covidDeaths
where location like '%canada%'
order by 1,2



--total case vs total deaths -- my way

Select location, date, total_cases,total_deaths, (cast(total_deaths as float) / cast (total_cases as float)) * 100 AS DeathPercentage
from PortfolioProject1..covidDeaths
where location like '%canada%'
order by 1,2




--total case vs total population

Select location, date, total_cases,population, (total_cases / population) * 100 AS AffectedPercentage
from PortfolioProject1..covidDeaths
where location like '%canada%'
order by 1,2



--Countries with highest infection rate

Select location, population, max(total_cases) as HighestInfectionCount, max((total_cases / population)) * 100 AS AffectedPercentage
from PortfolioProject1..CovidDeaths
--where location like '%canada%'
Group by location, population 
order by AffectedPercentage desc




-- Countries with highest death

Select location,  max(cast(total_deaths as int)) as TotalDeath
from PortfolioProject1..CovidDeaths
--where location like '%canada%'
Group by location 
order by TotalDeath desc



--global number datewise


Select Date, sum(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(Nullif(New_Cases,0))* 100 AS DeathPercentage
from PortfolioProject1..covidDeaths
--where location like '%canada%'
where continent is not null
group by Date
order by 1,2



--global number total


Select sum(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(Nullif(New_Cases,0))* 100 AS DeathPercentage
from PortfolioProject1..covidDeaths
--where location like '%canada%'
where continent is not null
--group by Date
order by 1,2


-- total population vs vaccinations 


select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM (cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location , dea.date) as RollingPeopleVaccinated 
from PortfolioProject1..CovidDeaths dea
Join PortfolioProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null and vac.new_vaccinations is not null 
order by 2,3



-- total population vs vaccinations 


using CTE
With PopvsVac(Continent, Location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM (cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location , dea.date) as RollingPeopleVaccinated 
from PortfolioProject1..CovidDeaths dea
Join PortfolioProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null and vac.new_vaccinations is not null 
--order by 2,3
)
select *, (RollingPeopleVaccinated/population)*100
from PopvsVac



--Temp Table


Drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric,
)


insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM (cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location , dea.date) as RollingPeopleVaccinated 
from PortfolioProject1..CovidDeaths dea
Join PortfolioProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
--where dea.continent is not null and vac.new_vaccinations is not null 
--order by 2,3

select *, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated



--Creating view to store data for visualization


create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM (cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location , dea.date) as RollingPeopleVaccinated 
from PortfolioProject1..CovidDeaths dea
Join PortfolioProject1..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null and vac.new_vaccinations is not null 
--order by 2,3


select *
from PercentPopulationVaccinated