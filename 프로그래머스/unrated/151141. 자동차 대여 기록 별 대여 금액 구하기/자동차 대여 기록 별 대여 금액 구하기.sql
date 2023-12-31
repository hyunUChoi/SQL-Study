-- 코드를 입력하세요
SELECT A.HISTORY_ID
     , ROUND((DATEDIFF(A.END_DATE, A.START_DATE) + 1) * B.DAILY_FEE * 
        (1 - IF(C.DISCOUNT_RATE IS NULL, 0, C.DISCOUNT_RATE/100))) FEE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A
LEFT JOIN CAR_RENTAL_COMPANY_CAR B
ON A.CAR_ID = B.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C
ON B.CAR_TYPE = C.CAR_TYPE
AND C.DURATION_TYPE = (
    CASE
        WHEN DATEDIFF(A.END_DATE, A.START_DATE)+1 >= 90 THEN '90일 이상'
        WHEN DATEDIFF(A.END_DATE, A.START_DATE)+1 >= 30 THEN '30일 이상'
        WHEN DATEDIFF(A.END_DATE, A.START_DATE)+1 >= 7 THEN '7일 이상'
        ELSE NULL
    END
)
WHERE B.CAR_TYPE = '트럭'
ORDER BY FEE DESC, A.HISTORY_ID DESC