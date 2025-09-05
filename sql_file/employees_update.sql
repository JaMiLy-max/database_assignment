-- 일시적으로 Safe Update 해제
set sql_safe_updates=0;
-- 2. `PM` 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.
UPDATE employees
SET salary = salary * 1.10 -- 10퍼센트 인상 1 + 0.1
WHERE position = 'PM';
-- 혜린 99000.00
SELECT * FROM employees WHERE position = 'PM';

-- 3. 모든 'Backend' 직책을 가진 직원의 연봉을 5% 인상하세요.
UPDATE employees
SET salary = salary * 1.05
WHERE position = 'Backend';