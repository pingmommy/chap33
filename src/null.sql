
-- null을 처리하는 nvl함수
select nvl(null,100),
       nvl(99,100)
  from dual;
  
select nvl2(null,100,200),
       nvl2(99,100,200)
  from dual;  
  
  
  -- 두 매개변수가 같으면 null이 출력, 같지 않으면 첫 번째 매개변수 출력 
 select nullif(100,100),
        nullif(100,200) 
   from dual;
 
 
 -- 최초로 널이 아닌 값이 출력   
   select coalesce(null, null, null, 99, null, 100)
     from dual;
  