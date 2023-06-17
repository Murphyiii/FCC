# Note

## Learning

1. `<form>`主要包含`action`, `method`属性
1. `<fieldset>`: 对表单元素进行分组

   `<label>`: 某个元素的说明、提示

   `<input>`

    在一个`<form>`表单中上述元素可使用如下组合：

   ```html
    <form action="" method="get" class="form-example">
        <fieldset>
            <div class="form-example">
                <!-- <label>元素的for属性与<input>元素中的id属性要一致 -->
                <label for="name">Enter your name: </label>
                <input type="text" name="name" id="name" required>
            </div>
            <div class="form-example">
                <!-- <label>元素包含<input>元素时可以不需要for属性与id属性，因为已经其关联已隐含存在 -->
                <label>Enter your email: 
                    <input type="email" name="email" required>
                </label>
            </div>
            <div class="form-example">
                <input type="submit" value="Subscribe!">
            </div>
        </fieldset>
    </form>
   ```
