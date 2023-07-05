# Note

## Target

本节主要学习了关于如何使用Bash处理输入输出以及字符串、正则表达式的匹配。

## In

提供了 `kitty_ipsum_1.txt` 与 `kitty_ipsum_2.txt` 两个文件

## Learning

1. `redirect`
   - `<command> > <filename>` : overwrite the file
   - `<command> >> <filename>` : append the file
   - `<bad_command> 2> <filename>` : when a command is failure
   - `./script.sh 1> stdout.txt 2> stderr.txt`
   - `<command> < <filename_for_stdin>`
2. cat, tac
3. `read VARIABLE`, `echo $VARIABLE`
4. pipe : `<command_1> | <command_2>`, This will take the stdout from command_1 and use it as the stdin for command_2
5. `wc`(word count) : print newline, word and byte counts for each file
   - `-m` : character counts
   - `-l` : lines counts
   - `-w` : words counts
   - `-c` : bytes counts
6. `grep '<pattern>' <filename>`
   - `-E` : regexp
   - `--color` : Surround the matched (non-empty) strings, matching lines, file names...to display them in color on the terminal. The colors are defined by the environment variable `$GREP_COLORS`.
   - `-n` : Prefix each line of output with the 1-based line number within its input file.
   - `-o` : Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line.
   - `-v` : Invert the sense of matching, to select non-matching lines.
   - `-c` : Suppress normal output; instead print a count of matching **lines** for each input file; With the `-v` option, count non-matching **lines**;
7. [regexp](https://www.runoob.com/regexp/regexp-tutorial.html)
8. `sed 's/<pattern_to_replace>/<text_to_replace_it_with>/<regex_flags>[; s/<pattern_to_replace>/<text_to_replace_it_with>/<regex_flags>]' <filename>`
   - `sed 's/<pattern_to_replace>/<text_to_replace_it_with>/g' <filename>` : regexp
   - `-i` : ignore case
9. `diff <file_1> <file_2>`
    - `--color` : colorize the output.
