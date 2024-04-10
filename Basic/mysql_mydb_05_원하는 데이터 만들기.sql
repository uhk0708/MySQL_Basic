# 원하는 데이터 만들기


drop database if exists pokemon;

create database pokemon;
use pokemon;

CREATE TABLE mypokemon (
number int,
name varchar(20),
type varchar(20),
	height float,
	weight float,
	attack float,
	defense float,
	speed float
);

INSERT INTO mypokemon (number, name, type, height, weight, attack, defense, speed)
VALUES  (10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
		(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
		(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
		(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
		(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);




# 예) 10번 이상 구매한 , vip 고객 리스트 추출해줘.(조건)
# 예) 10번 이상 구매한 , vip 고객을 [구매금액 순] 으로 리스트 추출해줘
# 조건 + 순서 > 순서를 정해 원하는 데이터 가져오기
# 순서를 정하는 방법 >> order by 

# ORDER BY

use pokemon;

SELECT *
FROM mypokemon;

SELECT number,name
FROM mypokemon
ORDER BY number;

SELECT number,name
FROM mypokemon
ORDER BY number ASC;
# default (기본값) ASC 오름차순

SELECT number,name
FROM mypokemon
ORDER BY number DESC;
# DESC 내림차순(descend)

select number , name, attack,defense
from mypokemon
order by attack desc,defense;
# 첫번째 기준 attack 내림차순, 두번째 기준 defense 오름차순

select number,name,attack,defense
from mypokemon
order by 3 desc ,4; 
# order by 사용시, 순서를 정하기 때문에 인덱싱 기법 사용 가능
# 1,2,3,4 순 인덱스가 됨 3:attack, 4:defense

# 순위 rank
# 예) 10번 이상 구매한 vip 고객, 구매금액 순으로 [베스트 100] 리스트 추출해줘

# RANK()OVER() >> RANK()OVER(ORDER BY ... DESC) # DESC 를 많이 쓰는 이유 예) 추천수,조회수

select name,attack,
	rank() over(order by attack desc) as attack_rank
from mypokemon;

# rank 3총사
# rank(***) , dense_rank(**) , row_number

select name,attack,
	dense_rank() over(order by attack desc) as attack_rank
from mypokemon;

select name,attack,
	row_number() over(order by attack desc) as attack_rank
from mypokemon;

select name, attack,
	rank() over (order by attack desc) as rank_rank,
    dense_rank() over(order by attack desc) as rank_dense_rank,
    row_number() over (order by attack desc) as rank_row_number
from mypokemon; 

# rank, dense_rank,row_number
# 1) rank : 공동 순위가 있으면 다음 순위로 건너 뜀 (1,1,3,3,5,...)
# 2) dense_rank : 공동 순위가 있어도 다음 순위로 건너 뛰지 않음 (1,2,2,3,3,4,..)
# 3) row_number : 공동 순위 따위는 무시(1,2,3,4,5,...)

# 함수

SELECT LOCATE("A","AVC") AS LOCATE;
# SELECT : DML (데이터 조작 언어: data manupulated language)
# locate : 위치 반환

select substring("abc",2) as substr;
# substring = sub(부분) string(문자열) >> 문자열 일부 추출
# 2번째 문자부터 추출

# right,left 숫자 정한 데 '까지'
select right("abc",2);
# right() : 문자열의 오른쪽에서 2번째 문자까지 반환

select left("abc",2);
# left() : 문자열의 왼쪽에서 2번째 문자까지 반환

# upper, lower 대문자,소문자 전환
select upper("abc") as 대문자;
select lower("ABC") as 소문자;

# length : 글자의 크기 >> 글자 수 반환
select length("abc") as len;

# concat() : 문자열 합치기(***)
select concat("abc","def") as concatenate;
# oracle   ms sql server'+' >> concat

# replace() : 특정 문자 대체
select replace("abc","a","z") as 특정문자대체;

# bts_music
# butter table 생성, lyric 만들기

show databases;

create database bts_music;

use bts_music;

create table butter(
	part int,
    lyric varchar(100)
);

select*
from butter;

insert into butter(part,lyric)
values (1, "Smooth like butter"),
	   (2, "Like a criminal undercover"),
       (3, "Gon' pop like trouble"),
       (4, "Breakin' into your heart like that"),
       (5, "Cool shade stunner");
       
select * from butter;

# (1) locate
select part, locate('i',lyric) as location
from butter;

# (2) substring
select part,substring(lyric,3)
from butter;
# 3번째 문자부터 반환

select part,length(lyric) 
from butter;

select part,substring(lyric,100)
from butter;
# 문자열 길이보다 크면>>아무 것도 안나옴

# (3)right, left (꼭 기억 ~까지>> 왼쪽/오른쪽에서 ~번 까지)
select part,right(lyric,3),left(lyric,3)
from butter;

# (4) upper,lower : 대문자 / 소문자 변환
select part, upper(lyric),lower(lyric)
from butter;

# (5) concat : 문자열 합치기 (***)
select part,
	concat(left(lyric,3),right(lyric,3)) as first_last
from butter;

# (6) replace : 특정 문자열 교체(대체) (***)
select part, replace(lyric, " ", "_") as underbar
from butter;

use pokemon;

select*from mypokemon;
# 기존 테이블 속성 및 내용 확인

select count(*)
from mypokemon;
# 기존 내용(정보) 확인 위해 >> '행' 개수 확인
# 왜? row 단위로 값(values) 들이 입력되어 저장되어 있으니까
# (기억해 주삼) insert into (삽입해) 테이블(속성: ex)number,name,type,..)
# 뭘? values (값들을) (속성 순서대로 값들을 입력했으니깐)



drop database if exists pokemon;

create database pokemon;
use pokemon;

CREATE TABLE mypokemon (
number int,
name varchar(20),
type varchar(20),
	height float,
	weight float,
	attack float,
	defense float,
	speed float
);

INSERT INTO mypokemon (number, name, type, height, weight, attack, defense, speed)
VALUES  (10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
		(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
		(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
		(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
		(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);

select*
from mypokemon;

alter table mypokemon
add column friendship float;
# alter : 테이블 속성 변경 >> 여기서는 컬럼 추가 (add column)
# ** 새로운 속성명(friendship) 명시하고 반드시 데이터 타입 명기

# insert into mypokemon(friendship)
# values (-1.455),
#	   (124.78),
#       (30.289),
#       (-10.67),
#       (15.988);
# 오잉? 결과가 이상해. null 값 천지야.

# 하나씩 수정할 때
# update mypokemon
# set friendship = -1.455
# where number = 10;  

# 한꺼번에 못 바꾸나? (5개 바꿔야 하는데?)
# case 문
update mypokemon
set friendship = case number
	when 10 then -1.455
	when 25 then 124.78
    when 26 then 30.289
    when 133 then -10.67
    when 152 then 15.988
end
where number in (10,25,26,133,152);
       
       
select * 
from mypokemon;


# 숫자형 

# abs() : 절대값
select name, friendship, abs(friendship)
from mypokemon;

# ceiling (천장 올림), floor(바닥, 내림) 
select name, friendship, ceiling(friendship),floor(friendship)
from mypokemon;

# round (반올림) 와 truncate(버림)
# 소수점 몇 째자리 표기(자릿수) 있음 (,n)
select name, friendship , round(friendship,1) as round_1, truncate (friendship,1) as trunc_1
from mypokemon;

# 자릿수에 '0'을 넣는다면? 정수로 반환
select name, friendship , round(friendship,0) as round_1, truncate (friendship,0) as trunc_1
from mypokemon;

# power : 제곱 (자릿수 존재)
select name,number,power(number,2) as 제곱값
from mypokemon;

# mod(num1,num2) >> num1에서 num2 나눈 나머지 반환
select name,number,mod(number,2)
from mypokemon; 

# 날짜형 데이터

# now() : 현재 날짜와 시간 반환
select now();

# current_date , current_time : 현재 날짜/ 현재 시간 반환
# 주의 : 매개변수, 즉 입력 값이 필요 없음
select now(), current_date(),current_time();

# year,month,monthname : 날짜의 연도, 날짜의 월, 날짜의 월(영어로)
select now(),year(now()),month(now()),monthname(now());

# dayname, dayofmonth,dayofweek,week
# dayname: 날짜의 요일( 영어로)
# dayofmonth : 날짜의 일 반환
# dayofweek : 날짜의 요일 >>> 숫자로 변환 , 일요일이 '1'임
# week : 날짜가 해당 연도 몇 번째 주(week) 인지 반환

select now(),dayname(now()),dayofweek(now()),week(now());

# hour , minute, second : 시간의 시/분/초 반환
select now(),hour(now()),minute(now()),second(now());

# date_format : 날짜 포맷
select date_format(now(),'%Y년 %m월 %d일%H시%i분%s초') as 한국어_날짜_형식;
select date_format(now(),'%y년 %m월 %d일%h시%i분%s초') as 한국어_날짜_형식;

select date_format('2024-04-03 02:38:58','%Y년 %m월 %d일%H시%i분%s초') as 한국어_날짜_형식;

# 시간 차이 (datediff, timediff)
# datediff (diff: diffrence 의미) : date1 - date2
# timediff : time1 - time2

select datediff(now(), "2024-09-10 18:00:00") as 수료_d_day,
       timediff(now(), "2024-09-10 18:00:00") as 수료_d_time;
       
       
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
			number INT,
			name VARCHAR(20),
			type VARCHAR(10),
			attack INT,
			defense INT,
			capture_date DATE
);
INSERT INTO mypokemon (number, name, type, attack, defense, capture_date)
VALUES (10, 'caterpie', 'bug', 30, 35, '2019-10-14'),
(25, 'pikachu', 'electric', 55, 40, '2018-11-04'),
(26, 'raichu', 'electric', 90, 55, '2019-05-28'),
(125, 'electabuzz', 'electric', 83, 57, '2020-12-29'),
(133, 'eevee', 'normal', 55, 50, '2021-10-03'),
(137, 'porygon', 'normal', 60, 70, '2021-01-16'),
(152, 'chikoirita', 'grass', 49, 65, '2020-03-05'),
(153, 'bayleef', 'grass', 62, 80, '2022-01-01');

show databases;

use pokemon;

select *
from mypokemon;

# mission(1)
select name,length(name) as name_len
from mypokemon
order by name_len asc;

# mission(2)
select name, 
	rank() over (order by defense desc) as defense_rank
from mypokemon;
# 공동순위가 있으면 다음 순서로 건너 뜀

# mission(3)
select name, datediff('2022-02-14',capture_date) as days
from mypokemon;

# mission 두번째


# mission(1)
select right(name,3) as last_char
from mypokemon;

# mission(2)
select left(name,2) as left_2
from mypokemon;

# mission(3)
select name, replace(name,'o','O') as bigO
from mypokemon
where name like '%o%';

# mission(4)
select name, upper(concat(left(type,1),right(type,1))) as type_code
from mypokemon;

# mission(4) 응용
select distinct name, upper(concat(left(type,1),right(type,1))) as type_code
from mypokemon;


# mission(5)
select *
from mypokemon
where length(name) > 8;

# mission(6)
select round(avg(attack)) as avg_of_attack
from mypokemon;

# mission(7)
select floor(avg(defense)) as avg_of_defense
from mypokemon;

# mission(8)
select name,pow(attack,2) as attack2
from mypokemon
where length(name) < 8;

# mission(9)
select name, mod(attack,2) as div2
from mypokemon;

# mission(10)
select abs(attack-defense) as diff
from mypokemon
where attack <= 50;

# mission(11)
select current_date() as now_date ,current_time() as now_time;

# mission(12)
select dayofmonth(capture_date) as day_num, monthname(capture_date) as month_eng
from mypokemon;

# mission(13)
select dayofweek(capture_date) as day_num,dayname(capture_date) as day_eng
from mypokemon;

# mission(14)
select year(capture_date),month(capture_date),day(capture_date)
from mypokemon;