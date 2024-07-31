-- Company wise total laid off
SELECT company, SUM(total_laid_off) AS company_total_laid
FROM layoffs_staging2
GROUP BY company
ORDER BY company_total_laid DESC;

-- Country wise total laid off
SELECT country, SUM(total_laid_off) AS country_total_laid
FROM layoffs_staging2
GROUP BY country
ORDER BY country_total_laid DESC;

-- Industry wise total laid off
SELECT industry, SUM(total_laid_off) AS industry_total_laid
FROM layoffs_staging2
GROUP BY industry
ORDER BY industry_total_laid DESC;

SELECT MIN(`date`) AS start_date, MAX(`date`) AS end_date
FROM layoffs_staging2;

SELECT company, YEAR(`date`) AS laid_off_year, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company, laid_off_year, laid_off DESC;

SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2 
WHERE YEAR(`date`) = 2020
GROUP BY company;

WITH Year_2020 AS 
(
	SELECT company, SUM(total_laid_off) 
	FROM layoffs_staging2 
	WHERE YEAR(`date`) = 2020
	GROUP BY company
),
Year_2021 AS 
(
	SELECT company, SUM(total_laid_off) AS 
	FROM layoffs_staging2 
	WHERE YEAR(`date`) = 2021
	GROUP BY company
)
SELECT *
FROM Year_2020
JOIN Year_2021
	ON Year_2020.company = Year_2021.company;




