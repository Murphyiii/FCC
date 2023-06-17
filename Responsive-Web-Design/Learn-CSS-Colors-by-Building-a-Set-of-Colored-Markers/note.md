# Note

## Learning

1. W3Schools [CSS Color](https://www.w3schools.com/colors/default.asp) 文档
1. 颜色表示方法
   - [Color Names](https://www.w3schools.com/colors/colors_names.asp): CSS supports 140 standard color names.
   - [The currentcolor Keyword](https://www.w3schools.com/colors/colors_groups.asp)：`white`, `green`, `blue`...
   - [RGB()](https://www.w3schools.com/colors/colors_rgb.asp)：白色`rgb(255, 255, 255)`, 黑色`rgb(0, 0, 0)`
   - [HSL()](https://www.w3schools.com/colors/colors_hsl.asp)：白色`hsl(0, 0%, 100%)`, 其中三个参数分别为 hue（色相）、saturation（饱和度）、lightness（亮度）
   - [HEX](https://www.w3schools.com/colors/colors_hexadecimal.asp): #RRGGBB

1. [Color Converter](https://www.w3schools.com/colors/colors_converter.asp) 转换颜色的各种表示方法
1. `linear gradient()`函数用于创建一个表示两种或多种颜色线性渐变的图片。其结果属于`<gradient>`数据类型，是一种特别的`<mage>`数据类型。

    ```css
    /* 渐变轴为45度，从蓝色渐变到红色 */
    linear-gradient(45deg, blue, red);

    /* 从右下到左上、从蓝色渐变到红色 */
    linear-gradient(to left top, blue, red);

    /* 从下到上，从蓝色开始渐变、到高度 40% 位置是绿色渐变开始、最后以红色结束 */
    linear-gradient(0deg, blue, green 40%, red);
    
    /* 以上颜色均可使用其他表示方法表示 */
    ```

1. [box-shadow](https://developer.mozilla.org/zh-CN/docs/Web/CSS/box-shadow) 属性用于在元素的框架上添加阴影效果。你可以在同一个元素上设置多个阴影效果，并用逗号将他们分隔开。该属性可设置的值包括阴影的 X 轴偏移量、Y 轴偏移量、模糊半径、扩散半径和颜色。

    ```css
    /* x 偏移量 | y 偏移量 | 阴影颜色 */
    box-shadow: 60px -16px teal;

    /* x 偏移量 | y 偏移量 | 阴影模糊半径 | 阴影颜色 */
    box-shadow: 10px 5px 5px black;

    /* x 偏移量 | y 偏移量 | 阴影模糊半径 | 阴影扩散半径 | 阴影颜色 */
    box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);

    /* 插页 (阴影向内) | x 偏移量 | y 偏移量 | 阴影颜色 */
    box-shadow: inset 5em 1em gold;

    /* 任意数量的阴影，以逗号分隔 */
    box-shadow: 3px 3px red, -1em 0 0.4em olive;

    /* 全局关键字 */
    box-shadow: inherit;
    box-shadow: initial;
    box-shadow: unset;
    ```
