-- CASE절에 MAX를 사용하는 이유
-- MAX를 사용하지 않으면 조건에 만족하는 임의의 1개의 행에 대한 결과를 반환
-- MAX를 사용하는 경우 모든 결과 중 하나라도 조건에 만족하면 TRUE 반환
SELECT CAR_ID
     , CASE
        WHEN MAX(DATE('2022-10-16') BETWEEN START_DATE AND END_DATE)
        THEN '대여중'
        ELSE '대여 가능'
      END AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC