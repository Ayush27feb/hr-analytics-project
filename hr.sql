- -----------------------------------------------------
--HR Analytics — SQL Analysis
-- -----------------------------------------------------
--  Create DataBase
  Create Database HR;
----------------------------------------------------------
create Table In HR
Employees Table
CREATE TABLE employees (
    employee_id VARCHAR(20) PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(50),
    department_id VARCHAR(50),
    Hire_Date DATE,
    designation VARCHAR(50),
    contact_number VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    Date_Of_Birth DATE
);

CREATE TABLE DEPARTMENTS(
department_id varchar(50),
department_name varchar(50),
floor_number int);

CREATE TABLE PERFORMANCE(
review_id varchar(50),
employee_id varchar(50),
rating int,
manager_name varchar(50),
feedback text,
Review_Date date);

CREATE TABLE attrition(
exit_id varchar(50),
employee_id varchar(50),
reason varchar(50),
exit_type varchar(50),
exit_date Date);

CREATE TABLE ATTENDANCE (
attendance_id varchar(50),
employee_id varchar(50),
date date,
status varchar(50),
check_in_time  time,
check_out_time time);

CREATE TABLE SALARY
(SALARY_ID VARCHAR (50),
EMPLOYEE_ID VARCHAR(50),BAISC_SALARY DOUBLE ,bonus DOUBLE ,DEDUCTIONS DOUBLE,NET_SALARY DOUBLE,PAY_DATE DATE);

1. List all employees with their employee_id, employee_name, age, gender, department_id, and designation.

SELECT employee_id, employee_name, age, gender, department_id, designation
FROM employees;

2. Find employees whose age is greater than 40.
Select employee_id,employee_name,age from employees where age >40;

3. Find employees who are between 25 and 35 years old.

select employee_id,employee_name,age from employees where age between 25 and 35

4. Find employees who work in department DEPT009 or DEPT010.

select employee_id,employee_name from employees where department_id="DEPT009" OR department_id='DEPT010';

5. Find employees whose designation contains the word 'Manager'.
SELECT *
FROM employees
WHERE designation LIKE '%Manager%';

6. Find male employees who are older than 40 and work in DEPT009.
select * from employees where gender="Male" AND age>40 AND department_id="DEPT009" ;

7. Find employees who are either younger than 25 or older than 50.
select * from employees where age<25 or age>50;

8. Find employees whose designation is not 'Manager'.
select * from employees where designation <>"manager";

9. Show the 10 youngest employees, ordered by age from lowest to highest.

select * from employees order by age asc limit 10;

10. Show the 10 highest-paid employees based on net_salary.

select s.employee_id,e.employee_name from employees e inner join salary s on e.employee_id=s.employee_id
order by s.net_salary desc limit 10;

11. List all unique employee genders and designations.
SELECT DISTINCT gender, designation
FROM employees;

12. Find employees who joined the company after  2020.
select employee_id,employee_name from employees where year(hire_date)>2020;

13. Display every performance rating and replace NULL ratings with 0.

SSELECT 
    employee_id,
    CASE 
        WHEN rating IS NULL OR rating = 'Null' THEN 0 
        ELSE rating 
    END AS rating
FROM performance;

14. Find employees whose email is missing or whose contact number is NULL.

select employee_id,employee_name from employees where email ="" OR contact_number is null;

15. Find employees hired between 2020-01-01 and 2024-12-31.
select employee_id,employee_name from employees WHERE hire_date BETWEEN '2020-01-01' AND '2024-12-31';

16. Count the total number of employees.
select count(*) as no_of_employees from employees 

17. Calculate the average age of employees.
select avg(age) as AVERAGE_AGE from employees;

18. Find the minimum and maximum employee age.

select max(age)as maximum,min(age) as minimum from employees ;

19. Calculate the average net salary across all employees.
SELECT AVG(NET_SALARY) AS average_net_salary
FROM SALARY;

20. Calculate the total net salary, total bonus, and total deductions.
select round(sum(net_salary),2) as total_net_salary ,round(sum(bonus),2) as total_bonus,round(sum(deductions),2) as total_deductions from salary;

21. Count employees in each department.

select d.department_name,count(*)as total_no_of_employees from employees e  
inner join departments d on e.department_id=d.department_id 
group by d.department_name;

22. Calculate the average net salary for each department.

select d.department_name,round(avg(s.net_salary),2)as net_salary from salary s  inner join 
employees e on s.employee_id=e.employee_id
inner join departments d on e.department_id=d.department_id
group by d.department_name;

23. Find departments having more than 120 employees.

select d.department_name ,count(e.employee_id) as Employees from employees e inner join departments d on e.department_id=d.department_id
group by d.department_name
 having(Employees)>120;
 
24. Find departments where the average net salary is greater than 80,000.

select d.department_name,round(avg(s.net_salary),2)as net_salary from salary s  inner join 
employees e on s.employee_id=e.employee_id
inner join departments d on e.department_id=d.department_id
group by d.department_name
having net_salary>80000
;
25. Which reason is most commonly associated with employee attrition?

SELECT reason, COUNT(*) AS attrition_count
FROM attrition
WHERE reason IS NOT NULL
GROUP BY reason
ORDER BY attrition_count DESC
LIMIT 1;


26.  show employee name and their  department name.

select e.employee_name,d.department_name from employees e inner join departments d on e.department_id=d.department_id;

27.  show employee name, designation, and net salary.
select e.employee_name,e.designation,s.net_salary from employees e inner join salary s on e.employee_id=s.employee_id;

28. Employees and their departments that currently have no employees.

SELECT d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

29. Show every employee and their salary information, including employees who have no salary record.

select e.employee_name,s.basic_salary,s.bonus,s.deductions,s.net_salary from employees e
 left join salary s on e.employee_id=s.employee_id;
 
 
 
30 show employees and departments to identify unmatched records on either side.

SELECT 
    e.employee_id,
    e.employee_name,
    d.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id

UNION

SELECT 
    e.employee_id,
    e.employee_name,
    d.department_id,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;
    

31. Find departments where the average net salary of employees is greater than 100,000
and display the departments in descending order of average net salary.

select d.department_name,round(avg(s.net_salary),2) as average_net_salary from departments d inner join
employees e on e.department_id=d.department_id
inner join salary s on e.employee_id=s.employee_id
group by d.department_name
having round(avg(s.net_salary),2)>100000
order by average_net_salary desc ;

32. Find employees who have attendance records but no performance review.
SELECT e.employee_name FROM employees e INNER JOIN attendance a ON e.employee_id = a.employee_id
LEFT JOIN performance p
    ON e.employee_id = p.employee_id
WHERE p.employee_id IS NULL;

33.  find employees working under the same manager or with the same manager_id.

SELECT 
    p1.employee_id AS employee_1,
    p2.employee_id AS employee_2,
    p1.manager_name
FROM performance p1
INNER JOIN performance p2
    ON p1.manager_name = p2.manager_name
    AND p1.employee_id < p2.employee_id
ORDER BY p1.manager_name;

34. Find the department name, employee name, and net salary for the highest-paid employee in each department.

select d.department_name,e.employee_name,s.net_salary from employees e inner join departments d on e.department_id=d.department_id
inner join salary s on e.employee_id=s.employee_id
group by d.department_name,e.employee_name,s.net_salary
order by  s.net_salary desc; 

35. Find employees whose net salary is higher than the overall average net salary.

select e.employee_name ,s.net_salary from employees e  inner join salary s on e.employee_id=s.employee_id 
where s.net_salary>(select avg(net_salary) from salary );

36. “Find employees whose net salary is equal to the highest net salary in the company.”

SELECT e.employee_name, s.net_salary
FROM employees e
JOIN salary s
    ON e.employee_id = s.employee_id
WHERE s.net_salary = (
    SELECT MAX(net_salary)
    FROM salary
);

37. “Find the number of employees who joined the company in each year.”

SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS employee_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

38. Find employees who have never appeared in the attrition table.
select e.employee_name from employees left  join attrition a on e.employee_id=a.employee_id
where a.employee_id is null;


39. Find the second-highest net salary without using LIMIT or OFFSET.

select max(net_salary) as second_highest from salary
where net_salary<(select max(net_salary) from salary) ;

40. Rank employees by net salary from highest to lowest 

select e.employee_id,e.employee_name,s.net_salary,dense_rank()over(order by net_salary desc) as ranking from employees e 
inner join salary s on e.employee_id=s.employee_id;

41. Rank employees by net salary within each department using PARTITION BY.

select e.employee_id,e.employee_name,s.net_salary,dense_rank()over(partition by d.department_name order by s.net_salary desc ) as rank from departments d 
inner join employees e on d.department_id=e.department_id
inner join salary s on e.employee_id=s.employee_id;

42. Create a unique salary ranking within each department using ROW_NUMBER().

select e.employee_id,e.employee_name,s.net_salary,row_number() over(partition by d.department_name order by s.net_salary desc)
 as unique_rank
from departments d inner join employees e on d.department_id=e.department_id
inner join salary s on e.employee_id=s.employee_id;

43. Compare RANK(), DENSE_RANK(), and ROW_NUMBER() for employees with equal salaries.

SELECT 
    e.employee_id,
    e.employee_name,
    s.net_salary,

    RANK() OVER (
        ORDER BY s.net_salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER (
        ORDER BY s.net_salary DESC
    ) AS salary_dense_rank,

    ROW_NUMBER() OVER (
        ORDER BY s.net_salary DESC
    ) AS salary_row_number

FROM employees e
INNER JOIN salary s
    ON e.employee_id = s.employee_id;
    
44. Find the top 3 highest-paid employees in every department.

SELECT *
FROM (
    SELECT 
        e.employee_id,
        e.employee_name,
        d.department_name,
        s.net_salary,
        ROW_NUMBER() OVER (
            PARTITION BY d.department_name
            ORDER BY s.net_salary DESC
        ) AS salary_rank
    FROM departments d
    INNER JOIN employees e
        ON d.department_id = e.department_id
    INNER JOIN salary s
        ON e.employee_id = s.employee_id
) AS ranked_employees
WHERE salary_rank <= 3;

45. Show each employee's salary along with the previous employee's salary when ordered by salary.

SELECT 
    e.employee_id,
    e.employee_name,
    s.net_salary,
    LAG(net_salary) OVER (ORDER BY net_salary) AS previous_salary
FROM employees e inner join salary s on e.employee_id=s.employee_id;

46. Show each employee's salary along with the next employee's salary when ordered by salary.

SELECT 
    e.employee_id,
    e.employee_name,
    s.net_salary,
    LEAD(s.net_salary) OVER (ORDER BY net_salary) AS previous_salary
FROM employees e inner join salary s on e.employee_id=s.employee_id;

47. Calculate the running total of net salary by salary payment date.

SELECT 
    e.employee_id,
    s.net_salary,
    s.PAY_DATE,
    SUM(s.net_salary) OVER (ORDER BY s.PAY_DATE) AS running_total
FROM employees e inner join salary s on e.employee_id=s.employee_id


48. Calculate a 3-record moving average of net salary ordered by payment date.

SELECT 
    s.employee_id,
    s.net_salary,
    s.pay_date,
    AVG(s.net_salary) OVER (
        ORDER BY s.pay_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3
FROM salary s;

49. For each department, show the employee with the highest salary and the employee with the second-highest salary.
SELECT *
FROM (
    SELECT
        e.employee_id,
        e.employee_name,
        d.department_name,
        s.net_salary,
        DENSE_RANK() OVER (
            PARTITION BY d.department_id
            ORDER BY s.net_salary DESC
        ) AS salary_rank
    FROM departments d
    INNER JOIN employees e
        ON d.department_id = e.department_id
    INNER JOIN salary s
        ON e.employee_id = s.employee_id
) AS ranked_employees
WHERE salary_rank <= 2;

50. “Which department has the highest average performance rating?”

SELECT 
    d.department_name,
    AVG(p.rating) AS average_rating
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
INNER JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY average_rating DESC
LIMIT 1;




ak