
--SQL(Structual Query Language) - 14개

-- 1. DQL (Data Query Language)
--  >> select 

-- 2. DML (Date Manipulation Language)
--  >> insert, update, delete
--  > rollback은 DML 문에만 적용된다. 


-- 3. DDL(Data Definition Language)
--  >>create, alter, drop, rename, truncate
--  >DDL은 자동커밋. rollback 할 수 없다. 


-- 4. TCL (Transaction Control Language)
-- >> commit, rollback, savepoint

-- 5. DCL(Date Control Language)
-- >> grant, revoke

-- *** C(create) - insert
-- *** R(retreive) - select
-- *** U(update) - update
-- *** D(delete) - delete

create table alpha_RANDOM(
 line number(2)
);

select * from alpha_random;

alter table alpha_random
  add (col number(2));

desc alpha_random;  
 
alter table alpha_random
 modify (col number(10) not null);
 
alter table alpha_random
 drop column line;
 
 rename alpha_random to alpha2;
 
 desc alpha2;
 
 select * from salgrade;
 
 drop table salgrade;
 
 drop table dept; 
 -- >> 삭제 안 됨. emp에서 reference하고 있기 때문에. 
 -- >> 삭제하려면 emp를 먼저 삭제해야 함. 
 
 drop table emp;
 
 drop table dept;
 -- >> 이제 된다. emp를 먼저 drop 했기 때문에. 
 
 select table_name from user_tables;
 
 
 -- TRUNCATE : 컬럼은 냅두고 안의 데이터만 삭제된다. rollback할 수 없다. 
 
 TRUNCATE table dept;
 -- >> 수행 안 됨. emp가 dept를 참조하고 있기 때문에 emp 먼저 truncate해야 한다. 
 
TRUNCATE table emp;

truncate table dept;
-- >> emp를 truncate 했기 때문에 이제 수행문이 실행된다. 