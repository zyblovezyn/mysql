
-- 第五章 创建高性能索引

-- 5.5.3
ALTER TABLE tablename ENGINE=tableengine

-- 第六章 查询性能优化
-- 6.1
-- 6.2

EXPLAIN SELECT * FROM date_func

DELETE FROM messages WHERE created<DATE_SUB(NOW(),INTERVAL 3 MONTH);
-- 如果数据量过大，定期地清除大量数据时，如果用一个大的语句
-- 一次性完成的话，则可能需要一次锁住很多数据、
-- 占满整个事务日志、耗尽系统资源、阻塞很多小的但重要的查询。
-- 将一个大的DELETE语句切分成多个较小的查询可以
-- 尽可能小地影响MySQL性能，同时还可以减少MySQL复制的延迟。

-- 但是一次删除一万行数据,比较高效对服务器影响最小
DELETE FROM messages WHERE created< DATE_SUB(NOW(),INTERVAL 3 MONTH) LIMIT 10000;

-- 6.3.3
-- 分解关联查询
SELECT * FROM tag 
JOIN tag_post ON tag_post.tag_id=tag.id
JOIN post ON tag_post.id=post.id
WHERE tag.tag='mysql'
-- 以上查询分解成下面查询来替代：
SELECT * FROM tag_post WHERE tag_id='1'
SELECT * FROM tag_post WHERE tag_id='1234'
SELECT * FROM post WHERE post.id IN (1,2,3,4)

-- 客户端发送一条查询给服务器。
-- 服务器先检查查询缓存，如果命中了缓存，则立刻返回存储在缓存中的结果。否则进入下一阶段。
-- 服务器端进行SQL解析、预处理，再由优化器生成对应的执行计划。
-- MySQL根据优化器生成的执行计划，调用存储引擎的API来执行查询。
-- 将结果返回给客户端。


11





