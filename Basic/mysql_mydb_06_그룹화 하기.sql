# 데이터 그룹화하기

# 반드시 암기
# 셀프웨 그룹해 정렬
# select / from / where /
# group by / having(그룹 조건) / order by

# 질의 응답 count(*)와 count(1)
# >> 기능적으로 차이 없음 (결과 똑같음)

# count(*)
# 테이블에 있는 전체 행의 수를 반환함
# >> null 값이 포함된 행도 카운트에 포함됨
# >> 즉, 테이블에 있는 모든 행 대상

# count(column) 예) count(type)
# 특정 열 에 대해서 null 이 아닌 행의 수를 반환
# >> 지정된 열(type)에서 null 값이 있는 행 카운트에서 제외
# >> count(type) : type 열에서 null 아닌 값들의 총 개수 카운트

# count(*) != count(type)
# >> count(*) : 테이블 모든 행 카운트
# >> coun(type) : type 열에서 null 값 제외
# >> 즉 count(*) >= count(type)
# >> 테이블에 null 값이 없다면 >> 결과는 같음
# count(1) 행의 개수를 하나씩 세어줘


use pokemon;
-- db 사용 선언
SELECT *
FROM mypokemon;
-- 테이블 보기
drop database if exists pokemon;
-- 기존db 삭제 
-- (CRUD : DELETE (DML) / drop (DDL)

-- 새로운 db, table 생성 (CRUD의 CREATE 에 해당)

create database pokemon;

use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20),
    heigth float,
    weight float
    );
    
insert into mypokemon(number,name,type,heigth,weight)
values (10, 'caterpie','bug',0.3,2.9),
	   (25, 'pikachu', 'electric', 0.4, 6),
	   (26, 'raichu', 'electric', 0.8, 30),
	   (125, 'electabuzz', 'electric', 1.1, 30),
	   (133, 'eevee', 'normal', 0.3, 6.5),
	   (137, 'porygon', 'normal', 0.8, 36.5),
	   (152, 'chikoirita', 'grass', 0.9, 6.4),
	   (153, 'bayleef', 'grass', 1.2, 15.8),
	   (172, 'pichu', 'electric', 0.3, 2),
	   (470, 'leafeon', 'grass', 1, 25.5); 	
       
alter table mypokemon change column heigth height float;

select * from mypokemon;

select type
from mypokemon
group by type;
-- type 별로 그룹화해서 type 확인

# 그룹에 조건 걸어 데이터 추출하기
select type, count(*),count(1),round(avg(height),2),max(weight)
from mypokemon
group by type
having count(1) = 2;

-- 반드시 암기
-- select, from, where, group by, having, order by
-- 셀, 프, 웨, 그룹, 해, 오(정렬)
-- having은 그룹 함수(그룹에 조건 걸기)

select min(name),type, count(1),max(weight)
from mypokemon
where name like '%a%'
group by type;
-- count(1) , max(weight) : 그룹함수
-- group 별로 묶이지 않으면 실행되지 않음

select type, count(1),max(weight)
from mypokemon
where name like '%a%'
group by type;
-- 그룹에 조건 없음





select type, count(1),max(weight)
from mypokemon
where name like '%a%'
group by type
having max(height) > 1
order by 3;

# mission : 데이터 그룹화해서 통계 내기

# mission (1)
select type,avg(weight)
from mypokemon
where length(name) > 5
group by type
having avg(weight)>= 20
order by 2 desc;

# mission(2)
select type,min(height),max(height)
from mypokemon
where number < 200
group by type
having max(weight) >= 10 and min(weight) >= 2
order by 2 desc,3 desc;

# mission (1)
SELECT type,round(avg(height),2)
FROM mypokemon
GROUP BY type;

# mission(2)
SELECT type , round(avg(weight),2)
FROM mypokemon
GROUP BY type;

# mission(3)
SELECT type,
	   round(avg(height),2),
	   round(avg(weight),2)
FROM mypokemon
GROUP BY type;

# mission(4)
SELECT type
FROM mypokemon
GROUP BY type
HAVING avg(height)>=0.5;

# mission(5)
SELECT type
from mypokemon
GROUP BY type
having avg(weight) >= 20;

# mission(6)
SELECT type , sum(number)
FROM mypokemon
GROUP BY type;

# mission(7)
select type, count(1),count(*) -- null 값이 있으면 달라짐
from mypokemon
where height >= 0.5
group by type;

# mission(8)
select type,min(height)
from mypokemon
group by type;

# mission(9)
select type, max(weight)
from mypokemon
group by type;

# mission(10)
select type
from mypokemon
group by type
having (min(height)>0.5) and (max(weight)<30);



