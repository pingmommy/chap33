
--join

-- 자바가 코드의 중복을 싫어하듯이 관계형데이터베이스는 데이터의 중복을 싫어한다. 
-- 데이터의 중복을 피하기 위해서 데이터를 쪼개서 저장한다. (분산저장)


--****** T-SQL
-- 1. Equi join (where ,=) 참고 : where 절에 조건을 추가할 경우 and 사용 
-- 2. non Equi join (where , > < >= <=)
-- 3. outer join (where, = ,(+))
-- 4. self join


-- ****** ANSI JOIN
-- 1. inner join (= Equi join, nonEqui join self join)
-- 2. outer join (= outer join)
                -- left (a = b(+)), 
                -- right (a(+) = b), 
                -- full   

select * from dept;
select * from emp;


select empno, ename,deptno
from emp;
-- >> deptno의 10이 무슨 의미인지 부서에 대한 세부 정보가 없다.
-- >> 세부정보는 dept테이블에 있다.(10: 경리부, 서울)

-- >>> emp테이블에는 empno ename, deptno밖에 없는데, deptno에 대한 세부정보(10 : 인사부)를 알고 싶다면?
-- >>> join을 사용한다. 


-- Cross Join
-- 단순하게 연속적으로 기술(dept(row : 4) * emp(row : 14) = row : 56)=> 다 유효한 데이터가 아니다.(일부만 유효함.)  

--전통적인(tranditional) cross join방식  
select *  
 from dept,emp;

-- 표준적인(ANSI) cross join방식 
select * from dept cross join emp;   
 
 
-- Equi join :'=' 연산자를 사용 
-- 조인대상이 되는 두 테이블에서 공통으로 존재하는 칼럼의 값이 일치되는 행을 연결하여 결과를 생성.
-- 동일칼럼을 기준으로 조인 
select empno, ename,dname
from dept, emp
where dept.deptno= emp.deptno;
 
select empno, ename,dname,dept.deptno, emp.deptno
  from dept, emp
 where dept.deptno= emp.deptno; 
 
-- inner join
select empno, ename,dname,dept.deptno, emp.deptno
from emp inner join dept
on dept.deptno= emp.deptno; 

 
 --Non-Equi join : '=' 연산자 이외의 비교연산자(>=, <=, <,>)를 사용한다. 
 

-- 어떤 직원이 몇 등급을 받는지 알고 싶다.  
--salgrade와 emp는 동일한 컬럼이 없기 때문에 Equijoin(' = ')이 안 된다. 
 
 select *
  from salgrade;
  
select empno,ename,sal
    from emp;

  
 select empno, ename, sal, grade, losal, hisal
   from emp, salgrade;
-- >> 동일칼럼이 없으니 crossjoin 은 단순한 정보의 나열이다.   



select empno, ename, sal, grade, losal, hisal
  from emp, salgrade
 where sal between losal and hisal;
-- >> 두 테이블의 정보를 가져와서 특정칼럼을 기준으로 조건을 만듦. 

 
 --Ansi inner join   
select empno, ename, sal, grade, losal, hisal
  from emp inner join salgrade
    on sal between losal and hisal;
    
    
 select * from dept;
 select * from emp;
 
 -- 어떤 부서에 어떤 직원이 있는지 알고 싶다. 

 select deptno, dname, ename, empno -- 오류남 : deptno가 dept와 emp에도 있어서 어느 테이블의 deptno를 지칭하는지 모르기 때문에.
   from dept, emp;                  -- 해결방법 : dept.deptno -> 이런 식으로 분명하게 지칭함. 
   
 select dept.deptno, dname, ename ,empno
   from dept, emp
  where dept.deptno = emp.deptno
  order by deptno;
 
 
 -- OUTER JOIN
 select dept.deptno, dname, ename ,empno
 from dept, emp
 where dept.deptno = emp.deptno(+)
 order by deptno;
 -- >> dept테이블과 emp테이블은 deptno 컬럼을 동일하게 가지고 있다. 이를 기준으로 조인을 하는데, 
 -- >> 이럴 경우 두 테이블에 동일하게 가지고 있는 값만 출력된다. 
 -- >> 예를 들어 dept테이블에 40 전산부라는 데이터가 있지만 위의 쿼리문을 실행했을 때 전산부에 소속된 직원이 없으므로 값은 나오지 않는다. 
 -- >> 만약 40, 전산부도 추출하고 싶다면 outer join을 사용하면 된다.  
 
 desc country;
 select region,count(*) from country group by region;
 select distinct region from country;
 select distinct count(region) from country;
 
 
 -- Ansi Outer Join
select dept.deptno, dname, ename ,empno
  from dept left outer join emp
    on dept.deptno = emp.deptno(+)
  order by deptno; 
  
  
 select * from country where code = 'KOR';
 -- >> country 테이블에는 국가정보 
 select * from city where country_code = 'KOR'; 
 -- >> city에는 도시 정보 
 
 -- 서울이라는 도시의 국가와 대통령 이름을 알아내려면? 
 -- city테이블에는 도시정보만 있을 뿐 국가 정보는 없다. 
 -- city테이블에 있는 도시가 소속된 나라를 알고 싶다면?
 -- 도시 정보는 city에 있고 나라 정보는 country에 있으므로 두 테이블을 조인해야 한다. 
 
 select * from country;
 --where lower(name) like '%united%';

 select * from city;
 
 select country.name as country, city.name as city 
   from city,country
  where country.code = city.country_code;
 
 -- city를 c1, country를 c2로 하여 위의 쿼리문 고쳐쓰기
 select c1.name as city, c2.name as country
   from city c1, country c2
  where c1.country_code = c2.code;
 
 -- 결과를 한국과 미국으로 제한하기 
 select c1.name as city, c2.name as country
   from city c1, country c2
   where c1.country_code=c2.code
   --and lower(c2.name) like '%korea%' and lower(c2.name) like '%united states%'; 
   and c2.code in('KOR','USA');
   
   
--SELF JOIN 
-- 자기 자신과 조인 
-- 서로 다른 테이블을 조인하는 것 뿐 아니라 하나의 같은 테이블을 조인해야만 원하는 정보를 얻는 경우도 생김.

-- 예시 : emp테이블에서 직속상관(mgr)의 값은 empno와 같다. 직속상관의 이름을 알아내려면 emp테이블의 empno와 ename이 필요하다. 
--        emp테이블이 자기자신을 조인해야만 원하는 값(특정인의 직속상관이름)을 알아낼 수 있다. 


select * from emp; -- 오류남 : 같은 테이블이라서 정의가 애매하다고 함. 

select e.ename as 사원이름, m.ename as 직속상관이름, e.empno, m.mgr
  from emp e, emp m
 where e.empno = m.mgr;
-- >> 같은 테이블을 크로스 조인하기 위해 별칭을 줌. 

select e.ename as 사원이름, m.ename as 직속상관이름, e.empno, m.mgr
  from emp e inner join emp m
  on e.empno = m.mgr;


select e.ename as 사원이름, m.ename as 직속상관이름, e.empno, m.mgr
  from emp e, emp m
 where e.mgr = m.empno(+);   
 
 
select e.ename as 사원이름, m.ename as 직속상관이름, e.empno, m.mgr
  from emp e left join emp m
  on e.mgr = m.empno(+);
  

-- 가상의 테이블을 만들 수 있는 구문 : with as ()  
with a as(
select 1 from dual
)
select * from a;


with t1 as (
 select 1 as no, 'A' as ch from dual union 
 select 2 as no, 'B' as ch from dual union
 select 3 as no, 'C' as ch from dual union
 select 4 as no, 'D' as ch from dual
),t2 as (
  select 'C' as ch, '@' as sp from dual union
  select 'D' as ch, '#' as sp from dual union
  select 'E' as ch, '$' as sp from dual union
  select 'F' as ch, '%' as sp from dual

)
-- @@@@@@@@@ inner join @@@@@@@@@
select * 
  from t1  inner join t2
    on t1.ch = t2.ch;

-- @@@@@@@@@ left join @@@@@@@@@@
--select *
--  from t1 left outer join t2
--  on t1.ch = t2.ch(+); 

-- @@@@@@@@@ right join @@@@@@@@@
--select * 
--  from t1 right join t2
--  on t1.ch(+) = t2.ch;

-- @@@@@@@@@ full join @@@@@@@@@
--select *
--  from t1 full join t2
--   on t1.ch = t2.ch;
