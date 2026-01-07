# SQL Data Cleaning & Median Imputation: Pet Supplies Sales

## Overview

This project demonstrates an SQL-based data cleaning and transformation workflow applied to a pet supplies dataset.
The analysis focuses on **standardizing categorical fields**, **handling invalid values**, and **using the median to
impute missing sales data** in a statistically robust way.

The goal is to showcase practical SQL skills commonly required in **data science and analytics roles**, especially when
working with real-world, messy data.

---

## Problem Statement

The raw dataset contains multiple data quality issues:

* Missing or invalid sales values
* Non-numeric price values (`'unlisted'`)
* Placeholder symbols (`'-'`) in categorical fields
* Inconsistent text casing
* NULL values in ratings

These issues must be resolved before meaningful analysis can be performed.

## Approach

1. **Compute the median of valid sales values** using `PERCENTILE_CONT`
2. **Impute missing sales values** with the median to reduce the impact of outliers
3. **Normalize categorical columns** by replacing placeholders with `"Unknown"`
4. **Standardize text formatting** (e.g., product size)
5. **Safely cast numeric fields** and handle invalid entries

## SQL Logic Highlights

* Median calculation via ordered-set aggregate
* Median used only when `sales` is NULL
* Explicit data cleaning using `CASE`, `COALESCE`, and casting
* Single-query, reproducible transformation

## Requirements

### Database

* PostgreSQL 10 or later
  (Required for `PERCENTILE_CONT` and ordered-set aggregates)

---

## Import Data (PostgreSQL)

```sql
COPY pet_supplies (
                   product_id,
                   category,
                   animal,
                   size,
                   price,
                   sales,
                   rating,
                   repeat_purchase
    )
    FROM '/absolute/path/to/Pet Supplies Sales/datalab.csv'
    DELIMITER ','
    CSV HEADER;
```

## Output Description

The query returns a cleaned and analysis-ready dataset with:

* Standardized categorical values
* Consistent text formatting
* Numeric price values
* Median-imputed sales values
* No NULL ratings

This output can be used directly for:

* Exploratory analysis
* Visualization
* Feature engineering
* Downstream modeling