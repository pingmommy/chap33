
select '12'+10
 from dept;
 
 
 -- sql은 node처럼 '12'+10 이런 식의 연산식에서 '12'를 수치로 변환하여 연산을 수행한다.(자바에서는 문자열) 
 select '12'+10,
         '12'||10,
         '12'*10,
         '12'/10
    from dual; -- oracle은 from절이 필수이기 때문에 계산목적으로 dual 테이블을 쓴다. 
 
    
 --02. 숫자함수 
 
 --floor :내림수.         
select floor(10.5), floor(-10.5) -- -10.5는 -11을 반환함. 
   from dual;
 
 
--round : 특정자리수까지 반올림한다.    
select round(10.5), round(-10.5),round(34.355677,1), round(34.355677,-1),round(35.355677,-1)
  from dual;

-- trunc : 특정자릿수까지 잘라낸다.   
select trunc(10.5), trunc(-10.5), trunc(34.45677,1),trunc(34.35677,-1),trunc(35.35677,-1)
  from dual;


--power :(m,n)m의 n승을 반환한다.
select power(2,3), power(10,3)
  from dual;

--mod : 입력받은 수를 나눈 나머지값을 반환한다. 
select mod(10,3)
  from dual;

-- ceil : 소수점을 올림.   
select ceil(10.5), ceil(-10.5)
  from dual;
  
  
select trunc(dbms_random.value()*100)
  from dual;
  
select 10/3, trunc(10/3)as trunc, ceil(10/3)as ceil, mod(10,3) as mod
  from dual;


-- 03. 문자처리함수 

-- upper : 대문자로 변환
-- lower 소문자로 변환
--inicap : 첫 글자만 대문자, 나머지는 소문자 

select * from country

-- where name like '%korea%'; 'Korea'라서 검색결과 안 나옴. 

where lower(name) like '%korea%'; -- 데이터를 다 소문자로 변환 


-- length : 문자열길이를 반환(바이트와 상관없이 문자갯수를 반환) 
-- lengthb : 문자열 크기를 반환(바이트계산) => 실무에서 쓸 일 거의 없음. 

select length('A'), lengthb('A')
  from dual;
  
 select length('가A'), lengthb('가A')  --각각 2,4를 반환
  from dual; 
  
 select ename, length(ename), lengthb(ename) -- 각각 3,9를 반환 
 from emp;
 

 
