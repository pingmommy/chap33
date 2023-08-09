--형변환함수


-- to_date :문자열,숫자형을 날짜로 변환 
-- 날짜+수치 : 날짜 , 날짜 - 날짜 : 일수 , 날짜 - 수치 : 날짜 

-- 관계연산자 사용가능 =, !=, >, >=, <, <=  ex :날짜 <= 날짜



-- 숫자형을 날짜로 변환
 select to_date(20000830)
  from dual;

-- 위의 sql문을 문자형으로 변환 
select to_char(to_date(20000830),'yyyy/mm/dd')
  from dual;
  
  
--문자열을 날짜형으로 변환 
select to_date('2023/08/07'),
       to_date('2000 10 15'),
       to_date('2010-12-15'),
       to_date('20101215'),
       to_date('2010 12 14')
 from dual;
 
 -- 문자열을 데이트형으로 변환하는 주된 이유: 특정날짜를 지정해서 2행처럼 날짜 계산이 가능(문자열일 경우 계산 불가)
 select to_date('2023/06/29'),
        to_date('2023/06/29')+100
   from dual;     
 
-- 현재 날짜부터 100일 이후,100일 이전을 출력    
 select sysdate +100,
        sysdate -100
   from dual;
   
-- 입사일부터 지금까지 근무한 일 수 구하기
select ename,trunc(sysdate - hiredate)
 from emp;
   
 
 -- 개월 수 구하기 
 select ename, hiredate,
        months_between(sysdate,hiredate) --소수점까지 수치로 출력 
   from emp;
 
-- 입사일부터 근무한 개월 수를 구하고(a), a를 활용하여 근무년수와 근무년수를 제하고 남은 근무 개월 수를 구하기  
select ename, hiredate,
        trunc(months_between(sysdate,hiredate)),
        trunc(months_between(sysdate,hiredate)/12),
        mod(trunc(months_between(sysdate,hiredate)),12)
   from emp;
   
--add_months 함수 사용법 : 특정 개월수를 더한 날짜를 구하는 함수
select to_char(add_months(sysdate,100),'yyyy/mm/dd') -- 현재 시간에 100개월을 더함. 
 from dual;
 
 -- next_day 함수 사용법 : 해당날짜를 기준으로 최초로 도래하는 요일에 해당되는 날짜를 반환
select next_day(sysdate,'월')as 휴강 -- 오늘을 제외하고 다음 '월'요일을 구하는 함수 
  from dual;
  
 
 -- last_day 함수 사용법 : 매개변수에 해당하는 월의 마지막 날을 구한다.  
select last_day(sysdate)
  from dual;  
 
select last_day('2023/02/02'), -- 2월은 윤년에 따라 마지막 날이 달라지므로 last_day함수를 효율적으로 사용할 수 있다.
       last_day('2024/02/02'),
       last_day(sysdate)-sysdate
  from dual; 
  
  
 --to_char를 활용하여 내가 원하는 포맷으로 출력할 수 있음. 
select to_char(sysdate +100,'yyyy-mm-dd-dy'),
        to_char(sysdate -100,'yyyy-mm-dd-day')
   from dual; 
   
select ename, hiredate
from emp;
-- where hiredate =to_date(20070301,'yyyy/mm/dd'); 
-- where hiredate =to_date(20070301); =>숫자형을 날짜형으로 변환
-- where hiredate >=to_date('20070301');=>문자형을 날짜형으로 변환, 비교연산을 사용하여 데이터추출


--to_date에서 round를 사용할 때 

select round(sysdate,'dd'),trunc(sysdate,'dd'), -- 'dd'=> '일자'를 기준으로 반올림함 (round) 
    to_char(sysdate, 'mm/dd hh:mi:ss')-- 
 from dual;


select round(sysdate,'hh'),trunc(sysdate,'hh'), -- 'hh'=> '현재 시'를 기준으로 반올림함 (round) 
    to_char(sysdate, 'mm/dd hh:mi:ss')
 from dual;
 
 -- 위의 코드를 문자로 변환 
 select to_char(round(sysdate,'hh'),'yyyy/mm/dd hh24:mi:ss'),
        to_char(trunc(sysdate,'hh'),'yyyy/mm/dd hh24:mi:ss'), 
        to_char(sysdate, 'mm/dd hh:mi:ss')
 from dual;
 
 
 
 
 select to_date('0001/01/01'),
        to_char(to_date('0001/01/01'),'dy')
  from dual;  
  
  
  select to_char(sysdate,'yyyy/mm/dd hh:mi:ss'),
         to_char(trunc(sysdate), 'yyyy/mm/dd hh:mi:ss')
    from dual;     
         