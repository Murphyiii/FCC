# Note

## Learning

1. In JavaScript, scope refers to the `visibility` of variables. Variables which are defined outside of a function block have Global scope. This means, they can be seen everywhere in your JavaScript code. Variables which are declared without the `let` or `const` keywords are automatically created in the `global scope`. This can create unintended consequences elsewhere in your code or when running a function again. You should always declare your variables with let or const.
2. Remember that `undefined` is a keyword, not a string.
3. Access Object Data:
   - `Dot Notation`
   - `Bracket Notation`
     - If the property of the object you are trying to access has a `space` in its name, you will need to use bracket notation.
     - Another use of bracket notation on objects is to access a property which is stored as the value of a `variable`. This can be very useful for `iterating` through an object's properties or when accessing a lookup table.
4. You can add new properties to existing JavaScript objects the same way you would modify them.
5. `object.hasOwnProperty(property)` To check if a property on a given object exists or not. **Recommend use `Object.hasOwn(object, property)` instead of `object.hasOwnProperty(property)`.**
6. Sometimes you may want to store data in a `flexible` Data Structure. A JavaScript object is one way to handle flexible data. They allow for arbitrary combinations of `strings`, `numbers`, `booleans`, `arrays`, **`functions`**, and **`objects`**.
7. Array
   - pop()
   - push()
   - shift()  : 删除第一个元素，并返回该元素
   - unshift() : 从头添加元素，并返回数组长度 *head insert*
8. Math.random() : [0, 1)
