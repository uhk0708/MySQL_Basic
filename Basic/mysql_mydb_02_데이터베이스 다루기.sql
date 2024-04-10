show databases;
drop database pokemon;

show databases;

create database pokemon;

show databases;

use pokemon;

create table mypokemon(
	번호 int,
	영문이름 varchar(20),
	타입 varchar(10)
);

show tables;

show databases;

alter table mypokemon change column 번호 number int;
alter table mypokemon change column 영문이름 name varchar(20);
alter table mypokemon change column 타입 type varchar(10);

insert into mypokemon (number,name,type)
values
	(10, "caterpie","bug"),
    (25, "pikachu","electric"),
    (133,"eevee","normal");
    
show tables;





# 미션 (1)
# pokemon db / table 만들기

drop database if exists pokemon;

create database pokemon;

use pokemon;

# step2
create table mypokemon(
	number int,
	name varchar(20),
	type varchar(10)
);

show tables;

# step 3

insert into mypokemon(number,name,type)
value(10, "caterpie", "bug"),
	 (25, "pikachu", "electric"),
	 (133, "eevee", "normal")
;
     
show tables;
select * from mypokemon;

create database mynewpokemon;
show tables;

drop database if exists mynewpokemon;

# mission (2)


# step1 (mynewpokemon 테이블 생성)
create table mynewpokemon(
	number int,
    name varchar(20),
    type varchar(10)
    );
select * from mynewpokemon;


# step 2 (데이터 삽입)
insert into mynewpokemon(number,name,type)
values(77,'포니타','불꽃'),
	 (132, '메타몽','노말'),
     (151,'뮤','에스퍼')
     ;
select * from mynewpokemon;

# 데이터 베이스 다루기
# 테이블 변경, 지우기 (after,drop)

# mission(1)
# table 명 수정

show tables;
alter table mypokemon rename myoldpokemon;
show tables;

select * from myoldpokemon;

# column 수정
alter table myoldpokemon change column name eng_name varchar(20);

select * from myoldpokemon;
select * from mynewpokemon;

alter table mynewpokemon change column name kor_name varchar(20);

select*from mynewpokemon;

# mission(2)

# 테이블 삭제
drop table if exists mynewpokemon;

# 테이블 값만 지우기
truncate table myoldpokemon;

show tables;
select * from myoldpokemon;

insert into myoldpokemon(number,eng_name,type)
values(77,'포니타','불꽃'),
	 (132, '메타몽','노말'),
     (151,'뮤','에스퍼')
     ;
     
select * from myoldpokemon;


delete from myoldpokemon
where eng_name = '포니타';

select * from myoldpokemon;

update myoldpokemon
set number = 100
where number = 132;

select*from myoldpokemon;

truncate table myoldpokemon;
select*from myoldpokemon;