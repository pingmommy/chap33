
--insert 

-- 칼럼명에 기술된 목록의 수와 values 다음에 나오는 괄호에 기술한 값의 개수가 같아야 함. 
-- into 절에 칼럼을 명시하지 않을 경우 테이블을 생성할 때 정의한 칼럼 순서에 따라 데이터를 입력해야 함. 
insert into dept values(50,'개발부','부산'); 

-- 컬럼 순서에 맞지 않게 넣을 때  into절 뒤에 칼럼명을 명시해 주어야 함. 
insert into dept(dname,loc,deptno) values ('개발부', '부산',50);

-- into 절 다음에 칼럼명을 나열할 경우 기술된 목록의 수와 values 다음에 나오는 괄호에 기술한 값의 개수가 같아야 함.
insert into dept(deptno,dname) values(60,'디자인'); -- LOC는 default 값이 서울이어서 서울이 들어감. 

desc dept;

select * from dept;

delete from dept where LOC ='부산';

update dept set dname='개발부' where LOC ='서울';



create table dept01(
 deptno number(2) primary key,
 dname varchar2(20 char)not null,
 loc varchar2(20 char) default '춘천'
);

desc dept01;

drop table dept01;

select * from dept01;

insert into dept01 values(10,'개발부','부산');
insert into dept01 values(20,'영업부','광주');
insert into dept01(dname, loc, deptno) values('인사부','서울',30); 
insert into dept01(dname,deptno)values('디자인',40); -- 디폴드값이 없어서 LOC에 널값이 들어감. 

commit;

select * from emp;

desc emp;


insert into emp(empno,ename)values(1015,'박보영');
-- >> emp는 컬럼 수가 9개인데, notnull인 컬럼만 값을 넣음. 나머지는 다 널값으로 출력됨. 
-- >> 컬럼 수대로 값을 입력하지 않고 특정 컬럼에만 값을 넣을 경우, 컬럼을 명시해주어야 한다.(아니면 빈 컬럼자리에 널값을 넣거나)
rollback;


--update 

-- where절이 없으면 모든 dname에 xxx값이 삽입됨. 
update dept set dname ='xxx';


update dept set dname ='개발부', loc='춘천';

select * from dept;

rollback;

update dept set dname ='개발부', loc='춘천' where deptno=10;

update dept set dname ='개발부', loc='춘천' where deptno in(10,30);


--delete 

-- where 절이 없으면 모든 로우를 다 삭제함. 
-- from은 생략 가능함.(하지만 붙이는 게 좋다.) 

delete from emp;

select * from emp;

delete emp where empno=1001;

rollback;

delete from emp where comm is null;

delete from emp where deptno in(10,30);

-- delete가 실패하는 경우(삭제가 안 되는 때)
-- 참조하는 경우(A 테이블을 B테이블이 참조하는 경우 A를 삭제할 수 없다. B가 삭제된 후에야 A도 삭제가능) 

select * from dept;

delete from dept; -- 오류남 : 10,20,30을 emp에서 참조하기 때문에 
delete from dept where deptno=60; -- 수행됨. 60은 참조하는 자식데이터가 없기 때문에 
delete from dept where deptno=50; -- 수행됨. 
delete from dept where deptno=40; -- 수행됨.

-- ** dml문은 commit전까지 rollback이 가능한데, rollback 전 ddl문이 작성될 경우 자동으로 커밋되어 rollback 불가능.

