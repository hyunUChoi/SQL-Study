-- 코드를 입력하세요
SELECT A.TITLE TITLE
     , A.BOARD_ID BOARD_ID
     , B.REPLY_ID REPLY_ID
     , B.WRITER_ID WRITER_ID
     , B.CONTENTS CONTENTS
     , DATE_FORMAT(B.CREATED_DATE, '%Y-%m-%d') CREATED_DATE
FROM USED_GOODS_BOARD A
JOIN USED_GOODS_REPLY B
ON A.BOARD_ID = B.BOARD_ID
WHERE DATE_FORMAT(A.CREATED_DATE, '%Y-%m') = '2022-10'
ORDER BY DATE_FORMAT(B.CREATED_DATE, '%Y-%m-%d'), A.TITLE