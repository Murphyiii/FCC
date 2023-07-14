# Note

## Learing

1. Function

   ```shell
   # create
   function_name() {
   }
   # call function
   function_name
   ```

2. case

    ```shell
    case EXPRESSION in
    PATTERN) STATEMENTS ;;
    PATTERN) STATEMENTS ;;
    PATTERN) STATEMENTS ;;
    *) STATEMENTS ;;
    esac
    ```

    [Process Control](https://www.runoob.com/linux/linux-shell-process-control.html)

3. pipe

    ```shell
    echo "$AVAILABLE_BIKES" | while read <VAR_1> <VAR_2> <VAR_3> <VAR_4> <VAR_5>
    do
    <STATEMENTS>
    done
    ```

4. test regex

   ```shell
   [[ a =~ [0-9] ]]
   ```

5. sed
