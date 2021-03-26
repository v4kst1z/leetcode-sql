-- Write a SQL query to get the second highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+

-- select Max(Salary) as SecondHighestSalary from Employee where Salary < (select max(Salary) from Employee);

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH emp AS(
      SELECT Salary,
      DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'rank'
      FROM Employee)
      SELECT DISTINCT Salary
      FROM emp
      WHERE emp.rank=N
  );
END