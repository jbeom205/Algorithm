-- USED_GOODS_BOARD: 중고거래 게시판 정보, USED_GOODS_FILE:게시판 첨부파일 정보
-- BOARD_ID:게시글ID, WRITER_ID:작성자ID, TITLE:게시글 제목, CONTENTS:게시글 내용, PRICE:가격, CREATED_DATE:작성일, STATUS:거래상태, VIEWS:조회수
-- FILE_ID:파일 ID, FILE_EXT:파일 확장자, FILE_NAME:파일 이름, BOARD_ID:게시글 ID
-- USED_GOODS_BOARD와 USED_GOODS_FILE 테이블에서 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회하는 SQL문 작성
-- 첨부파일 경로는 FILE_ID 기준으로 내림차순 정렬
-- 기본 파일경로를 /home/grep/src/ 이고
-- 게시글ID(BOARD_ID)를 기준으로 디렉토리가 구분되고, 파일이름은 파일ID, 파일이름, 파일확장자로 구성되도록 출력
-- 조회수가 가장 높은 게시물은 하나만 존재함

-- 조회수가 가장 높은 게시물 (B0008)
# SELECT UGB.BOARD_ID
# FROM USED_GOODS_BOARD AS UGB
# ORDER BY UGB.VIEWS DESC
# LIMIT 1;

-- 조회수가 가장 높은 게시물의 첨부파일 정보 목록
# SELECT UGF.BOARD_ID, UGF.FILE_ID, UGF.FILE_NAME, UGF.FILE_EXT
# FROM USED_GOODS_FILE AS UGF
# WHERE UGF.BOARD_ID = (SELECT UGB.BOARD_ID
#                     FROM USED_GOODS_BOARD AS UGB
#                     ORDER BY UGB.VIEWS DESC
#                     LIMIT 1);
                    
-- 조회수가 가장 높은 게시물의 첨부파일 경로 목록
SELECT CONCAT("/home/grep/src/", UGF.BOARD_ID,"/", UGF.FILE_ID, UGF.FILE_NAME, UGF.FILE_EXT) AS FILE_PATH
FROM USED_GOODS_FILE AS UGF
WHERE UGF.BOARD_ID = (SELECT UGB.BOARD_ID
                    FROM USED_GOODS_BOARD AS UGB
                    ORDER BY UGB.VIEWS DESC
                    LIMIT 1)
ORDER BY UGF.FILE_ID DESC;


