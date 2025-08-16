--description table in database
DESC employees;
INFORMATION employees;
INFO departments;
INFO+ employees;
--sql not case sensitive
select * from employees;
SELECT * FROM EMPLOYEES;
Select * From Employees;
--sql statement can be separate into multiple line
select *
from 
employees;
--keyword must be in one line or that cant not  abreviated or  split
sele
ct * fr employees;
--sql statement can be terminated by smeicolon ; or slash /
select * from employees;
select * from departments
/
--there are need to be at least one space between commands
select* from employees;

--error message
select * employees;
select 1 + 'abc' from dual;
select 1 + 200 from dual;
CREATE OR REPLACE PUBLIC SYNONYM jobs FOR hr.jobs;

--select statement
select first_name, last_name, email from employees;
select * from employees;

--using aliases
select first_name name, last_name surename from employees;
select employee_id, salary + nvl(salary*commission_pct, 0) + 1000 as "New Salary", salary from employees;
select first_name as "My Name", email as "E-Mail" from employees;

--quote operator
select * from dual;
select 'My favotite club is liverpool' as "footbal club" from dual;
select q'[My favorite club is liverpool]' as "footbal club" from dual;
select 'I''am people of sago salido' as text from dual;
--instead
select q'[I'am people of sago salido]' as text from dual;
--it can be 
select q'xI'am people of sago salidox' as text from dual;

--distinct and unique keyword
select distinct first_name from employees;
select unique first_name from employees;
select distinct job_id, department_id, first_name from employees;
--error
select first_name distinct email from employees;

--contatenation operator
select 'nama saya fakhri' from employees;
select 'My Name is ' || first_name as nama from employees;
select distinct first_name ||' '|| last_name as "Full Name" from employees;
select 'the commission percentage is ' || commission_pct, commission_pct from employees;
select * from locations;
select location_id ||' '|| street_address ||' '|| postal_code ||' '|| city ||' '|| state_province ||' '|| country_id as "Full Addres" from locations;

--arithmathic operation
select employee_id , salary, (salary+10)*12 as annual_salary from employees;
select sysdate +365, sysdate from dual;
select employee_id, hire_date, hire_date + 365 from employees;
select salary , salary*commission_pct, commission_pct from employees;
select employee_id, salary, salary+salary*0.2+1000 as new_salary from employees;

--where statement
select * from employees where salary > 10000;
select * from employees where job_id= 'IT_PROG';
select employee_id, first_name, last_name from employees where job_id= 'SA_MAN';
select * from employees where hire_date  > '19-JUN-2003';
select * from employees where manager_id != 103;
select * from employees where salary between 10000 and 12000;
select * from employees where hire_date between '13 Jan 2001' and '07 Feb 2007'; 
select * from employees where employee_id in (100, 105, 102, 200);
select * from employees where hire_date in ('17-JUN-2003', '21-SEP-2005');
select employee_id, first_name, last_name, job_id from employees where job_id in ('SA_MAN', 'SA_REP');

--like keyword
select * from employees where job_id = 'SA_REP'; 
select * from employees where job_id like 'SA_REP';
select * from employees where job_id like 'SA%';
select * from employees where first_name like '%a'; 
select * from employees where first_name like '%a%';
select * from employees where first_name like '_r%';
select employee_id, first_name, last_name, job_id from employees where job_id like '%MAN';

--isnull operator
select * from employees where commission_pct = NULL; -- tidak bisa dijalankan = NULL tidak sama dengan is NULL
select * from employees where commission_pct is NULL;
select * from employees where commission_pct is NOT NULL;

--OR AND NOT 
select * from employees where job_id = 'SA_REP' or salary > 11000;
select * from employees where job_id not in 'IT_PROG';
select * from employees where salary > 11000 and job_id in ('SA_MAN', 'SA_REP') and first_name = 'Lisa';
select * from employees where salary > 11000 and job_id not in ('SA_MAN', 'SA_REP');
select employee_id, first_name, last_name,job_id ,  salary from employees where job_id like '%MAN' and salary < 10000;

--precedence
select * from employees where (job_id= 'IT_PROG' or job_id = 'ST_CLERK') and salary > 5000;
select * from employees where job_id= 'IT_PROG' or (job_id = 'ST_CLERK' and salary < 5000);
SELECT * FROM employees WHERE job_id = 'SA_REP' OR salary > 10000;
select * from employees where job_id= 'IT_PROG' or job_id = 'ST_CLERK' and salary > 5000;
select first_name, last_name, department_id, salary from employees  where salary > 10000 and department_id= 20 or department_id= 30; 
select first_name, last_name, department_id, salary from employees where salary > 10000 and (department_id= 20 or department_id= 30);
select employee_id, department_id, job_id, salary from employees where department_id = 50 or job_id = 'SA_REP' and salary between 5000 and 10000;

select 'tkhri' as fakhri from dual where 'tkhri' like 'T_';
SELECT 'fakhrit' AS fakhri
FROM dual
WHERE 'fakhrit' LIKE 'f%';

--order by clause
select first_name, last_name, salary from employees order by first_name;
select first_name, last_name, salary from employees order by last_name;
select first_name, last_name, salary from employees order by first_name, last_name;
select first_name, last_name, salary, (10*(salary/5)+3000)- 100 New_salary from employees order by 1,2;
select * from employees order by 2,3,7,8;
select * from employees order by first_name, job_id, salary;

--order asc and desc
select first_name, last_name, salary from employees order by first_name desc;
select * from employees order by commission_pct;
select first_name, last_name, salary s from employees order by s desc;
select employee_id, department_id, salary from employees order by department_id, salary desc;

--nulls first and nulls last
select first_name, salary, commission_pct from employees order by commission_pct desc nulls last;
select first_name, salary, commission_pct from employees order by 3 nulls first;

--rownum rowid
select employee_id, first_name, last_name, salary, rowid, rownum from employees;
select department_id, first_name, last_name, salary, rowid, rownum
from employees 
where department_id = 60;
select employee_id, department_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 80 and rownum <=5 order by salary desc;

select employee_id, first_name, last_name, salary, rowid, rownum from
(select employee_id, first_name, last_name, salary, rowid from employees where department_id = 80 order by salary desc)
where rownum <= 5;

select employee_id, first_name, last_name, salary, rowid, rownum from
(select employee_id, first_name, last_name, salary, rowid from employees where department_id = 80 order by salary desc)
where rowid= 'AAARywAAEAAAIwNAAu';

--fetch clause
select first_name, last_name, salary from employees 
order by salary desc offset 1 row fetch first 10 rows only;
select first_name, last_name, salary from employees
order by salary desc offset 1 row fetch first 10 rows with ties;
select first_name, last_name, salary from employees
order by salary desc offset 1 row fetch next 10 rows with ties;
select first_name, last_name, salary from employees 
order by salary desc offset null row fetch first 10 rows only; --nilai offset dan fetch adalah null hanya akan mengembalikan nilai null

select order_id, order_total, customer_id from orders 
order by order_total offset 2 row fetch first 10 row only;

--substitution variable
select employee_id, first_name, last_name, department_id from employees where department_id= &department_num;
select employee_id, first_name, last_name, department_id from employees where first_name = '&first_names';

select employee_id, first_name, last_name, department_id, &column_name
from &table_name
where &condition
order by &order_by_clause;

--define undefine
select employee_id, first_name, last_name, salary from employees where salary between &sal and &sal+1000;
select employee_id, first_name, last_name, salary from employees where salary between &&sal and &sal +1000;
undefine sal;

select employee_id, first_name, last_name, &&column_name
from employees
order by &column_name;
undef column_name;

select &&column_name
from employees
group by &column_name
order by &column_name;

define emp_num= 100;
select * from employees where employee_id= &emp_num; 
define column_name= 'first_name';
undef column_name;
define column_name;

--accept and prompt command
accept emp_id prompt 'Please Input a Valid Employee ID';
select employee_id, first_name, last_name salary from employees
where employee_id= &emp_id;
undef emp_id;

accept min_salary prompt 'please specify the minimum salary';
accept max_salary prompt 'please specify the maximum salary';
select employee_id, first_name, salary from employees
where salary between &min_salary and &max_salary; 

undef min_salary;
undef max_salary;

--set verivy
set verivy on;
select employee_id, first_name, last_name from employees where employee_id= &emp_id;
set verivy off;

select * from department where deparment_name= 'R&D';
set def off;

--function
select upper(first_name), lower(last_name), initcap(email), upper('honda motor i125') from employees;
select * from employees
where lower(last_name) = 'king';

--char manipulation
select first_name, substr(first_name, 3, 3) as inisial, substr(first_name, 2)
       last_name, length(last_name) as n_karakter from employees;
select concat(first_name, last_name) from employees;
select concat(concat(first_name, last_name), employee_id) from employees;
select concat(first_name,email) from employees;
select first_name || last_name from employees; 
select instr('I am learning how to use function in Oracle', 'o', 17) from dual;
select instr('I am learning how to use fucntion in Oracle', 'o', 1, 3) from dual;
select instr('I am learning how to use function in Oracle', 'o', -1, 3) from dual;
select instr('I am learning how to use function in Oracle', 'in', -1, 1) from dual;
select first_name, instr(first_name, 'a', -1, 1) from employees;
select trim(trailing' 'from'  my name is fakhri  ') trimmed_text from dual;
select trim(leading' ' from '  my name is fakhrim  ') trimmed_text from dual;
select trim(leading 'm' from'my name is fakhrim') trimmed_text from dual;
select trim(both 'm' from 'my name is fakhrim') trimmed_text from dual;
select trim( 'm' from 'my name is fakhrim') tirmmed_text from dual;
select rtrim('  my name is fakrhim   ') r_trimmed_text from dual;
select ltrim('my name is fakhrim ', 'm') l_trommed_text from dual;
select ltrim('www.youtube.com', 'w.') trimeed_text from dual;
select rtrim(ltrim('www.youtube.com', 'w.'), '.com') trimeed_text from dual;
select ltrim('12112431135www.youtube.com', '1234567890') ltrimmed_text from dual;
select first_name, ltrim(first_name, 'M') trimmed_text from employees;
select first_name, replace(first_name, 'E', '#') from employees;
select first_name, replace(replace(first_name, 'El', ''), 'len', '') output_replaced from employees;
select first_name, rpad(lpad(first_name, 10, '*'), 15, '*') from employees;
select first_name, lpad('My name is '|| last_name, 20, '-') pad from employees; 

--numeric function
select round(23.6364,3) from dual;
SELECT ROUND(45.953, -1) FROM DUAL;
select trunc(23.2364,1) from dual;
select trunc(23.52346352562) from dual;
select ceil(23.2364) from dual;
select ceil(23.00000001) from dual;
select ceil (23) from dual;
select floor(23.6364) from dual;
select floor(23.9999) from dual;
select mod(23, 3) from dual; 
select mod(10000, 1) bagi_satu from dual;

--nested function 
select first_name, last_name, lpad(upper(concat(last_name, first_name)), 20, '#') as "nested function" from employees;
select substr('fakhri kamil',instr('fakhri kamil', ' ')+1, length('fakhri kamil')) as output from dual;
select first_name || ' ' || last_name as full_name ,substr(first_name || ' ' || last_name, instr(first_name || ' ' || last_name, ' ')+1) as output from employees;  

--date values
select * from employees;
select current_date, sessiontimezone, systimestamp, current_timestamp from dual; 
select sysdate, current_date from dual; -- database diinstall di pc maka memiliki waktu yang sama dengan lokasi pengguna
select sysdate, sysdate +4 from dual;
select sysdate sekarang,sysdate + 1/24 jam, sysdate + 1/(24*60) menit from dual;
select employee_id, hire_date, sysdate, trunc((sysdate-hire_date)/365) kerja_pertahun 
from employees
order by kerja_pertahun;
select sysdate, add_months(sysdate,3) from dual;
select sysdate, add_months(sysdate, -3) from dual;
select sysdate, extract(month from sysdate) from dual;
select next_day(sysdate, 'wednesday')from dual;
select last_day(sysdate) from dual;

--conversion function
select first_name, hire_date, 
        to_char(hire_date, 'YYYY') format_tanggal
from employees;
select sysdate, to_char(sysdate, 'YY') from dual;
select sysdate, to_char(sysdate, 'Month-YYYY') from dual;
select sysdate, to_char(sysdate, 'YEAR') from dual;
select sysdate, to_char(sysdate, 'Mon-YYYY') from dual;
select sysdate, to_char(sysdate, 'MON') from dual;
select first_name, hire_date, to_char(sysdate, 'DAY-Month-YYYY-HH12:MI:SS') as "formated_date" from employees;
select first_name, hire_date, to_char(sysdate, 'DY-MON-YYYY-HH12:MI:SS') as "formated_date" from employees;
select first_name, hire_date, to_char(hire_date, 'DDTH-MON-YYYY-HH12:MI:SS') as "formated_date" from employees;
select first_name, hire_date, to_char(hire_date, 'DDSPTH-MMTH-YYYY-HH12:MI:SS') as "formated_date" from employees;

--Conditional Expression
select first_name, last_name, job_id, salary,
case when job_id like 'IT%' then
    case when salary > 8000 then 'Senior IT'
         when salary > 5000 then 'Midle IT'
         else 'Junior IT' end
when job_id like 'SA%' then
    case when salary > 10000 then 'Senior Sales'
         when salary > 7000 then 'Sales Rep'
         else 'Sales Treinee' end
    else 'Not in Category'
end as empployee_calssification
from employees;

--Group Funtion
SELECT 
    manager_id,
    SUM(salary) AS team_salary,
    round(AVG(salary)) AS avg_team_salary,
    MAX(hire_date) AS newest_member,
    MIN(CASE 
        WHEN commission_pct > 0 THEN commission_pct 
        ELSE NULL 
    END) AS lowest_commission_in_team,
    COUNT(DISTINCT job_id) AS diverse_roles,
    LISTAGG(first_name, ',') WITHIN GROUP (ORDER BY first_name) AS team_members,
    CASE
        WHEN COUNT(*) > 8 THEN 'Large Team'
        WHEN COUNT(*) BETWEEN 4 AND 8 THEN 'Medium Team'
        ELSE 'Small Team'
    END AS team_size,
    CASE
        WHEN AVG(salary) > 10000 AND COUNT(*) > 5 THEN 'High-Value Large Team'
        WHEN AVG(salary) > 10000 THEN 'High-Value Small Team'
        ELSE 'Standard Team'
    END AS team_value_category
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY team_salary DESC;

select manager_id, sum(salary) team_salary, round(avg(salary)) avg_team_salary, max(hire_date) newest_member,
min(case when commission_pct >0 then commission_pct 
              else null end)lowest_commission_pct_in_team, 
count(distinct job_id) diverse_roles, listagg(first_name, ',') within group (order by first_name) team_members, 
case when count(*) > 8 then 'Large team'
     when count(*) between 4 and 8 then 'Medium team'
     else 'small team' end team_size, 
case when avg(salary) > 10000 and count(*) > 5 then 'High-Value Large Team'
     else 'Standard Team' end team_value_category
from employees
where manager_id is not null
group by manager_id
order by team_salary desc;

--bonus
select 
    m.first_name || ' ' || m.last_name as manager_name,
    sum(e.salary) as team_salary,
    round(avg(e.salary)) as avg_team_salary,
    max(e.hire_date) as newest_member,
    min(case when e.commission_pct > 0 then e.commission_pct else null end) as lowest_commission_pct_in_team,
    count(distinct e.job_id) as diverse_roles,
    listagg(e.first_name, ',') within group (order by e.first_name) as team_members,
    case 
        when count(*) > 8 then 'Large team'
        when count(*) between 4 and 8 then 'Medium team'
        else 'Small team' 
    end as team_size,
    case 
        when avg(e.salary) > 10000 and count(*) > 5 then 'High-Value Large Team'
        else 'Standard Team' 
    end as team_value_category
from employees e
join employees m on e.manager_id = m.employee_id
group by e.manager_id, m.first_name, m.last_name
order by team_salary desc;

--new chapter
select * from countries;
select * from locations;
select * from departments;
select * from employees;

select * from employees natural join departments;
select * from employees join departments using(department_id);
select * from employees join departments using(department_id, manager_id);

--handling ambigous column names
select first_name, last_name, email, department_name, e.manager_id
from employees e join departments d using(department_id);

select first_name, last_name, department_name, manager_id
from employees e join departments d using(manager_id);

--inner join
select e.first_name, e.last_name, e.hire_date, d.manager_id, d.department_name --bisa untuk nama kolom joim yang beda
from employees e join departments d
on(e.department_id= d.department_id and e.manager_id=d.manager_id);

select e.first_name, e.last_name, d.manager_id, d.department_name
from employees e join departments d
on(e.department_id= d.department_id and e.employee_id=d.manager_id);

select e.first_name, e.last_name, manager_id, d.department_name --hanya bisa jika kolom join sama 
from employees e join departments d
using(department_id, manager_id);

--multiple join 
select first_name, last_name, d.department_name, city, postal_code, street_address, country_id from employees e join departments d 
on e.department_id= d.department_id
join locations l on l.location_id = d.location_id
join countries using(country_id);

--
select first_name, last_name, d.department_name, city, salary, c.country_id, postal_code, street_address from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
join countries c on c.country_id = l.country_id;

select first_name, last_name, d.department_name, city, postal_code, street_address, country_id from employees e join departments d 
on e.department_id= d.department_id
join countries using(country_id)
join locations l on l.location_id = d.location_id; --tidak bisa join karena antara tabel country dan tabel join sebelumnya tidak memiliki kolom yang berhubungan

--restricting joining
select first_name, last_name, d.department_name, city, postal_code, street_address, country_id from employees e join departments d 
on e.department_id= d.department_id
join locations l on
l.location_id = d.location_id
join countries using(country_id)
where city= 'Oxford';

select first_name, last_name, d.department_name, city, c.country_id postal_code, street_address from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
join countries c on c.country_id = l.country_id
where l.city = 'Oxford' or l.city = 'South San Francisco'
order by l.city desc;


select first_name, last_name, d.department_name, city, c.country_id postal_code, street_address from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
join countries c on c.country_id = l.country_id
and l.city = 'Oxford'
and d.department_name = 'Sales'; 

--slef join
select worker.first_name, worker.last_name, worker.employee_id, worker.manager_id, 
 manager.employee_id, manager.first_name, manager.last_name
from employees worker 
join employees manager on(worker.manager_id = manager.employee_id);

select worker.first_name, worker.last_name, worker.employee_id, worker.manager_id, 
 manager.employee_id, manager.first_name, manager.last_name, worker.salary, manager.salary
from employees worker 
join employees manager on(worker.manager_id = manager.employee_id);

select worker.first_name||' '|| worker.last_name "Employee Name",  
manager.first_name||' '|| manager.last_name "Manager Name", worker.employee_id, worker.manager_id,  manager.employee_id "Manager Employee ID"
from employees worker 
join employees manager on(worker.manager_id = manager.employee_id);

select department_id, count(distinct job_id) num_of_job_ids from employees
group by department_id;

--non equijoins 
select * from employees;
select * from jobs;

--1
select e.employee_id, e.first_name, e.last_name, e.job_id, e.salary, j.min_salary, j.max_salary, j.job_id
from employees e join jobs j 
on e.salary > j.max_salary 
and j.job_id = 'SA_REP';

select e1.employee_id, e1.first_name, e1.last_name
from employees e1 inner join employees e2 
on e1.employee_id <> e2.employee_id
and e1.first_name = e2.first_name;

select e.employee_id, e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e join jobs j 
on e.salary between j.min_salary and j.max_salary;

--outer join
--contoh bikan outer join
select * from employees;
select * from departments;
select first_name, last_name, department_name
from employees join departments
using(department_id);
--contoh outer join
select d.department_id, d.department_name, e.first_name, e.last_name
from departments d join employees e 
on (d.manager_id = e.employee_id);

select d.department_id, d.department_name, e.first_name, e.last_name
from departments d join employees e 
on (e.department_id = d.department_id);
--
select first_name, last_name, department_id, department_name
from employees join departments 
using(department_id);

select e.first_name, e.last_name, d.department_id, d.department_name
from employees e left outer join departments d
on (e.department_id = d.department_id);

--jika letak table employees ditukar dengan table deparments
select e.first_name, e.last_name, d.department_id, d.department_name
from departments d left outer join employees e
on (e.department_id = d.department_id);

--bisa tanpa menggunakan outer 
select e.first_name, e.last_name, d.department_id, d.department_name
from departments d left join employees e
on (d.department_id = e.department_id);

--membandingkan apakaha terdapat perbedaan untuk department id tabel employees dan deparment id tabel deparments
select e.first_name, e.last_name, e.department_id "EdepartmentID", d.department_id "DdepartmentID" , d.department_name
from departments d left join employees e
on (d.department_id = e.department_id);

--jika kedua table dibalik
select e.first_name, e.last_name, e.department_id "EdepartmentID", d.department_id "DdepartmentID" , d.department_name
from employees e left join departments d
on (d.department_id = e.department_id);

--menggunakan right outer join
select e.first_name, e.last_name, d.department_id, d.department_name
from departments d right outer join employees e
on (e.department_id = d.department_id);

--akan sama dengan left jpin jika keadaan tabel right join dibalik
select e.first_name, e.last_name, d.department_id, d.department_name
from employees e left outer join departments d
on (e.department_id = d.department_id);

--gabungan left join dan right join  
select * from locations;
select * from jobs;

select e.first_name, e.last_name, department_name, e.department_id, d.department_id, location_id 
from employees e right join departments d
on (e.department_id = d.department_id) 
left join locations  
using(location_id);

select e.first_name, e.last_name, department_name, e.department_id, d.department_id, location_id 
from employees e right join departments d
on (e.department_id = d.department_id) 
right join locations  
using(location_id);

--full join
select first_name, last_name, department_name 
from employees e full join departments d 
on(e.department_id = d.department_id);

select 
    ed.first_name, 
    ed.last_name, 
    ed.department_name, 
    ed.phone_number,
    l.street_address, 
    l.city, 
    l.state_province, 
    l.country_id
from (select e.first_name, e.last_name, d.department_name, e.phone_number, d.location_id
from employees e full join departments d on e.department_id = d.department_id) ed
full join locations l on ed.location_id = l.location_id;

--cross join
select first_name, last_name, department_name
from employees cross join departments;

select d.department_name, j.job_title, count(*) as employee_count_number
from employees e join departments d on (e.department_id= d.department_id)
join jobs j on (j.job_id = e.job_id)
group by d.department_name, j.job_title
order by d.department_name, j.job_title;

select c.department_name, c.job_title, count(e.employee_id) employee_count_number
from (select d.department_name, j.job_title, j.job_id, d.department_id
from departments d cross join jobs j) c 
left join employees e on (e.job_id = c.job_id and e.department_id = c.department_id)
group by c.department_name, c.job_title
order by c.department_name, c.job_title;

SELECT 
  c.department_name, 
  c.job_title, 
  e.department_id, 
  COUNT(employee_id) AS employee_count_number
FROM (
  SELECT 
    d.department_name, 
    j.job_title, 
    j.job_id, 
    d.department_id
  FROM departments d 
  CROSS JOIN jobs j
) c
LEFT JOIN employees e 
  ON e.job_id = c.job_id AND e.department_id = c.department_id
GROUP BY c.department_name, c.job_title, e.department_id
ORDER BY c.department_name, c.job_title;

--rangkuman inner join dan outer join
--inner join (equijoin)
select e.first_name, e.last_name, d.department_name
from employees e join departments d
on(e.department_id = d.department_id and e.manager_id = d.manager_id);

--inner join (nonequijoin)
select e.first_name, e.last_name, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e, jobs j 
where e.job_id = j.job_id and e.salary > j.min_salary; 

--outer join (equijoin)
select e.first_name, e.last_name, dl.manager_id, dl.department_name, dl.street_address, dl.city, dl.state_province, dl.country_id 
from (select d.manager_id, d.department_name, l.street_address, l.city, l.state_province, l.country_id 
from departments d right join locations l
on(d.location_id = l.location_id)) dl left join employees e
on (e.manager_id = dl.manager_id); 

--outer join (nonequijoin)
select ej.employee_id, ej.manager_id, ej.job_title, d.department_name, ej.salary , ej.min_salary, ej.max_salary
from (select e.employee_id, e.manager_id, j.job_title, e.salary, j.min_salary, j.max_salary
from employees e right join jobs j
on e.job_id = j.job_id and e.salary > j.min_salary) ej left join departments d
on (ej.manager_id = d.manager_id); 

--sub queries
--1
select * from employees
where employee_id = 145;

select * from employees
where salary > 18000;

select * from employees
where salary > (select salary from employees 
    where employee_id = 145);

--code quiz
select employee_id, first_name, last_name, department_id from employees where department_id = (select department_id from employees 
where first_name = 'Douglas');

--2
select employee_id, first_name, last_name, department_id, salary from employees where salary between 
(select salary from employees where employee_id = 106) and (select salary from employees where employee_id = 110)
or salary >= (select salary from employees where first_name= 'Ki');

--3
select first_name, last_name, department_id, salary from employees
where salary in (14000,12000,40000);

select first_name, last_name, department_id, manager_id, salary from employees
where salary in (select max(salary) from employees group by (department_id, manager_id));

select first_name, last_name, department_id, manager_id, job_id, salary from employees
where salary > any (select salary from employees where job_id ='SA_MAN' or job_id = 'IT_PROG');

select first_name, last_name, department_id, manager_id, job_id, salary from employees
where salary > all (select salary from employees where job_id ='SA_MAN' or job_id = 'IT_PROG');

select salary, job_id from employees where job_id ='SA_MAN' or job_id = 'IT_PROG';
                                                                   
select e.first_name, e.last_name, e.department_id, e.job_id Job_now, h.job_id Job_Before, e.hire_date, h.start_date, e.salary 
from employees e join job_history h on e.employee_id = h.employee_id 
     where e.department_id in (select d.department_id from departments d
     where d.location_id in (select l.location_id from locations l where l.country_id in (select c.country_id from countries c)));

select * from employees;
select * from job_history;
SELECT 
    e.first_name, 
    e.last_name, 
    e.department_id, 
    e.salary, 
    e.hire_date, 
    h.start_date 
FROM employees e
JOIN job_history h ON e.employee_id = h.employee_id
WHERE e.department_id IN (
    SELECT d.department_id 
    FROM departments d
    WHERE d.location_id IN (
        SELECT l.location_id 
        FROM locations l
        WHERE l.country_id IN (
            SELECT c.country_id 
            FROM countries c
            WHERE c.country_name = 'United Kingdom'
        )
    )
);


--non pairwise
select employee_id, first_name, last_name, department_id, salary from employees
where department_id in (select department_id from employees where employee_id in (103, 105,110))
and salary in (select salary from employees where employee_id in (103,105,110));
select * from employees;

--pairwise
select employee_id, first_name, last_name, department_id, salary from employees
where (first_name, salary) in (select first_name, salary from employees where employee_id in (136,137,139));

--non pairwise
select employee_id, first_name, last_name, department_id, salary from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);
 






