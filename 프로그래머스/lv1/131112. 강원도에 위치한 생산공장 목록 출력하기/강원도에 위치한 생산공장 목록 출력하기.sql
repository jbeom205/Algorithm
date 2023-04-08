-- 코드를 입력하세요
-- FACTORY_ID:공장ID, FACTORY_NAME:공장이름, ADDRESS:주소, TLNO:전화번호
-- 강원도에 위치한 식품공장의 공장ID, 공장이름, 주소 조회
-- 결과는 공장 ID를 기준으로 오름차순 정렬
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS like '강원도%'
ORDER BY FACTORY_ID ASC;