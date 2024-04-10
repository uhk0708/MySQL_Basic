# 조건에 맞는 데이터 가져오기
# 조건 : where 

select 1 = 1;
select 0 = 1;
# 여기서 1은 true, 0은 false

show databases;
use pokemon;

select * from mypokemon;

select number
from mypokemon;

select * from mypokemon;

# 요청 : pikachu의, number 찾아줘
select number
from mypokemon
where name = 'pikachu';

# 요청 : 속도가 50보다 큰, 포켓몬 이름 찾아줘
select name
from mypokemon
where speed > 50;

# 요청 : 전기타입이 아닌, 포켓몬 이름 찾아줘
select name
from mypokemon
where not(type='electric');

select name
from mypokemon
where type != 'electric';

# 요청 : 속도가 100이하인 전기 타입, 포켓몬 이름으 찾아줘
select name
from mypokemon
where (speed<=100) and (type = 'electric') ;

# 요청 : 벌레 타입 이거나 노말 타입 인, 포켓몬을 찾아줘
select name
from mypokemon
where (type='bug') or (type='normal');

# 요청 : 속도가 100이하이고 벌레타입이 아닌, 포켓몬을 찾아줘
select name
from mypokemon
where (speed<=100) and not(type='bug');

select name
from mypokemon
where (speed<=100) and (type!='bug');

# 요청 : 속도가 50과 100 사이인, 포켓몬 이름 찾아줘.
select name
from mypokemon
where speed between 50 and 100;

# 요청 : 벌레타입 이거나 노말 타입인 포켓몬의 이름을 찾아주세요.
select name
from mypokemon
where type in ('bug','normal');

select name
from mypokemon
where (type='bug')or(type='normal');


# 요청 : 이름이 'chu'로 끝나는, 포켓몬 이름을 찾아주세요.
select name
from mypokemon
where name like '%chu';

# 요청 : 이름에 'a'로 끝나는, 포켓몬 이름을 찾아주세요.
select name
from mypokemon
where name like '%a%';

# 요청 : 이름이 'c'로 시작하는, 포켓몬 이름을 찾아주세요.
select name
from mypokemon
where name like 'c%';

# null 데이터 다루기
# null 값이 지정되지 않음 >> 미정

select *
from mypokemon;

insert into mypokemon (name,type)
values ('kkobuki',"");

select*
from mypokemon;

# 요청 : number 가 nll 인, 포켓몬의 이름을 찾아줘
# is null

select name
from mypokemon
where number is null;

select name
from mypokemon
where number = null;
# 잉? 결과가 안나옴 >> 사용 불가

# 요청 : type이 nll이 아닌, 포켓몬의 이름을 찾아줘
# is not null

select name
from mypokemon
where number is not null;
# 아하~ 공백도 문자니까 null이 아니여


select*
from mypokemon;

# 미션 수행 (in~class pratice)

DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
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
VALUES (10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);

show tables;
select*
from mypokemon;

# mission(1)
select type
from mypokemon
where name = 'eevee';

# mission(2)
select attack,defense
from mypokemon
where name = 'caterpie';

# mission(3)
select *
from mypokemon
where weight > 6;

# mission(4)
select name
from mypokemon
where (height>0.5) and (weight>=6);

# mission(5)
select name as weak_pokemon
from mypokemon
where (attack<50) or (defense<50);

# mission(6)
select *
from mypokemon
where not(type='normal');

select *
from mypokemon
where type != 'normal';

# mission(7)
select name, type
from mypokemon
where type in ('normal','fire','water','grass');

# mission(8)
select name, attack
from mypokemon
where attack between 40 and 60;

# mission(9)
select name
from mypokemon
where name like '%e%';

# mission(10)
select *
from mypokemon
where (name like '%i%') and(speed<=50);

# mission(11)
select name, height,weight
from mypokemon
where  name like '%chu';

# mission(12)
select name, defense
from mypokemon
where (name like '%e') and (defense <50);

# mission(13)
select name, attack,defense
from mypokemon
where abs(attack-defense)>=10;
# abs() : absolute 절대값

# mission(14)
select name, (attack+defense+speed) as total
from mypokemon
where (attack+defense+speed) >= 150;

