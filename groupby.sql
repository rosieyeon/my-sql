# 고양이와 강아지 마리 수 카운트
SELECT ANIMAL_TYPE, COUNT(*)
FROM ANIMAL_INS
WHERE ANIMAL_TYPE = 'Cat' OR ANIMAL_TYPE = 'Dog'
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE

# 두번 이상 쓰인 이름의 갯수 카운트
SELECT NAME, COUNT(*)
FROM ANIMAL_INS
WHERE (NAME IS NOT NULL)
GROUP BY NAME
HAVING COUNT(*) >1
ORDER BY NAME

# 9-19 사이에 입양된 동물 카운트
SELECT HOUR(DATETIME), COUNT(*)
FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) BETWEEN 9 AND 19
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME)

# 각 시간대별로 입양이 발생한 횟수 카운트
SET @HOUR = -1;
SELECT (@HOUR := @HOUR + 1) AS HOUR , 
(SELECT COUNT(HOUR(DATETIME)) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @HOUR) AS COUNT 
FROM ANIMAL_OUTS
WHERE @HOUR < 23;