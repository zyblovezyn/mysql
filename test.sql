SELECT * FROM USER

GRANT SELECT ON *.* TO user1@localhost

SELECT * FROM db


SHOW GRANTS FOR zl@localhost

DROP USER zl@localhost


SELECT CONCAT('12','456',NULL);

SELECT REPLACE('1234561','1','123')

SELECT INSERT('123456',2,2,11);

SELECT LENGTH(LEFT('123456',2));

SET @a='123456';
SELECT LENGTH(@a)
SELECT RIGHT(@a,2);
SELECT LPAD(@a,10,'0')

SELECT RPAD(@a,10,'-')
LTRIM()
RTRIM()

SELECT REPEAT('0',12);
SELECT STRCMP(@a,@a)
SELECT STRCMP(@a,'123')
SELECT SUBSTRING(@a FROM 2 FOR 2)
SELECT CHAR_LENGTH(@a)
SELECT REVERSE(@a)
SELECT LENGTH(SPACE(12))
SELECT COALESCE(NULL,NULL,NULL,@a,'12')


select substr(@a,2,2)

select ifnull(ename,'总计'),count(*) from emp group by ename with rollup

declare num int(11)

create table a
(
	id int(1) auto_increment primary key,
	name char(20)
)

create table b
(
	id int(1) auto_increment primary key,
	name char(20)
)


INSERT INTO a
VALUES ( 1, 'a20050111' ) , ( 2, 'a20050112' ) , ( 3, 'a20050113' ) , ( 4, 'a20050114' ) , ( 5, 'a20050115' ) ;
INSERT INTO b
VALUES ( 1, ' 2006032401' ) , ( 2, '2006032402' ) , ( 3, '2006032403' ) , ( 4, '2006032404' ) , ( 8, '2006032408' ) ;



create table person(

	id smallint unsigned not null auto_increment,
	name char(60) not null,
	primary key (id)
	)
	
create table shirt(
	id smallint unsigned not null auto_increment,
	style enum('t-shirt','polo','dress') not null,
	color enum('red','blue','orange','white','black') not null,
	owner smallint unsigned not null references person(id),
	primary key(id)
	)


insert into person values(null,'Antonio Paz')

select * from person

select @last:=last_insert_id();


INSERT INTO shirt VALUES
(NULL, 'polo', 'blue', @last),
(NULL, 'dress', 'white', @last),
(NULL, 't-shirt', 'blue', @last);



INSERT INTO person VALUES (NULL, 'Lilliana Angelovska');

SELECT @last := LAST_INSERT_ID();

INSERT INTO shirt VALUES
(NULL, 'dress', 'orange', @last),
(NULL, 'polo', 'red', @last),
(NULL, 'dress', 'blue', @last),
(NULL, 't-shirt', 'white', @last);


select * from shirt



select
  s.*
from
  person p
  inner join shirt s
    on p.id = s.owner
where p.name like 'Lilliana%'
  and s.color <> 'white';



show create table shirt\G


create table t1 (year year(4),month int(2) unsigned zerofill,
	day int(2) unsigned zerofill
	
)


INSERT INTO t1 VALUES(2000,1,1),(2000,1,20),(2000,1,30),(2000,2,2),
            (2000,2,23),(2000,2,23);

select * from t1


select year,month,bit_count(bit_or(1<<day)) as days from t1
group by year,month


select bit_count(3<<3)


create table animals(
	id mediumint not null auto_increment,
	name char(30) not null,
	primary key(id)
)


insert into animals (name)
values
  ('dog'),
  ('cat'),
  ('penguin'),
  ('lax'),
  ('whale'),
  ('ostrich');


select * from animals

delete from animals
alter table animals auto_increment=100
select last_insert_id()


drop table animals

create table animals(
	grp enum('fish','mammal','bird') not null,
	id mediumint not null auto_increment,
	name char(30) not null,
	primary key(grp,id)
)engine=myisam

insert into animals (grp,name) values
    ('mammal','dog'),('mammal','cat'),
    ('bird','penguin'),('fish','lax'),('mammal','whale'),
    ('bird','ostrich');
    
select * from animals order by grp,id



select 'a string'
select "anothr string"

select 'a string'
select 'a' ' ' 'string'

select _binary 'string'

select 'hello','"hello"','""hello""','hel''lo','\'hello'

select "hello","'hello'","''hello''","hel""lo","\"hello"

select 'This\nIs\nFour\nLines'

select str_to_date('20180303','YYYY-MM-dd')


create user 'pig'@'%' identified by '123456'

grant select,insert,create on test.* to 'pig'@'%'


CREATE USER 'cat'@'%' IDENTIFIED BY '123456'

GRANT SELECT,INSERT,CREATE ON test.* TO 'cat'@'%' with grant option;

set password for 'pig'@'%'=password('666888')

show grants for 'pig'@'%'


drop user 'pig'@'%'

select * from t2

create table t(
	c1 varchar(10) character set binary,
	c2 text character set binary,
	c3 enum('a','b','c') character set binary
)



select if(0,'true','false')

select if(1,'true','false')

select if(2,'true','false')

select if(0=false,'true','false')


select sec_to_time(time_to_sec(curtime()));
select curdate()



select curdate()
select curtime()

select now()


select curdate()

select last_day(curdate())


select date_add(curdate(),interval -day(curdate())+1 day)

select month(curdate())


select locate(',','abc,def,hig');

select left('abc,def,hig',locate(',','abc,def,hig')-1);

select left('example.com',3);

select right('example.com',3);

select substring('example.com',4,2)
select substring('example.com',-4);

select substring_index('www.example.com','.',2);

select convert(_latin1'muller' using utf8);

set @s1=_latin1'abc'

set @s2=_latin2'abc';

select @s1=@s2

select @s1=convert(@s2 using latin1);

set @str=binary'New York'

select lower(@str),lower(convert(@str using latin1));

create table new_table select cast('2000-01-01' as date) as c1;

show create table new_table;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         



CREATE TABLE `new_table` (
  `c1` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8



select now()

select concat('DATE:',cast(now() as date));

select X'41',X'41'+0

select b'1100001',b'1100001'+0

select concat('hello you',2);

select cast(timestamp '2014-09-08 18:07:54' as signed);

create table c_test(col timestamp)

insert into c_test values('2014-09-08 18:07:54');

select col,cast(col as unsigned) from c_test


select 1-2

select cast(1-2 as unsigned)

select cast(cast(1-2 as unsigned) as signed);

select 'a'='A'

select binary 'a'='A'

select 'a'='a '

select 29|15

select 29&15

select 1^1,1^0,11^3

select 1<<2,4>>2

select b'256'
select bin(256)

select bin(29)

select bit_count(b'10101111')

select bin(123)

select oct(123)

select hex(123)

select charset('abc')

select charset(convert('abc'using latin1));

select user()

select coercibility(user())

select collation('abc')

select connection_id()

select user(),current_user()

select database();

show tables

select sql_calc_found_rows * from a limit 2

select found_rows()

select last_insert_id()

create table t3(
	id int auto_increment not null primary key,
	name varchar(10) not null
)

select * from t3

insert into t3 values(null,'Bob');

select last_insert_id()

insert into t3 values(null,'Mary'),(null,'Jane'),(null,'Lisa')

select last_insert_id()

select * from t

drop table t

create table t (
	val int
)

select * from t

insert into t values(1),(2),(3)

select row_count()

select * from T

select row_count()

create table grade1(
	id int(11) not null auto_increment,
	stdName varchar(22) default null,
	course varchar(22) default null,
	score int(11) default null,
	primary key(id)
) engine=innodb auto_increment=10 default charset=utf8

INSERT INTO `grade1` VALUES ('1', '张三', '语文', '91');
INSERT INTO `grade1` VALUES ('2', '张三', '数学', '90');
INSERT INTO `grade1` VALUES ('3', '张三', '英语', '87');
INSERT INTO `grade1` VALUES ('4', '李四', '语文', '79');
INSERT INTO `grade1` VALUES ('5', '李四', '数学', '95');
INSERT INTO `grade1` VALUES ('6', '李四', '英语', '80');
INSERT INTO `grade1` VALUES ('7', '王五', '语文', '77');
INSERT INTO `grade1` VALUES ('8', '王五', '数学', '81');
INSERT INTO `grade1` VALUES ('9', '王五', '英语', '89');

select  * from grade1



  select group_concat(score), stdName from grade1 group by stdName
    
    
    
    select
      group_concat(stdName
        order by score asc),
      min(score) as score,
      course
    from
      grade1
    group by course
    
    
 select substring_index(group_concat(stdName order by score asc),',',1),
 min(score) as score,
 course 
 from grade1 group by course
 
 
 SELECT
    stdName,
    score,
    course
FROM
    grade1
WHERE
    (score, course) IN (
        SELECT
            min(score),
            course
        FROM
            grade1
        GROUP BY
            course
    );
    
    
  select group_concat(stdName order by score asc separator ' ') as ttt,min(score),course
  from grade1 group by course
 
 select group_concat_max_len
 
 select stdName,min(score),max(score) from grade1
 
 select round(123.1212,2)
 
 select round(1123.2654,1)
 
 select .0001
 
delimiter $$;
CREATE PROCEDURE p1 ()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE d DECIMAL(10,4) DEFAULT 0;
  DECLARE f FLOAT DEFAULT 0;
  WHILE i < 10000 DO
    SET d = d + .0001;
    SET f = f + .0001E0;
    SET i = i + 1;
  END WHILE;
  SELECT d, f;
END;    

call p1()
 
create  event if not exists test.event_stat_dialy
	on schedule every 1 day
	on completion preserve
do call test.p1();

create event test.event_start_daily
	on schedule every 1 day starts '2018-11-07 15:00:00'
	on completion preserve
	enable
	do call p();
	
	
	
	
delimiter $$;
create event e5
	on schedule every 1 day starts '2018-11-07 17:30:00'
	on completion preserve
	do
begin
	declare yesterday date;
	set yesterday=date(date_add(now(),interval -1 day));
	if exists(select id from stat_videohits where addsDate=yesterday) then
		delete from stat_videohits where addsDate=yesterday;
	end if;
	
	insert into stat_videohits(id,videoid,times,addsdate) select uuid(),
	VideoId,COUNT(1),AddDate from Coll_VideoHits 
	where AddDate = yestday
	group by VideoId;
	 
	delete from sum_videhits;
	
	insert into Sum_VideoHits(Id,VideoId,Times,UpdateDate) select uuid(),VideoId,sum(Times),now() from Stat_VideoHits 
	group by VideoId;

end;
delimiter

drop event test.`e5`


create table char_test(char_col char(10));

insert into char_test(char_col) values('string1'),(' string2'),('string3 ');

select concat('|',char_col,'|') from char_test

create table enum_test(e enum('fish','apple','dog') not null);

insert into enum_test(e) values('fish'),('dog'),('apple');

select e from enum_test order by e

create table bittest(a bit(8))

insert into bittest values(b'00111001');

select a,a+0 from bittest

create table myset(
	col set('a','b','c','d')
)

insert into myset(col) values('a,d'),('d,a'),('a,d,a'),('d,a,d');

select * from myset

insert into myset(col) values('a,d,d,s')

create table film(rental_duration tinyint not null default 3);

insert into film values(1)

 
select count(*) from film

alter table film modify column rental_duration tinyint not null default 3

show status

alter table film alter column rental_duration set default 5

show variables

select now()

create event e_totals
on schedule at '2017-02-02 23:59:59'
do insert into test.a values(1111,'zhang');

show warnings

create event e_bourly
on schedule every 1 hour
comment 'clears out sessions table each hour.'
do
delete from site_activity.sessions;

delimiter |
create event e_daily
	on schedule every day
	comment 'saves total number of sessions then clears the tables every day'
	do
	 begin 
	  insert into site_activity.totals(time,total)
	  select current_timestamp,count(*) from
	  site_activity.sessions;
	  delete from site_activity.sessions;
	end |
delimite ;


select * from a

create index idx_partof_name on a (name(5));

create table lookup (id int) engine=memory;
create index id_index on lookup(id) using btree

create table date_function_test(id int auto_increment 
not null primary key ,newdate date,nowtime time)

alter table date_function_test comment 'use for date function test'

alter table date_function_test change column newdate nowdate date

alter table date_function_test rename test001

alter table test001 rename date_func

alter table date_func add column nowdatetime datetime after id

alter table date_func modify nowdatetime date

alter table date_func modify nowdatetime datetime

alter table date_func modify nowdatetime datetime after nowtime

select * from date_func

select now()
insert into date_func(nowdate,nowtime,nowdatetime)

values(curdate(),curtime(),now())

select date_add(nowdatetime,interval 45 day) from date_func

select date_sub(nowdate,interval -5 day) from date_func
show index from date_func





