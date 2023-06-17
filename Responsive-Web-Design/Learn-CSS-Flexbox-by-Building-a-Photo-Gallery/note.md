# Note

## Learning

1. [Flex](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_flexible_box_layout/Basic_concepts_of_flexbox) 布局：`display: flex;`

   相关属性如下：

   - [flex-direction](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_flexible_box_layout/Basic_concepts_of_flexbox) 定义了`flex`布局中主轴的方向。取值如下：

     ```css
     flex-direction:row;
     flex-direction:row-reverse;
     flex-direction:column;
     flex-direction:column-reverse;
     ```

   - [flex-wrap](https://developer.mozilla.org/zh-CN/docs/Web/CSS/flex-wrap) 指定 flex 元素单行显示还是多行显示。如果允许换行，这个属性允许你控制行的堆叠方向。取值如下：

     ```css
     flex-wrap: nowrap; /* Default value */
     flex-wrap: wrap;
     flex-wrap: wrap-reverse;
     ```

   - [justify-content](https://developer.mozilla.org/zh-CN/docs/Web/CSS/justify-content) 定义了浏览器之间，如何分配顺着弹性容器主轴 (或者网格行轴) 的元素之间及其周围的空间。

   - [align-items](https://developer.mozilla.org/zh-CN/docs/Web/CSS/align-items) 将所有直接子节点上的 align-self 值设置为一个组。align-self 属性设置项目在其包含块中在交叉轴方向上的**对齐方式**。在 Flexbox 中，它控制十字轴上项目的对齐方式，在网格布局中，它控制块轴上项目的对齐方式。
   - [gap](https://developer.mozilla.org/zh-CN/docs/Web/CSS/gap) 是用来设置网格行与列之间的间隙（gutters），该属性是 row-gap 和 column-gap 的简写形式。

     该属性增加的间隔不属于 margin, border, padding 三项任一。

1. [object-fit](https://developer.mozilla.org/zh-CN/docs/Web/CSS/object-fit) 属性指定可替换元素（例如：`<img>` 或 `<video>`）的内容应该如何适应到其使用高度和宽度确定的框。取值如下：

    ```css
    object-fit: contain; /* 缩放保持其宽高比 */
    object-fit: cover; /* 保持其宽高比，大小不匹配时将对象裁剪以适应内容框 */
    object-fit: fill; /* 完全填充，不匹配时将对象拉伸 */
    object-fit: none; /* 保持其原有的尺寸 */
    object-fit: scale-down; /* 内容的尺寸与 none 或 contain 中的一个相同，取决于它们两个之间谁得到的对象尺寸会更小一些。 */
    ```

1. [obejct-postion](https://developer.mozilla.org/zh-CN/docs/Web/CSS/object-position) 规定了可替换元素的内容在其内容框中的位置。取值如下：

    ```css
    /* 使用 1 到 4 个值来定义该元素在它所处的二维平面中的定位。可以使用相对或绝对偏移。这些定位方式允许被替换元素的对象被定位到内容框外部。 */
    
    /* 关键字值 */
    object-position: top;
    object-position: bottom;
    object-position: left;
    object-position: right;
    object-position: center;

    /* <percentage> 值 */
    object-position: 25% 75%;

    /* <length> 值 */
    object-position: 0 0;
    object-position: 1cm 2cm;
    object-position: 10ch 8em;

    /* 边缘偏移值 */
    object-position: bottom 10px right 20px;
    object-position: right 3em bottom 10px;
    object-position: top 0 right 10px;
    ```
