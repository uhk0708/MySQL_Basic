# 조건에 조건 더하기
# sub query 쓸 수 있는 쿼리 명령문은
# >> group by 빼고 다~ 대부분 select,from,where

# select 절의 sub query (배태컬)
# >> 반드시 결과값이 '하나의 값(value)'
# from
# >> 반드시 결과값이 '하나의 테이블(table)' >> 별명 가져야 함
# where
# >> 반드시 결과값이 '하나의 컬럼(column)' (exists 제외)
# where 컬연서 (column, 연산자, sub query)

drop database if exists pokemon;
create database pokemon;
use  pokemon;

create table mypokemon(
	number int,
    name varchar(20)
);
select * from mypokemon;

insert into mypokemon(number,name)
values  (10, 'caterpie'), 
		(25, 'pikachu'), 
		(26, 'raichu'), 
		(133, 'eevee'), 
		(152, 'chikoirita');

create table ability(
	number int,
    type varchar(10),
    height float,
    weight float,
    attack int,
    defense int,
    speed int
);

insert into ability(number ,type,height,weight,attack,defense,speed)
VALUES  (10, 'bug', 0.3, 2.9, 30, 35, 45), 
		(25, 'electric', 0.4, 6, 55, 40, 90), 
		(26, 'electric', 0.8, 30, 90, 55, 110), 
		(133, 'normal', 0.3, 6.5, 55, 50, 55), 
		(152, 'grass', 0.9, 6.4, 49, 65, 45);


select * from mypokemon;

select*from ability;

/* sub query 시작*/

select number,name
from mypokemon;
-- where name = 'pikachu';

# 특종 아룸으로 데이터 추출 
select number,name
from mypokemon
where name = 'pikachu';

# sub query 적용
select number,name,
	(select height 
     from ability 
     where number = 25 ) as height
from mypokemon
where name = 'pikachu';
-- select sub query 는 반드시 결과값이 '하나의 값(value)' 


# from subquery 실습 

select number, rank() over(order by height) as height
from ability;

select number, height_rank
from (select number, rank() over(order by height) as height_rank
from ability) as a
where height_rank = 3;

-- from 절의 sub query는 반드시 결과값이 >> '하나의 테이블'
-- (**) 반드시 아무 별명을 가져야 함

# where 절의 sub query
# where 절의 sub query 는 반드시 결과값이 '하나의 컬럼'
# (단, exists 제외)
# 연산자와 함께 사용 (컬연서) column, 연산자, sub query
# (단, 비교연산자만 사용시, 반드시 '하나의 값')

select number
from ability;

select number
from ability
where height < (select avg(height) from ability);

select number
from ability
where attack < all(select attack from ability where type = 'electric');

select number
from ability
where attack < any(select attack from ability where type = 'electric');


# 서브쿼리로 복잡한 조건을 하나의 쿼리로 만들기

# mission (1)
select number
from ability
where weight = (select max(weight) from ability);


# mission (2)
select number
from ability
where speed < any(select attack from ability where type='electric');

SELECT number
FROM ability
WHERE speed < (SELECT max(attack) FROM ability WHERE type = 'electric');

# any() : attack  중에서 하나라도 초과하는 speed 가진 겨우 모두 포함
# max() : attack  중에서 값이 최대값보다 speed 낮은 경우 대상으로 함
-- >> 결론 : 두 번째 쿼리 결과값은 첫 번째 쿼리 결과 보다 같거나 적을 수 있음

# mission (3)
select name
from mypokemon
where exists (select * from ability where attack > defense);

select*
from ability
where attack > defense;

# mission(1)
select name ,
	   (select height from ability where number = 133) as height , 
       (select weight from ability where number = 133) as weight
from mypokemon
where name = 'eevee';

select (select name from mypokemon where number = 133)as name, height,weight
from ability
where number = 133;

# mission(2)
select number,speed
from (select number,speed,rank() over (order by speed desc) as a_speed from ability) as a
where a_speed = 2;

# mission (3)
-- 방어력이 전기 포켓몬의 모든 방어력보다 큰 번호 추출
select number
from ability
where defense > all(select defense from ability where type = 'electric');

select name
from mypokemon
where number 
in (select number
	from ability
	where defense > all(select defense from ability where type = 'electric'));
    
select name
from mypokemon
where number = (select number 
				from ability where defense > all(select defense 
												 from ability 
                                                 where type = 'electric' ));
                                                 
							
select name
from mypokemon as a
join ability as b
on a.number = b.number
where defense > all(select defense from ability where type = 'electiric');


-- 질문있어요?

drop table capability;

create table capability(
	number int auto_increment primary key,
    name varchar(20),
    type varchar(20),
    attack int,
    defense int,
    speed int
    );
    
insert into capability(name,type,attack,defense,speed) 
values  ('Pikachu', 'electric', 55, 40, 45),
		('Raichu', 'electric', 85, 50, 110),
		('Jolteon', 'electric', 65, 60, 130),
		('Zapdos', 'electric', 90, 85, 100),
		('Electabuzz', 'electric', 83, 57, 105),
		('Bulbasaur', 'electric', 49, 49, 90);
        
select *from capability;

select *
from capability
where speed < any(select attack from capability where type='electric');

SELECT *     
FROM capability
WHERE speed < (SELECT max(attack) FROM capability WHERE type = 'electric');
