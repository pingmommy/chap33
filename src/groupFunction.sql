-- SQL문 수행순서 
--  1.from 2.when 3.group by 4.having 5.select 6.order by


-- 그룹함수: 여러 개의 값을 받아서 하나의 값으로 추출. 그룹의 갯수만큼 적용된다. 


-- 4079개의 row가 있는데, 1개의 row로 추출 => 그룹함수의 성격 

-- 그룹함수 종류:  sum avg count max min stddev variance


-- 그룹함수 예시 

select *
  from country;

select count(*) as COUNT -- 그룹함수 count 사용. 4079개의 row를 하나의 컬럼, 로우에 표현함.  
from city;
 
 select count(*)
   from country;
   
-- 그룹함수의 특징 : 널은 제외한다. row를 카운팅할 때 전체를 카운팅하지 않고 널은 제외한 후 카운팅한다. 
-- '*'를 적용하면 테이블의 전체 로우 수를 구할 수 있다. 


-- 예시: 직원테이블(row:14)에서 커미션컬럼을 그룹함수 count로 조회하면 널을 제외한 결과가 추출된다. => row: 4 (커미션받은 직원(null 아닌 값))
select count(comm)
  from emp;
  
 -- 만약 전체 row를 알고 싶다면 '*'를 사용 : 널을 포함한 결과 추출 : 전체 14행 
 select count(*)
   from emp;
   
 -- comm에는 null이 있다. 그룹함수 sum을 사용할 때 null을 제외한 데이터의 값을 더한 결과가 나온다. 
 select sum(sal), sum(comm)
   from emp;   
  
select * from country;    
 select count(*) from country;  
   
 -- 나라테이블에서 인구의 row 수와 인구데이터의 합, 평균, 편차, 분산을 구하기
 select count(*), count(population), sum(population), round(avg(population)),
        trunc(stddev(population)), trunc(variance(population))
   from country;
 
 -- 직원테이블에서 전체 월급의 평균구하기  
 select avg(sal)
   from emp;

-- 그룹 갯수를 정하여 그룹별로 결과 추출하기 >>     
-- 그룹을 정하는 키워드 : group by (컬럼명) 
-- 특정 컬럼을 기준으로 함수를 사용해야 할 경우 어떤 컬럼 값을 기준으로 그룹함수를 적용해줄지 결정할 때 사용 

-- 부서별로 월급 평균을 구하기 
select round(avg(sal))
  from emp
  group by deptno;  -- 전체 row는 14개인데, deptno컬럼을 기준으로 함수 적용하여 3개의 row로 출력(deptno의 유효값이 10,20,30 >> 3개임)
 
 select deptno,round(avg(sal))
  from emp
  group by deptno;
  
 
 -- 대륙별로 인구 수 구하기 
 
 -- 01. 대륙의 갯수 구하기
 select continent 
 from country;
 
 -- 01-1. 중복 제거하기 
 select distinct continent 
  from country;
 
 --02. 대륙별 인구 수 평균 구하기 
select continent,round(avg(population))
  from country
  group by continent;
  
-- 02-2. 대륙별 나라 수, 대륙별 총 인구수, 인구 수 평균 구하기 
select continent, count(*), sum(population), trunc(avg(population))
 from country
 group by continent;

-- having
-- 조건식이 참인 것만 출력하고 싶을 때: >> group by가 반드시 와야 한다.
-- select절에 조건을 사용하여 결과를 제한할 때는 where 
-- 그룹의 결과를 제한할 때는 having 


--나라가 30개 이상인 대륙의 데이터만 출력 
 select continent, count(*), sum(population), trunc(avg(population))
 from country
 group by continent
 having count(*)>=30;
 
 -- 인구가 많은 순서대로 정렬
 select continent, count(*), sum(population), trunc(avg(population))
 from country
 group by continent
 having count(*)>=30
 order by sum(population)desc;
 
 -- 총 인구수에 별칭을 주어서 처리 
 select continent, count(*), sum(population) as total, trunc(avg(population))
 from country
 group by continent
 having count(*)>=30
 order by total desc;
 
 
 -- 그룹을 여러 개로 나누기 
 
select distinct continent, region
  from country;
  
select distinct continent, region, count(*) as cnt
  from country
  group by continent, region
  order by cnt desc;
  

  
select distinct continent, region, count(*) as cnt
  from country
  group by continent, region
  order by continent, cnt desc; 


-- 결과는 같지만 아래 수행문보다 속도가 더 느린 이유는 전체 로우를 다 조회하고 함수를 수행한 후  필터링을 하기 때문에   
select distinct continent, region, 
                count(*) as cnt,
                trunc(avg(population)) as avg
  from country
  group by continent, region
  having continent = 'Asia'
  order by continent, avg desc;  
 
 
 -- 위의 수행문보다 속도가 더 빠르다. where가 먼저 필터링을 하기 때문에 
select distinct continent, region, 
                count(*) as cnt,
                trunc(avg(population)) as avg
  from country
  where continent = 'Asia'
  group by continent, region
  having count(*) >=10  -- 여기서 cnt는 쓸 수 없다. select문이 수행순서가 뒤이기 때문에.
  order by continent, avg desc; 
  
 -- 소속 부서별 최대 급여와 최소급여 구하기 
  select max(sal)as max, min(sal) as min
    from emp
  group by deptno
  order by deptno desc;
  




 
 