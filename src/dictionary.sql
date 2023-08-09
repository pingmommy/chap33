

-- user_ : 자신의 계정이 소유한 객체 등에 관한 정보 조회 

select * from user_tables;

desc user_tables;

select table_name from user_tables;

--user 정보 조회 
desc user_users;

-- 접속한 유저에 대한 정보조회
select username from user_users;

-- 모든 유저에 대한 정보조회 
select username from all_users;

--dba에 접근가능한 유저에 대한 정보조회 
select username from dba_users;