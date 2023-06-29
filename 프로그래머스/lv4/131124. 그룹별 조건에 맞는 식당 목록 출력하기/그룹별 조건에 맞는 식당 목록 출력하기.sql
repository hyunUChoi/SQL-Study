-- 코드를 입력하세요
SELECT A.MEMBER_NAME, D.REVIEW_TEXT, D.REVIEW_DATE
FROM MEMBER_PROFILE A
RIGHT JOIN (
    SELECT B.MEMBER_ID, B.REVIEW_TEXT, DATE_FORMAT(B.REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
    FROM REST_REVIEW B
    LEFT JOIN (
        SELECT MEMBER_ID, RANK() OVER(ORDER BY COUNT(*) DESC) RANKING
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
    ) C
    ON B.MEMBER_ID = C.MEMBER_ID
    WHERE C.RANKING = 1
) D
ON A.MEMBER_ID = D.MEMBER_ID
ORDER BY D.REVIEW_DATE, D.REVIEW_TEXT