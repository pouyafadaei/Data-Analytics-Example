# SQL Analysis: International Students Mental Health

## Overview

This project analyzes mental health survey data for **international students**, focusing on how **length of stay**
relates to depression, social connectedness, and acculturative stress.

The goal is to demonstrate clean, readable SQL and a reproducible analysis workflow.

## Question

**How do mental health indicators vary among international students based on their length of stay?**

## Dataset

The analysis uses a single table containing student survey results.

| Column      | Description                        |
|-------------|------------------------------------|
| `inter_dom` | Student type (`Inter` / `Dom`)     |
| `stay`      | Length of stay                     |
| `todep`     | Depression score (PHQ)             |
| `tosc`      | Social connectedness score (SCS)   |
| `toas`      | Acculturative stress score (ASISS) |

Only international students (`inter_dom = 'Inter'`) are included in the final query.

## Output

The query returns:

* Number of international students per stay length
* Average depression score
* Average social connectedness score
* Average acculturative stress score
