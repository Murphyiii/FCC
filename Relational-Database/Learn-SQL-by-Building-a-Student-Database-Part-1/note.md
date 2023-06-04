# 笔记

## Target

本节主要学习了如何使用Bash脚本处理CSV文件中数据，包括如何获取CSV文件中数据以及将其插入到PostgresSQL数据库中，最后将生成的数据使用`psql_dump`命令进行了备份。

## In&Out

提供了[students.csv](https://github.com/Murphyiii/FCC/blob/main/Relational-Database/Learn-SQL-by-Building-a-Student-Database-Part-1/students.csv)与[course.csv](https://github.com/Murphyiii/FCC/blob/main/Relational-Database/Learn-SQL-by-Building-a-Student-Database-Part-1/courses.csv)两个文件，产出了[insert_data.sh](https://github.com/Murphyiii/FCC/blob/main/Relational-Database/Learn-SQL-by-Building-a-Student-Database-Part-1/insert_data.sh)与[students.sql](https://github.com/Murphyiii/FCC/blob/main/Relational-Database/Learn-SQL-by-Building-a-Student-Database-Part-1/students.sql)两个文件。

## Learn

1. Bash脚本执行SQL语句。
```sh
# Define PSQL
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
# Query
$($PSQL "<query_here>")
# Get RETURN
RETURN_VALUE=$($PSQL "<query_here>")
```
2. Bash脚本读取文件：
```sh
cat courses.csv | while read VALUE1 VALUE2
do
  <STATEMENTS>
done
```
3. `IFS(Internal Field Separator)`This variable is used to determine word boundaries. It defaults to spaces, tabs, and new lines.
```sh
cat courses.csv | while IFS="," read VALUE1 VALUE2
do
  <STATEMENTS>
done
```
4. `[[ -z VALUE ]]`VALUE值为空，`help test`查看相关参数。
5. `TRUNCATE TABLE [CASCADE]`删除表中所有数据，但不删除表结构。
6. `ALTER TABLE TABLE_NAME `
