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

-- Total laid offs by yearly
SELECT YEAR(`date`) AS the_year, SUM(total_laid_off) AS yearly_laid_offs
FROM layoffs_staging2
GROUP BY the_year
ORDER BY the_year DESC;

-- Company yearly laid offs
SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY years, company
HAVING laid_off != 0
ORDER BY laid_off DESC;

-- Industry yearly laid offs
SELECT industry, YEAR(`date`) AS years, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY years, industry
HAVING laid_off != 0
ORDER BY laid_off DESC;

-- Country yearly laid offs
SELECT country, YEAR(`date`) AS years, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY years, country
HAVING laid_off != 0
ORDER BY laid_off DESC;

SELECT YEAR(`date`) AS `Year`, MONTH(`date`) AS `Month`, MONTHNAME(`date`) AS `MonthName`, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY `Year`, `Month`, `MonthName`
HAVING `Year` IS NOT NULL
ORDER BY `Year`, `Month`;

WITH Rolling_total AS
(
	SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS laid_off
	FROM layoffs_staging2
	GROUP BY `Month`
	HAVING `Month` IS NOT NULL
	ORDER BY `Month`
)
SELECT `Month`, laid_off, SUM(laid_off) OVER(ORDER BY `Month`) AS rolling_total
FROM Rolling_total;

-- Company ranking by yearly laid offs
WITH Year_laid_offs AS
(
	SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS laid_off
	FROM layoffs_staging2
	GROUP BY years, company
	HAVING laid_off != 0 AND years IS NOT NULL
	ORDER BY laid_off DESC
), Comapny_ranking As
(
	SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY laid_off DESC) AS Ranking
	FROM Year_laid_offs
)
SELECT *
FROM Comapny_ranking
WHERE Ranking <= 10;









