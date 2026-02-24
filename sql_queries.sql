CREATE TABLE environmental_data (
    ID INT PRIMARY KEY,
    carbon_emissions_kg DECIMAL(12,2),
    water_consumption_liters DECIMAL(15,2),
    energy_usage_kwh DECIMAL(15,2),
    waste_generated_kg DECIMAL(12,2),
    recycling_rate_percent DECIMAL(5,2),
    air_quality_index INT,
    region VARCHAR(50),
    industry VARCHAR(100),
    product_type VARCHAR(100),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    compliance_level VARCHAR(20),
    year INT
);

-- checking total rows
SELECT COUNT(*) AS total_rows FROM environmental_data;

-- removing negative values
DELETE FROM environmental_data
WHERE carbon_emissions_kg < 0
   OR water_consumption_liters < 0
   OR energy_usage_kwh < 0
   OR recycling_rate_percent < 0;

-- total carbon emissions
SELECT SUM(carbon_emissions_kg) AS total_carbon_emissions
FROM environmental_data;

-- total water consumption
SELECT SUM(water_consumption_liters) AS total_water_consumption
FROM environmental_data;

-- average recycling rate
SELECT AVG(recycling_rate_percent) AS avg_recycling_rate
FROM environmental_data;

-- carbon emissions by region
SELECT region,
       SUM(carbon_emissions_kg) AS total_emissions
FROM environmental_data
GROUP BY region
ORDER BY total_emissions DESC;

-- energy usage trend over years
SELECT year,
       SUM(energy_usage_kwh) AS total_energy_usage
FROM environmental_data
GROUP BY year
ORDER BY year;

-- recycling rate by region and industry
SELECT region,
       industry,
       AVG(recycling_rate_percent) AS avg_recycling_rate
FROM environmental_data
GROUP BY region, industry;

-- compliance level distribution
SELECT compliance_level,
       COUNT(*) AS total_records
FROM environmental_data
GROUP BY compliance_level;

-- scatter plot data
SELECT carbon_emissions_kg,
       recycling_rate_percent
FROM environmental_data;

-- top 5 industries by emissions
SELECT industry,
       SUM(carbon_emissions_kg) AS total_emissions
FROM environmental_data
GROUP BY industry
ORDER BY total_emissions DESC
LIMIT 5;
