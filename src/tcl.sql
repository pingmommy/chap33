-- TCL (Transaction Control Language)
-- >> commit, rollback, savepoint

-- 트랜잭션이란? 
-- all or nothing의 원칙(원자성을 띈다.)
-- 모든 작업이 성공해야 한다.(아니면 다 실패)
-- 오라클은 트랜잭션을 기반으로 데이터의 일관성을 보장한다. 
-- 트랜잭션은 데이터처리에서 논리적으로 하나의 작업 단위를 의미한다. 
-- comnit은 모든 작업들을 정상적으로 처리하겠다고 확정하는 명령어 


--savepoint

select * from dept;

select * from emp;

delete from emp where deptno in(10,30);

-- 여기까지의 작업을 emp1의 이름으로 기억함. 
savepoint emp1;

update emp set ename='홍길동';

savepoint emp2;

insert into emp(empno,ename) values(2000,'홍순이');

 
rollback to emp1;
-- >> commit전까지 rollback되는 것이 아니라 savepoint emp1로 rollback됨.
