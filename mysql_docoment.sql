--           mysql document        --

-- 13.1.13 CREATE INDEX Syntax
-- 创建索引index 语句
CREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
    [index_type]
    ON tbl_name (index_col_name,...)
    [index_option] ...

index_col_name:
    col_name [(LENGTH)] [ASC | DESC]

index_option:
    KEY_BLOCK_SIZE [=] VALUE
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'

index_type:
    USING {BTREE | HASH}
    
 -- create index 不能创建primary index，要使用alter table 代替
    
CREATE TABLE customer (id INT UNSIGNED NOT NULL PRIMARY KEY,NAME CHAR(20))

CREATE INDEX part_of_name ON customer (NAME(10))  -- 前缀索引
-- 前缀索引不适合NDB
-- offline online关键字只适合NDB cluster
-- unique index permits multiple null values for column that can contain null
-- fullindex indexes are supported only for myisam tables and can include only 
-- char varchar test columns

CREATE TABLE lookup(id INT) ENGINE=MEMORY

CREATE INDEX id_index ON lookup (id) USING BTREE

-- btree indexes are implemented by the NDB storage engine as T-tree indexes


-- 13.1.14 CREATE LOGFILE GROUP Syntax
-- create logfile group is useful only Disk Data storage for NDB Cluster
CREATE LOGFILE GROUP logfile_group
    ADD UNDOFILE 'undo_file'
    [INITIAL_SIZE [=] INITIAL_SIZE]
    [UNDO_BUFFER_SIZE [=] UNDO_BUFFER_SIZE]
    [REDO_BUFFER_SIZE [=] REDO_BUFFER_SIZE]
    [NODEGROUP [=] nodegroup_id]
    [WAIT]
    [COMMENT [=] 'string']
    ENGINE [=] engine_name

CREATE LOGFILE GROUP lg1 ADD UNDOFILE 'undo.dat' INITIAL_SIZE=10M

SHOW WARNINGS;

CREATE LOGFILE GROUP lg1 ADD UNDOFILE 'undo.dat' INITIAL_SIZE=10M ENGINE=NDB;

SELECT logfile_group_name,logfile_group_number,extra
FROM information_schema.`FILES`
WHERE file_name='undo_10.dat';

SELECT * FROM information_schema.files;

-- 13.1.15 CREATE PROCEDURE and CREATE FUNCTION Syntax
CREATE
    [DEFINER = { USER | CURRENT_USER }]
    PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = { USER | CURRENT_USER }]
    FUNCTION sp_name ([func_parameter[,...]])
    RETURNS TYPE
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name TYPE

func_parameter:
    param_name TYPE

TYPE:
    ANY valid MySQL DATA TYPE

characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

routine_body:
    Valid SQL ROUTINE statement

-- the parameters list enclosed whithin parentheses must always be present.if there are no parameters,
-- an empty parameters list of () should be used.parameters names are not case sensitive.
-- each parameter is an IN parameter by default. To specify otherwise for a parameter,use the keyword
-- OUT or INOUT before the parameter name. For a FUNCTION,parameters are always regaeded as IN parameters.
 
-- The following example shows a simple stored procedure that uses an OUT parameter:
SHOW TABLES; SELECT * FROM lookup;INSERT INTO lookup VALUE(1),(2),(3);

DELIMITER //
CREATE PROCEDURE simpleproc(OUT param1 INT)
BEGIN
SELECT COUNT(*) INTO param1 FROM lookup;
END//

CALL test.`simpleproc`(@a);
SELECT @a; 

BEGIN 对mysql变量的连接
-- @a 对mysql 变量的解释
-- set语句的学习：
-- 
-- 使用select定义用户变量的实践
-- 将如下语句改成select的形式：
--  SET @VAR=(SELECT SUM(amount) FROM penalties);
-- 我的修改：
--  SELECT @VAR:=(SELECT SUM(amount) FROM penalties);
-- 
-- 我这样改，虽然是可以的。但是，对比的书中的答案，发现这样的方式太蹩脚了。说明没有很好地理解select定义变量的本质。
-- 在select中，发现有一个用户变量，如果没有定义，那么就会初始化。
-- select子句原来的方式根本不受到影响。只是增加了用户变量。所以，还是按照原来的方式使用select子句。那么像：select SUM(amount) FROM penalties。增加变量就成
-- 
-- 了:SELECT  @VAR:=SUM(amount) FROM penalties。
-- 
-- 将sum(amount)的结果赋给变量@VAR:。变量前面有select，那用户么就是显示该变量了。
-- 
-- 
-- 笔记部分：mysql变量的术语分类：
-- 1.用户变量：以"@"开始，形式为"@变量名"
-- 用户变量跟mysql客户端是绑定的，设置的变量，只对当前用户使用的客户端生效
-- 2.全局变量：定义时，以如下两种形式出现，set GLOBAL 变量名  或者  SET @@global.变量名 
-- 对所有客户端生效。只有具有super权限才可以设置全局变量
-- 
-- 3.会话变量：只对连接的客户端有效。
-- 
-- 4.局部变量：作用范围在begin到end语句块之间。在该语句块里设置的变量
-- declare语句专门用于定义局部变量。set语句是设置不同类型的变量，包括会话变量和全局变量
-- 
-- 
-- 通俗理解术语之间的区别：
-- 
-- 用户定义的变量就叫用户变量。这样理解的话，会话变量和全局变量都可以是用户定义的变量。只是他们是对当前客户端生效还是对所有客户端生效的区别了。所以，用户变量包括了会话变量和全局变量
-- 
-- 局部变量与用户变量的区分在于两点:1.用户变量是以"@"开头的。局部变量没有这个符号。2.定义变量不同。用户变量使用set语句，局部变量使用declare语句定义 3.作用范围。局部变量只在begin-end语句块之间有效。在begin-end语句块运行完之后，局部变量就消失了。
-- 
-- 所以，最后它们之间的层次关系是：变量包括局部变量和用户变量。用户变量包括会话变量和全局变量。
-- 
-- 
-- 使用备忘，set @var 若没有指定GLOBAL 或SESSION ，那么默认将会定义用户变量
-- 两种方式定义用户变量：
-- 1."=",如 SET @a =3,@a:=5
-- 2.":="。select常常这样使用
-- 总结：使用select 和set设置变量的区别，set可以使用以上两种形式设置变量。而select只能使用":="的形式设置变量
-- 实践积累：用户变量在mysql客户端退出后，会自动消失。之后我打开客户端，使用"select @a;" 显示变了的值为null。说明，未定义的变量初始化是null
-- 
-- 实际中的问题
-- 
-- 设置常量对group_concat()的配置影响：
-- SET @@GROUP_CONCAT_MAX_LEN=4
-- 手册中提到设置的语法是这样的：
-- SET [SESSION | GLOBAL] group_concat_max_len = val;
-- 
-- 以下两种形式都能达到达到同样的效果，但是有什么区别？
-- 
-- SET @@global.GROUP_CONCAT_MAX_LEN=4;
-- global可以省略，那么就变成了：SET @@GROUP_CONCAT_MAX_LEN=4;
-- 
-- 2011.2.25
-- 
-- 之前的理解不怎么准确。现在对加深理解后的地方进行总结。
-- 
-- mysql中变量的层次关系是:大体包括用户变量和系统变量。系统变量包括系统会话变量和系统全局变量。
-- 
-- 我是这样理解相互之间的区别：
-- 
-- 因为用户变量就是用户定义的变量，系统变量就是mysql定义和维护的变量。所以，用户变量与系统变量的区别在于，是谁在管理这些变量。mysql一启动的时候就会读取系统变量(这样做目的是可以确定mysql的以何种机制或模式运行)。 系统会话变量与用户变量都是在当前客户端退出后消失。他们之间的区别可以这样理解，虽然常常看到"set @@varible"的形式去改变系统变量的值，但是并不涉及到定义系统变量。用户变量是可以自己定义(初始化)。系统变量按照只是在改变值。
-- 
-- 局部变量只在begin-end语句块中定义并有效。执行到该语句块之后就消失了。定义的方式有明显的特点，使用declare语句。
-- 
-- 为什么看到使用系统变量以"@@变量名"和"变量名"的形式出现，怎么理解两者形式的区别？
-- 
-- 使用系统变量理论上是可以使用两种形式：1.前面带有符号"@@" 2.符号省略。比如我会看的如下形式：CURRENT_USER。但是，约定系统变量要使用"@@变量名"的形式，就是在前面加上符号"@@"。
-- 
-- 为什么会出现CURRENT_USER这样没有符号的情况？看书籍《SQL FOR MySQL Developers A Comprehensive Tutorial AND Reference》大致说明的原因，这样做是为了与其他的SQL产品保持一致。
 END

-- The example uses the mysql client delimiter command to change the statement delimiter from ; to // while
-- the procedure is being defined.This enables the ; delimiter used in the procedure body to be passed
-- through to the server rather than interpreted by mysql itself.

-- The RETURNS clause may be sepcified only for a FUNCTION,for which it is mandatory.
-- The following example function takes a parameter, performs an operation using an SQL function, 
-- and returns the result. In this case, it is unnecessary to use delimiter because the function 
-- definition contains no internal ; statement delimiters:

CREATE FUNCTION hello(s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC   -- deterministic adj 确定性 决定性 决定论
RETURN CONCAT('hello,',s,'!');

SELECT hello('zhang'); -- 调用函数

-- Statements that return a result set can be used within stored procedure but not whitin a stored function.
SELECT CURRENT_USER;
SELECT CURRENT_USER();

SELECT COUNT(*) FROM mysql.user;
SELECT * FROM mysql.user;

-- Consider the following procedure, which displays a count of the number of MySQL accounts listed 
-- in the mysql.user table:
DELIMITER //
CREATE DEFINER='admin'@'localhost' PROCEDURE account_count()
BEGIN
	SELECT 'Number of acounts:',COUNT(*) FROM mysql.user;
END//

CALL test.`account_count` ();
DROP PROCEDURE test.account_count;

DELIMITER //

CREATE DEFINER='admin'@'localhost' PROCEDURE account_count()
SQL SECURITY INVOKER
BEGIN
	SELECT 'Numbers of accounts:',COUNT(*) FROM mysql.user;
END//
CALL test.`account_count`();


DELIMITER //
CREATE DEFINER='root'@'localhost' PROCEDURE account_count_root()
BEGIN
	SELECT 'Number of acounts:',COUNT(*) FROM mysql.user;
END//

CALL test.account_count_root();

-- 13.1.16 CREATE SERVER Syntax
