--형변환함수


  --to_number 문자형을 숫자형으로 변환 

select to_number('1234')
 from dual;

--to_number의 쓰임새

--'12,345'는 가독성을 위해 ,를 사용, '' 안에 있는 문자열. 
select '12,345',
       '12345' +100,  -- '12345'는 문자열이지만, 숫자형으로 자동형변환되어서 연산이 가능하다.  
--       '12,345' +100, -- 위와는 다르게 가운데 ','가 삽입되어서 숫자형으로 변환이 안 된다. 이런 경우 to_number로 형변환을 해야 한다. 
       to_number('12,345','99,999')+100 -- to_number함수로 형변환을 하면 ','가 삽입되어도 포맷형식만 주면 변환이 가능하다.  
 from dual;
 
 
