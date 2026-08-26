👥 HR Analytics Dashboard

📌 Project Overview
An end-to-end HR Analytics project built using Excel, SQL, and Power BI to analyze employee data, attendance, performance, salary, and attrition trends across the organization.
The project demonstrates the complete data analytics workflow, from data cleaning and SQL analysis to interactive dashboard development in Power BI.

🎯 Business Objectives

- Analyze workforce composition by department, gender, and designation
- Track employee attendance and identify patterns
- Evaluate employee performance ratings across departments
- Analyze salary, bonus, and deduction trends
- Identify key drivers of employee attrition
- Rank employees by salary within and across departments
- Generate actionable HR insights to support workforce planning

🛠️ Tools & Technologies

- Excel – Data cleaning and preprocessing
- SQL – Data analysis, joins, subqueries, aggregations, window functions, and ranking queries
- Power BI – Data modeling, DAX, KPIs, and interactive visualization

📂 Dataset
The project contains six related datasets:

- `employees.csv` – Employee details (age, gender, department, designation, hire date, contact info)
- `departments.csv` – Department names and floor information
- `attendance.csv` – Daily attendance records with check-in/check-out times
- `performance.csv` – Performance review ratings and manager feedback
- `salary.csv` – Basic salary, bonus, deductions, and net salary by pay date
- `attrition.csv` – Employee exit records with reason and exit type

📊 Dashboard
The Power BI dashboard is organized across 4 pages:

- HR Overview – organization-wide KPIs and summary metrics
- Workforce & Employee Analysis – headcount by department, gender, designation
- Salary & Performance Analysis – salary trends and performance ratings by department
- Attendance & Attrition Analysis – attendance patterns and attrition breakdown


🧮 SQL Analysis
SQL was used to perform:

- Data aggregation and filtering
- Joins across employees, departments, salary, performance, and attrition tables
- Subqueries for salary comparisons
- Window functions (running total, moving average, LAG/LEAD) ordered by pay date
- Ranking queries (RANK, DENSE_RANK, ROW_NUMBER) for salary comparisons within departments
- NULL handling for missing ratings, emails, and contact numbers

The complete SQL queries are available in:
`hr.sql`

🔍 Key Insights

🔍 Key Insights
- Marketing department has the highest attrition (40 employees)
- Better Opportunity is the most common reason for attrition (25.94%)
- Human Resources department has the highest employee count (135)
- Overall attrition rate stands at 26.02%
- Senior Analyst has the highest average net salary among designations
- Employee age group 40-49 forms the largest workforce segment


📁 Project Files

- `employees.csv`
- `departments.csv`
- `attendance.csv`
- `performance.csv`
- `salary.csv`
- `attrition.csv`
- `hr.sql`
- `HR.pbix`


👤 Author
Ayush Kukreti
Data Analytics Portfolio | SQL | Power BI | Excel# hr-analytics-project
HR Analytics project using Excel, SQL, and Power BI to analyze employee data, attendance, performance, salary, and attrition trends.
