-- MAX 사용
SELECT *
FROM FOOD_PRODUCT
WHERE PRICE IN (SELECT MAX(PRICE) FROM FOOD_PRODUCT)

-- ORDER BY 사용
-- SELECT *
-- FROM FOOD_PRODUCT
-- ORDER BY PRICR DESC LIMIT 1