-- 코드를 입력하세요
#  게시글 제목, 게시글 ID, 댓글 ID, 댓글 작성자 ID, 댓글 내용, 댓글 작성일
# USED_GOODS_BOARD  : TITLE, BOARD_ID, 
# USED_GOODS_REPLY  : REPLY_ID, WRITER_ID, CONTENTS, CREATED_DATE
# where USED_GOODS_BOARD.CREATED_DATE 2022년 10월
# 결과는 댓글 작성일을 기준으로 오름차순 정렬해주시고, 댓글 작성일이 같다면 게시글 제목을 기준으로 오름차순 정렬해주세요.
SELECT ugb.TITLE, ugb.BOARD_ID, ugr.REPLY_ID, ugr.WRITER_ID, ugr.CONTENTS, DATE_FORMAT(ugr.CREATED_DATE, "%Y-%m-%d") as CREATED_DATE
from USED_GOODS_BOARD as ugb, USED_GOODS_REPLY as ugr
where ugb.BOARD_ID = ugr.BOARD_ID
  and ugb.CREATED_DATE between '2022-10-01' and '2022-10-31'
order by ugr.CREATED_DATE asc, ugb.TITLE asc