-- 코드를 입력하세요
SELECT B.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(B.TOTAL_SALES) TOTAL_SALES
FROM AUTHOR A
LEFT JOIN (
    SELECT A.AUTHOR_ID, A.CATEGORY, B.SALES*A.PRICE TOTAL_SALES
    FROM BOOK A
    LEFT JOIN BOOK_SALES B
    ON A.BOOK_ID = B.BOOK_ID
    WHERE DATE_FORMAT(B.SALES_DATE, '%Y-%m') = '2022-01'
) B
ON A.AUTHOR_ID = B.AUTHOR_ID
GROUP BY B.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY
ORDER BY B.AUTHOR_ID, B.CATEGORY DESC