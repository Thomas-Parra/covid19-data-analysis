-- COVID-19 DATA ANALYSIS



-- Looking at total cases vs deaths

SELECT LOCATION, DATE, TOTAL_CASES, TOTAL_DEATHS, ROUND((TOTAL_DEATHS/TOTAL_CASES)*100,2) AS DEATH_RATIO
FROM DEATHS
WHERE LOCATION ='Colombia'
ORDER BY 1,2

-- Looking at total cases vs population

SELECT LOCATION, DATE, TOTAL_CASES, POPULATION, ROUND((TOTAL_CASES/POPULATION)*100,2) AS INFECTED_RATIO
FROM DEATHS
WHERE LOCATION ='Colombia'
ORDER BY 1,2


-- Countries with highest infection rates

SELECT LOCATION, MAX(TOTAL_CASES) AS HIGHEST_INFECTION_COUNT, POPULATION, MAX((TOTAL_CASES/POPULATION)*100) AS INFECTED_RATIO
FROM DEATHS
GROUP BY 1,3
HAVING MAX((TOTAL_CASES/POPULATION)*100) IS NOT NULL
ORDER BY 4 DESC;


-- Countries with highest death counts

SELECT LOCATION, MAX(TOTAL_DEATHS) AS DEATHS_COUNT
FROM DEATHS
WHERE CONTINENT IS NOT NULL
GROUP BY 1
HAVING MAX(TOTAL_DEATHS) IS NOT NULL
ORDER BY 2 DESC;


-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2