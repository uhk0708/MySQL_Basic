# 데이터 가져오기
# 1. SELECT
# 가져올 데이터를 선택하는 키워드

select 123;
select 1+2+3;
select "abc";

# select 활용, 컬럼 선택
show databases;
use pokemon;

show tables;

select*
from myoldpokemon;

drop database if exists pokemon;

create database pokemon;

use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20),
    height float,
    weight float,
    attack float,
    defense float,
    speed float
);

insert into mypokemon(number,name,type,height,weight,attack,defense,speed)
values (10,'caterpie','bug',0.3,2.9,30,35,45),
	   (25,'pikachu','electric',0.4,6,55,40,90), 
       (26,'raichu','electric',0.8,30,90,55,110), 
       (133,'eevee','normal',0.3,6.5,55,50,55), 
       (152,'chikorita','grass',0.9,6.4,49,65,45) 
; 

select * from mypokemon;

# select - from 사용 예제

# table에서 특정 컬럼 내용 가져오기
select name
from mypokemon;

# table에 전체 값 확인
select * from mypokemon;

# as : 별칭 만들기
select number as national_number
from mypokemon;

# 데이터 일부 가져오기 limit
# limit : 가져올 데이터 row 개수 지정 키워드

select number,name
from mypokemon;

select number,name
from mypokemon
limit 2;

# 중복제거하기
# DISTINCT : 중복 데이터 제외 >> 같은 값은 한번만

select type
from mypokemon;

select distinct type
from mypokemon;

# 이제부터 미션 하세요.
# MISSION (1)
select 123*456; # 56088

# MISSION (2)
select 2310/30; # 77.0000

# MISSION (3)
select 'pikachu' as 'pokemon'; 

# MISSION (4)
select * from mypokemon;

# MISSION (5)
select name from mypokemon;

# MISSION (6)
select name,height,weight
from mypokemon;

# MISSION (7)
select height
from mypokemon;


select distinct height
from mypokemon;

# MISSION (8)
select name , attack
from mypokemon;

select name , attack*2 as attack2
from mypokemon;

# MISSION (9)
select name as '이름'
from mypokemon;

# MISSION (10)
select attack as '공격력',defense as '방어력'
from mypokemon;

# MISSION (11)
select * from mypokemon;

select round(height*100,2) as 'height(cm)'
from mypokemon; 

# MISSION (12)
select *
from mypokemon
limit 1;

# MISSION (13)
select name as '영문명', 
		height as '키(m)', 
        weight as '몸무게(kg)'
from mypokemon
limit 2;


# MISSION (14)
select name as name, (attack+defense+speed)
as 'total'
from mypokemon;

# MISSION (15)
select name ,round(weight/pow(height,2),2)  as 'BMI 지수' 
from mypokemon;

select pow(10, 2);
select power(10,2);


select 10^2;
# 다르게 나오네
# 이유? mysql에서 '^' 거듭제곱 연산자가 아닌 bit xor 연산자

