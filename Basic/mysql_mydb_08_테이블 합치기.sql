# 테이블 합치기 join

# 테이블 생성 (mypokemon, ability)
drop database if exists pokemon;
create database pokemon;
use pokemon;
create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20)
);


insert into mypokemon(number,name,type)
values  (10, 'caterpie', 'bug'), 
		(25, 'pikachu', 'electric'), 
		(26, 'raichu', 'electric'), 
		(133, 'eevee', 'normal'), 
		(152, 'chikoirita', 'grass');
        
select*
from mypokemon;

create table ability(
	number int,
    height float,
    weight float,
    attack int,
    defense int,
    speed int
    );
    
insert into ability(number,height,weight,attack,defense,speed)
VALUES  (10, 0.3, 2.9, 30, 35, 45), 
		(25, 0.4, 6, 55, 40, 90), 
		(125, 1.1, 30, 83, 57, 105), 
		(133, 0.3, 6.5, 55, 50, 55), 
		(137, 0.8, 36.5, 60, 70, 40), 
		(152, 0.9, 6.4, 49, 65, 45), 
		(153, 1.2, 15.8, 62, 80, 60), 
		(172, 0.3, 2, 40, 15, 60), 
		(470, 1, 25.5, 110, 130, 95);
        
select*
from ability;

# join 함수
# inner join, left join, right join,cross join,self join

# inner join

select *
from mypokemon
inner join ability
on mypokemon.number = ability.number;

# left join , right join

select *
from mypokemon
left join ability
on mypokemon.number = ability.number;

select *
from mypokemon
right join ability
on mypokemon.number = ability.number;

# outer join
# left join + right join

select *
from mypokemon
left join ability
on mypokemon.number = ability.number
union 
select *
from mypokemon
right join ability
on mypokemon.number = ability.number;

# cross join
# on 이 없음 >> 왜? 하나씩 각각 연결되니까

select *
from mypokemon
cross join ability;

# self join

select *
from mypokemon as t1
inner join mypokemon as t2
on t1.number = t2.number;

drop database if exists pokemon;
create database pokemon;

use pokemon;

create table mypokemon(
	number int,
    name varchar(20),
    type varchar(20)
);
insert into mypokemon(number,name,type)
VALUES   (10, 'caterpie', 'bug'), 
		 (25, 'pikachu', 'electric'), 
		 (26, 'raichu', 'electric'),
		 (133, 'eevee', 'normal'), 
		 (152, 'chikoirita', 'grass');
         
CREATE TABLE ability (
number INT,
height FLOAT,
weight FLOAT,
attack INT,
defense INT,
speed int);

insert into ability(number,height,weight,attack,defense,speed)
VALUES  (10, 0.3, 2.9, 30, 35, 45), 
		(25, 0.4, 6, 55, 40, 90), 
		(125, 1.1, 30, 83, 57, 105), 
		(133, 0.3, 6.5, 55, 50, 55), 
		(137, 0.8, 36.5, 60, 70, 40), 
		(152, 0.9, 6.4, 49, 65, 45), 
		(153, 1.2, 15.8, 62, 80, 60), 
		(172, 0.3, 2, 40, 15, 60), 
		(470, 1, 25.5, 110, 130, 95);
        
select*from mypokemon;
select*from ability;

# 미션 수행하세요.

# mission(0) inner join
SELECT *
FROM mypokemon
JOIN ability
ON mypokemon.number = ability.number;
# 반드시 기억하세요
-- 같은 이름을 가진 컬럼 존재 시
-- SELECT 해 올 때 , 어떤 테이블에서 합쳐진 컬럼 가져올지 명시할 것

# mission(1)
SELECT name,attack,defense
FROM mypokemon
LEFT JOIN ability
ON mypokemon.number = ability.number;

# mission(2)
SELECT ability.number,name
FROM mypokemon
right JOIN ability
ON mypokemon.number = ability.number;


# mission (1)
SELECT type, avg(height)
FROM mypokemon
left join ability
on mypokemon.number = ability.number
GROUP BY type;

# mission(2)
select type, round(avg(weight),2)
from mypokemon
left join ability
on mypokemon.number = ability.number
group by type;

# mission(3)
select type, round(avg(height),2),round(avg(weight),2)
from mypokemon
left join ability
on mypokemon.number = ability.number
group by type;

# mission(4)
select mypokemon.number,name,attack,defense
from mypokemon
left join ability
on mypokemon.number = ability.number
where mypokemon.number >= 100;

# mission(5)
select name , (attack+defense)
from mypokemon
left join ability
on mypokemon.number = ability.number
order by (attack+defense) desc;

# mission(6)
select name
from mypokemon
left join ability
on mypokemon.number = ability.number
order by ability.speed desc 
limit 1;






