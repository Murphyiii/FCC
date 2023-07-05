# Note

## Learning

1. There is a common pattern to visually hide text for only screen readers to read.This pattern is to set the following CSS properties:

   ```css
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   white-space: nowrap;
   border: 0;
   ```

2. [cursor](https://developer.mozilla.org/zh-CN/docs/Web/CSS/cursor) : 光标
