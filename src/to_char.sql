-- 데이터베이스에는 어떤 데이터가 있나? 수치, 문자열, 날짜(수치이면서 문자열같은)

-- 형변환함수 

-- to_char : 날짜형, 숫자형을 문자형으로 변환한다. (숫자or날짜데이터,'출력형식) 

select to_char(123),
       to_char(123,'00000'), -- 주어진 숫자를 출력형식에 맞게 출력 => 00123
       to_char(12345,'99999'),
       to_char(12345,'99,999'),
       to_char(12345,'L99,999') -- 원화로 출력 =>W12,345       
  from dual;
  
  -- to_char를 활용하여 날짜를 문자형으로 변환하기
select sysdate,
       to_char(sysdate,'yyyy/mm/dd/hh:mi:ss')
  from dual;
  