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
SELECT company, YEAR(`date`) AS laid_off_year, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY YEAR(`date`), company
HAVING laid_off != 0
ORDER BY company, laid_off_year;

-- Industry yearly laid offs
SELECT industry, YEAR(`date`) AS laid_off_year, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY YEAR(`date`), industry
HAVING laid_off != 0
ORDER BY industry, laid_off_year;

-- Country yearly laid offs
SELECT country, YEAR(`date`) AS laid_off_year, SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
GROUP BY YEAR(`date`), country
HAVING laid_off != 0
ORDER BY country, laid_off_year;









