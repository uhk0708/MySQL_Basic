show databases;

drop database if exists pokemon;
create database pokemon;
use pokemon;

create table mypokemon(
		number int,
        name varchar(20),
        type varchar(20),
        attack int,
        defense int
);

create table friendpokemon(
		number int,
        name varchar(20),
        type varchar(20),
        attack int,
        defense int
);

show tables;

insert into mypokemon(number, name,type,attack,defense)
values  (10, 'caterpie', 'bug', 30, 35),
		(25, 'pikachu', 'electric', 55, 40),
		(26, 'raichu', 'electric', 90, 55),
		(133, 'eevee', 'normal', 55, 50),
		(152, 'chikoirita', 'grass', 49, 65);
        
insert into friendpokemon(number, name,type,attack,defense)      
VALUES  (26, 'raichu', 'electric', 80, 60),
		(125, 'electabuzz', 'electric', 83, 57),
		(137, 'porygon', 'normal', 60, 70),
		(153, 'bayleef', 'grass', 62, 80),
		(172, 'pichu', 'electric', 40, 15),
		(470, 'leafeon', 'grass', 110, 130);
        
        
# union / union all


# union all : 두 테이블 합치기(중복 허용)
select name
from mypokemon
union all
select name
from friendpokemon;

# union(중복 제거)
select name
from mypokemon
union
select name
from friendpokemon;


# union 에서 order by 사용
select number , name , attack
from mypokemon
union
select number , name , attack
from friendpokemon
order by number ;
# order ny는 query 가장 마지막에 작성
# >> query A 문에 가져온 컬럼으로만 가능(**)

# 데이터에서 데이터 빼기
# 교집합, 차집합 >> join 도움 받아야 함

select a.name
from mypokemon as a
inner join friendpokemon as b
on a.name = b.name;
# 오직 'name' 열의 값만 일치하는 경우에 한해
# 두 테이블 겹합
# 결론: 같은 이름을 가진 포켓몬의 정보만 선택 

# 교집합을 확인하고 싶은 컬럼 
-- 모두 다 기준으로 합쳐줘야 함

select a.name
from mypokemon as a
inner join friendpokemon as b
on  (a.number = b.number) and (a.name = b.name) and
	(a.type = b.type) and (a.attack = b.attack) and
	(a.defense = b.defense);
# 두 테이블 레코드가 여러 열에 일치해야만 결과 포함
# 모든 주어진 조건에 일치해야만 포켓몬 이름 반환

# 차집합
# b is null 의미 >> 순수하게 a의 값만 추출
# 전체 a에서 공통으로 있는 데이터(a에 있는데,b에도 있는 데이터) 빼면
# >> a에는 있지만 b에는 없는 데이터 가져와

select a.name
from mypokemon as a
left join friendpokemon as b
on a.name = b.name
where b.name is null;

select a.name
from mypokemon as a
left join friendpokemon as b
on  (a.number = b.number) and (a.name = b.name) and
	(a.type = b.type) and (a.attack = b.attack) and
	(a.defense = b.defense)
where b.name is null;


# mission(1)

select type
from mypokemon 
union
select type
from friendpokemon;


# union all : 중복 포함
select number,name
from mypokemon 
where type = 'grass'
union all
select number,name
from friendpokemon
where type = 'grass';

# mission
# 여러 테이블 다뤄서 원하는 값 추출

select*from mypokemon;

# mission (1)

# 쿄집합
select a.name
from mypokemon as a
inner join friendpokemon as b
on a.number = b.number;

# mission (2)
select a.name
from mypokemon as a
left join friendpokemon as b
on a.name = b.name
where b.name is null;

select a.name
from mypokemon as a
left join friendpokemon as b
on  (a.number = b.number) and (a.name = b.name) and
	(a.type = b.type) and (a.attack = b.attack) and
	(a.defense = b.defense)
where b.name is null;

