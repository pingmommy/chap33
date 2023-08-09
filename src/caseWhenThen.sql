
-- caseWhenThen : 범용언어의 if else, elseif와 동등한 기능 

select ename, deptno,
  case when deptno=10 then '경리부'
       when deptno=20 then '인사과'
       when deptno=30 then '영업과'
     end as dname
     from emp;
     
select empno,ename,sal,
   case when sal >500 then '상'
        when sal >=300 then '중'
        else '하'
   end as 급여등급
 from emp;