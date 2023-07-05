# Note

## Target

本节主要学习了如何使用Bash脚本处理CSV文件中数据，包括如何获取CSV文件中数据以及将其插入到PostgresSQL数据库中，最后将生成的数据使用`psql_dump`命令进行了备份。

## In&Out

提供了students.csv与course.csv两个表格，产出了insert_data.sh与students.sql两个文件。

## Learning

1. Bash脚本执行SQL语句。

   ```sh
   # Define PSQL
   PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
   # --tuples-only: Turn off printing of column names and result row count footers.
   # Query
   $($PSQL "<query_here>")
   # Get RETURN
   RETURN_VALUE=$($PSQL "<query_here>")
   # Print RETUEN
   echo "$($PSQL "<query_here>")"
   ```

1. Bash脚本读取文件：

   ```sh
   cat courses.csv | while read VALUE1 VALUE2
   do
     <STATEMENTS>
   done
   ```

1. `IFS(Internal Field Separator)`This variable is used to determine word boundaries. It defaults to spaces, tabs, and new lines.

   ```sh
   cat courses.csv | while IFS="," read VALUE1 VALUE2
   do
     <STATEMENTS>
   done
   ```

1. `[[ -z VALUE ]]`VALUE值为空，`help test`查看相关参数。

1. `TRUNCATE TABLE [CASCADE]`删除表中所有数据，但不删除表结构。

1. `ALTER TABLE TABLE_NAME`

1. Bash脚本需要可执行权限`chmod +x xx.sh`

1. `echo -e "\n"`，`-e`启用转义符号
