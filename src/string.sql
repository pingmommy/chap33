 -- 문자조작함수 


 -- contact : 문자값을 연결한다. (다른 언어에서 문자열 '+' 문자열) 
 -- instr: 특정 문자의 위치 값을 반환한다.
 
 
  -- substr : 부분문자열을 구한다(문자를 잘라서 추출) (대상문자, 시작문자위치, 시작문자부터 원하는 글자수)
 
 -- '만세' 만 추출 
 select substr('대한민국 만세',6,2)
  from dual;
  

-- '민국' 만 추출 
select substr('대한민국 만세',3,2)
  from dual;

--임플로이 명단에서 성은 빼고 이름만 추출   
select ename, substr(ename,2) 
  from emp;

-- '민국'의 인덱스를 추출  
 select instr('대한민국 만세','민국')
  from dual;

--문자열 20자리를 만들고 해당문자열을 삽입한 후 남은 자리는 왼 쪽부터 '#'으로 채운다.   
 select lpad('대한민국 만세',20,'#')
   from dual;
   
--문자열 20자리(바이트)를 만들고 해당문자열을 삽입한 후 남은 자리는 오른쪽 쪽부터 '#'으로 채운다.   
 select rpad('대한민국 만세',20,'#')
   from dual;   