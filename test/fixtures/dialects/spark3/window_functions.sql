SELECT
    name,
    dept,
    RANK() OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS row_rank
FROM employees;

SELECT
    name,
    dept,
    DENSE_RANK() OVER (
        PARTITION BY dept
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS row_dense_rank
FROM employees;

SELECT
    name,
    dept,
    age,
    CUME_DIST() OVER (
        PARTITION BY dept
        ORDER BY age
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS data_cume_dist
FROM employees;

SELECT
    name,
    dept,
    salary,
    MIN(salary) OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_min
FROM employees;

SELECT
    name,
    salary,
    LAG(salary) OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lag,
    LEAD(salary, 1, 0) OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lead
FROM employees;

SELECT
    name,
    salary,
    LAG(salary) IGNORE NULLS OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lag,
    LEAD(salary, 1, 0) IGNORE NULLS OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lead
FROM employees;

SELECT
    name,
    salary,
    LAG(salary) RESPECT NULLS OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lag,
    LEAD(salary, 1, 0) RESPECT NULLS OVER (
        PARTITION BY dept
        ORDER BY salary
    ) AS salary_lead
FROM employees;

SELECT
    id,
    v,
    LEAD(v, 0) IGNORE NULLS OVER w AS v_lead,
    LAG(v, 0) IGNORE NULLS OVER w AS v_lag,
    NTH_VALUE(v, 2) IGNORE NULLS OVER w AS v_nth_value,
    FIRST_VALUE(v) IGNORE NULLS OVER w AS v_first_value,
    LAST_VALUE(v) IGNORE NULLS OVER w AS v_last_value
FROM test_ignore_null
WINDOW w AS (ORDER BY id)
ORDER BY id;

SELECT
    id,
    v,
    LEAD(v, 0) RESPECT NULLS OVER w AS v_lead,
    LAG(v, 0) RESPECT NULLS OVER w AS v_lag,
    NTH_VALUE(v, 2) RESPECT NULLS OVER w AS v_nth_value,
    FIRST_VALUE(v) RESPECT NULLS OVER w AS v_first_value,
    LAST_VALUE(v) RESPECT NULLS OVER w AS v_last_value
FROM test_ignore_null
WINDOW w AS (ORDER BY id)
ORDER BY id;
