
select empno, ename, deptno
  from emp;
  
  
select * from dept;


-- which와 동등한 기능을 구현하는 decode : 동등비교만 할 뿐 if else 같은 기능은 구현하지 못한다. 
select empno, ename, 
   decode(deptno,10,'경리부',
                 20,'인사부',
                 30,'영업부',
                   '전산부')as 부서,
     gender,              
     decode(gender, 'F', '여성',
                    'M', '남성') as 성별
   from emp;                