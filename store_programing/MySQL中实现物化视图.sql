# 创建表
 CREATE TABLE sales (
  sales_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR (128) NOT NULL,
  product_price DECIMAL (8, 2) NOT NULL,
  product_amount SMALLINT NOT NULL
);

INSERT INTO sales
VALUES
  (NULL, 'Apple', 1.25, 1),
  (NULL, 'Apple', 2.40, 2),
  (NULL, 'Apple', 4.05, 3),
  (NULL, 'Pear', 6.30, 2),
  (NULL, 'Pear', 12.20, 4),
  (NULL, 'Plum', 4.85, 3);

SELECT
  *
FROM
  sales;

SELECT
  s.`product_name`,
  SUM(s.`product_price`) AS price_sum,
  SUM(s.`product_amount`) AS amount_sum,
  AVG(s.`product_price`) AS price_avg,
  AVG(s.`product_amount`),
  COUNT(*)
FROM
  sales s
GROUP BY s.`product_name`
ORDER BY price_sum;

# 创建物化视图
 DROP TABLE IF EXISTS sales_mv;

CREATE TABLE sales_mv (
  product_name VARCHAR (128) NOT NULL,
  price_sum DECIMAL (10, 2) NOT NULL,
  amount_sum INT UNSIGNED NOT NULL,
  price_avg FLOAT NOT NULL,
  amount_avg FLOAT NOT NULL,
  sales_cnt INT NOT NULL,
  UNIQUE INDEX product (product_name)
);

INSERT INTO sales_mv
SELECT
  product_name,
  SUM(product_price),
  SUM(product_amount),
  AVG(product_price),
  AVG(product_amount),
  COUNT(*)
FROM
  sales
GROUP BY product_name;

SELECT
  *
FROM
  sales_mv;

# 及时更新物化视图 1.insert 2.update 3.delete 均需更新
# 1.insert 
DROP TRIGGER IF EXISTS sales_ins;

DELIMITER //

CREATE TRIGGER sales_ins AFTER INSERT ON sales FOR EACH ROW
BEGIN
  DECLARE old_price_sum FLOAT DEFAULT 0;
  DECLARE old_amount_sum INT DEFAULT 0;
  DECLARE old_price_avg FLOAT DEFAULT 0;
  DECLARE old_amount_avg INT DEFAULT 0;
  DECLARE old_sales_cnt INT DEFAULT 0;
  DECLARE new_price_sum FLOAT DEFAULT 0;
  DECLARE new_amount_sum INT DEFAULT 0;
  DECLARE new_price_avg FLOAT DEFAULT 0;
  DECLARE new_amount_avg INT DEFAULT 0;
  DECLARE new_sales_cnt INT DEFAULT 0;
  SELECT
    IFNULL(sm.price_sum, 0),
    IFNULL(amount_sum, 0),
    IFNULL(price_avg, 0),
    IFNULL(amount_avg, 0),
    IFNULL(sales_cnt, 0)
  FROM
    sales_mv sm WHERE sm.product_name=new.product_name INTO old_price_sum,
    old_amount_sum,
    old_price_avg,
    old_amount_avg,
    old_sales_cnt;
    
  SET new_price_sum = old_price_sum + new.product_price;
  SET new_amount_sum = old_amount_sum + NEW.product_amount;
  SET new_sales_cnt = old_sales_cnt + 1;
  SET new_price_avg = new_price_sum / new_sales_cnt;
  SET new_amount_avg = new_amount_sum / new_sales_cnt;
  REPLACE INTO sales_mv
  VALUES
    (
      NEW.product_name,
      new_price_sum,
      new_amount_sum,
      new_price_avg,
      new_amount_avg,
      new_sales_cnt
    );
END


# 2.update
DROP TRIGGER IF EXISTS sales_upd;

DELIMITER //

CREATE TRIGGER sales_upd AFTER UPDATE ON sales FOR EACH ROW
BEGIN
  DECLARE old_price_sum FLOAT DEFAULT 0;
  DECLARE old_amount_sum INT DEFAULT 0;
  DECLARE old_price_avg FLOAT DEFAULT 0;
  DECLARE old_amount_avg INT DEFAULT 0;
  DECLARE old_sales_cnt INT DEFAULT 0;
  DECLARE new_price_sum FLOAT DEFAULT 0;
  DECLARE new_amount_sum INT DEFAULT 0;
  DECLARE new_price_avg FLOAT DEFAULT 0;
  DECLARE new_amount_avg INT DEFAULT 0;
  DECLARE new_sales_cnt INT DEFAULT 0;
  SELECT
    IFNULL(sm.price_sum, 0),
    IFNULL(amount_sum, 0),
    IFNULL(price_avg, 0),
    IFNULL(amount_avg, 0),
    IFNULL(sales_cnt, 0)
  FROM
    sales_mv sm WHERE sm.product_name=old.product_name INTO old_price_sum,
    old_amount_sum,
    old_price_avg,
    old_amount_avg,
    old_sales_cnt;
    
  SET new_price_sum = old_price_sum + new.product_price-old.product_price;
  SET new_amount_sum = old_amount_sum + new.product_amount-old.product_amount;
  SET new_sales_cnt = old_sales_cnt;
  SET new_price_avg = new_price_sum / new_sales_cnt;
  SET new_amount_avg = new_amount_sum / new_sales_cnt;
  
  REPLACE INTO sales_mv
  VALUES(old.product_name, new_price_sum, new_amount_sum, IFNULL(new_price_avg, 0)
	, IFNULL(new_amount_avg, 0), new_sales_cnt);
END

# 3.delete
DROP TRIGGER IF EXISTS sales_del;

DELIMITER //

CREATE TRIGGER sales_del AFTER DELETE ON sales FOR EACH ROW
BEGIN
  DECLARE old_price_sum FLOAT DEFAULT 0;
  DECLARE old_amount_sum INT DEFAULT 0;
  DECLARE old_price_avg FLOAT DEFAULT 0;
  DECLARE old_amount_avg INT DEFAULT 0;
  DECLARE old_sales_cnt INT DEFAULT 0;
  DECLARE new_price_sum FLOAT DEFAULT 0;
  DECLARE new_amount_sum INT DEFAULT 0;
  DECLARE new_price_avg FLOAT DEFAULT 0;
  DECLARE new_amount_avg INT DEFAULT 0;
  DECLARE new_sales_cnt INT DEFAULT 0;
  SELECT
    IFNULL(sm.price_sum, 0),
    IFNULL(amount_sum, 0),
    IFNULL(price_avg, 0),
    IFNULL(amount_avg, 0),
    IFNULL(sales_cnt, 0)
  FROM
    sales_mv sm WHERE sm.product_name=old.product_name INTO old_price_sum,
    old_amount_sum,
    old_price_avg,
    old_amount_avg,
    old_sales_cnt;
    
  SET new_price_sum = old_price_sum -  old.product_price;
  SET new_amount_sum = old_amount_sum - old.product_amount;
  SET new_sales_cnt = old_sales_cnt-1;
  SET new_price_avg = new_price_sum / new_sales_cnt;
  SET new_amount_avg = new_amount_sum / new_sales_cnt;
  
  REPLACE INTO sales_mv
  VALUES(old.product_name, new_price_sum, new_amount_sum, IFNULL(new_price_avg, 0)
	, IFNULL(new_amount_avg, 0), new_sales_cnt);
END


# 测试数据
INSERT INTO sales VALUES (NULL, 'Apple', 1.25, 1);

INSERT INTO sales VALUES (NULL, 'Apple', 2.40, 2);

INSERT INTO sales VALUES (NULL, 'Apple', 4.05, 3);

INSERT INTO sales VALUES (NULL, 'Pear', 6.30, 2);

INSERT INTO sales VALUES (NULL, 'Pear', 12.20, 4);

INSERT INTO sales VALUES (NULL, 'Plum1', 4.85, 3);


DELETE FROM sales WHERE sales_id = 5;

DELETE FROM sales WHERE sales_id = 4;


UPDATE sales SET product_amount = 3 WHERE sales_id = 2;