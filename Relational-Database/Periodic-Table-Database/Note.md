# Note

## Learning

1. trim()

    ```SQL
    -- remove trailing zeros
    SELECT trim(trailing '0' from 10.00500::text)::numeric
    -- output: 10.005
    ```

2. `::`: 强制类型转换

3. update...from

    ```SQL
    UPDATE table_name SET columns=values FROM another_tanle WHERE condition
    ```
