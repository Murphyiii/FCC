# 笔记

## Target

本节主要学习了PostgresSQL的各种`WHERE`后面的条件以及聚集函数（aggregate function），如`LIKE`、`ILIKE`、`AND/OR`、`JOIN`、`NULL`、`ORDER BY`

## In&Out

提供了students.sql数据库文件，产出了student_info.sh脚本文件。

## Learn

1. 取整函数
   - `CEIL(X)` 不小于参数的最小整数
   - `FLOOR(X)` 不大于参数的最大整数
   - `ROUND(X)` 最接近的整数
   - `ROUND(X, Y)` 最接近的整数，保留Y位小数

2. `HAVING`

   ```sql
   SELECT <column> FROM <table> GROUP BY <column> HAVING <condition>
   -- The condition must be an aggregate function with a test.
   ```

3. `JOIN`
   - `CROSS JOIN` 交叉连接

     返回两个表的笛卡尔积

   - `NATURAL JOIN` 自然连接

     一种特殊的内连接。两个表做自然连接时，两个表中所有同名的列都将做等值比较。下面两个查询语句等价。

     注意：NATURAL JOIN 不需要使用ON创建连接条件。

     ```sql
     SELECT * FROM TABLE1 NATURAL JOIN TABLE2;
     SELECT * FROM TABLE1 INNER JOIN TABLE2 ON TABLE1.COLUMN1 = TABLE2.COLUMN1;
     ```

   - `INNER JOIN`
   - `LEFT JOIN`
   - `RIGHT JOIN`

   - `USING`两个表连接时使用相同字段进行等值比较时可以使用`USING`进行查询，下面两个语句作用相同。

      注意：使用`USING`时不能使用任何别名

      ```sql
      SELECT * FROM TABLE1 JOIN TABLE2 ON TABLE1.COLUMN1 = TABLE2.COLUMN1;
      SELECT * FROM TABLE1 JOIN TABLE2 USING(COLUMN1);
      ```

      也可以连接多个表

      ```sql
      SELECT * FROM TABLE1 JOIN TABLE2 USING(COLUMN1) FULL JOIN USING(COLUMN1);
      ```

   - `FULL JOIN`
   `LEFT JOIN`与`RIGHT JOIN`的并集

4. 查找第一个字母大于字母D的结果

   ```sql
   SELECT COLUMN1 FROM TABLE1 WHERE COLUMN1 < 'D'
   -- 也可使用>=、<、=等
   ```

5. `IS NULL`, `IS NOT NULL`

6. `LIKE`, `NOT LIKE`, `ILIKE`: ignore the case of the letters when matching.

7. Aggregate Function: `AVG()`, `COUNT()`, `MAX()`, `MIN()`, `SUM()`
