# 규칙만들기
use pokemon;

select*
FROM mypokemon;

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
    
show tables;

insert into mypokemon(number,name,type,attack,defense)
values  (10, 'caterpie', 'bug', 30, 35), 
		(25, 'pikachu', 'electric', 55, 40), 
		(26, 'raichu', 'electric', 90, 55), 
		(125, 'electabuzz', 'electric', 83, 57), 
		(133, 'eevee', 'normal', 55, 50), 
		(137, 'porygon', 'normal', 60, 70), 
		(152, 'chikoirita', 'grass', 49, 65), 
		(153, 'bayleef', 'grass', 62, 80), 
		(172, 'pichu', 'electric', 40, 15), 
		(470, 'leafeon', 'grass', 110, 130);

SELECT*
FROM mypokemon;

# 조건문 if

SELECT name,
		if(attack>60, 'strong','weak') as attack_class
FROM mypokemon;

# ifnull
# 데이터가 null인지 확인 >> null 이라면 새로운 값 반환
# cf. is null : 데이터가 null인지 아닌지 확인

SELECT name, ifnull(name,'unknown') as full_name
FROM mypokemon;

# 조건이 여러 개 있을 때 >> case
# case 
#	when ... then...
#	else
# end as

SELECT *
FROM mypokemon;

SELECT name,
case
	when attack >= 100 then 'very strong'
    when attack >= 80 then 'strong'
    when attack >= 60 then 'so-so'
    else 'weak'
end as attack_class
FROM mypokemon;

SELECT name,
case
	WHEN defense >= 80 THEN 'A'
    WHEN defense >= 60 THEN 'B'
	WHEN defense >= 50 THEN 'C'
    ELSE 'F'
END AS defense_rank
FROM mypokemon;

SELECT name, type,
CASE type
	WHEN 'bug' THEN 'grass'
    WHEN 'electric' THEN 'water'
    WHEN 'grass' THEN 'bug'
END AS rival_type
FROM mypokemon;

# 함수 function


SET GLOBAL log_bin_trust_function_creators = 1;
# deprecated 

DELIMITER // 
CREATE function get_ability_poke(attack int,defense int)
	returns int
BEGIN
	declare a int;
    declare b int;
    declare ability int;
    
    set a = attack;
    set b = defense;
    select a+b into ability;
    return ability;
END
//
DELIMITER ;

DELIMITER //
create function get_ability_poke(attack int, defense int)
	returns int
BEGIN
    declare ability int;
    set ability = attack + defense;
    return ability;
END
//
DELIMITER ;

-- declare 선언 declare a >> a라는 변수 선언
-- set 지정 >> 특정 값을 변수에 지정



select get_ability_poke(100,100);

/*
주석처리alter (특히, 여러 문장 주석처리)
*/

-- 한 문장 주석 처리
# 이것도 가능




/* 함수 만들고 사용 실습 */

-- if / elseif/ else


DELIMITER //

CREATE function isStrong(attack int,defense int)
	returns varchar(20)
BEGIN 
	declare result varchar(20);
    
    if attack + defense > 120 then 
		set result = 'very strong';
	elseif attack + defense > 90 then 
		set result = 'strong';
	else set result = 'not strong';
    end if;
    
    return result;
END//
DELIMITER ;

select name,isStrong(attack,defense) as isStrong
from mypokemon;

select isStrong(60,70) as result;

DELIMITER //
CREATE function isStrong_case(attack int,defense int)
	returns varchar(20)
    
BEGIN 
	return case
		when attack + defense > 120 then 'very strong'
		when attack + defense > 90 then 'strong'
        else 'not strong'
	end;
END //
DELIMITER ;

select isStrong_case(40,55) as result;

select name, isStrong(attack,defense) as isStrong
from mypokemon;


# 규칙 만들기 _ 실습

# if는 select를 좋아해~~~
# mission(1)
select name, if(number<150,'old','new') as age
from mypokemon;

# mission(2)
select name, if((attack+defense)<100,'weak','strong') as ability
from mypokemon;

# mission(3)
select type , if(avg(attack)>=60,True,False) as is_strong_type
from mypokemon
group by type;

# mission(4)
select name,
	case
		when attack>100 and defense>100 then True
        else False
	end as ace
from mypokemon;

# mission(5)
select name,
	case
		when number<100 then '<100'
        when number<200 then '<200'
        when number<500 then '<500'
    end as number_bin
from mypokemon;

# mission(6)
select name,
	case
		when (number>=150) and (attack>=50) then 'new_strong'
        when (number>=150) and (attack<50) then 'new_weak'
        when (number<150) and (attack>=50) then 'old_strong'
        when (number<150) and (attack<50) then 'old_weak'
    end as age_attack
from mypokemon;

# mission(7)
select type, 
	case
		when count(1) = 1 then 'solo'
        when count(1) < 3 then 'minor'
        when count(1) >= 3 then 'major'
    end as count_by_type
from mypokemon
group by type;