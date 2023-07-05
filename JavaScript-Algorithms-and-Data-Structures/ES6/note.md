# Note

ES6 is ES2015.

## Learning

1. Variable declaration
    - When you declare a variable with the `var` keyword, it is declared globally, or **locally if declared inside a function**.
    - The `let` keyword behaves similarly, but with some extra features. When you declare a variable with the let keyword inside a block, statement, or expression, its scope is limited to that block, statement, or expression.

      ```JavaScript
      var printNumTwo;
      for (var i = 0; i < 3; i++) {
         if (i === 2) {
            printNumTwo = function() {
               return i;
            };
         }
      }
      console.log(printNumTwo());
      // Here the console will display the value 3.
      ```

    - `const` has all the awesome features that let has, with the added bonus that variables declared using const are read-only. They are a constant value, which means that once a variable is assigned with const, it cannot be reassigned. However, it is important to understand that **objects** (including arrays and functions) assigned to a variable using const are still mutable. Using the const declaration only prevents reassignment of the variable identifier.

        ```JavaScript
        const s = [5, 6, 7];
        s = [1, 2, 3];
        s[2] = 45;
        console.log(s);
        /* s = [1, 2, 3] will result in an error. After commenting out that line, the console.log will display the value [5, 6, 45]. */
        ```

        Like all arrays, the **array elements** in s are mutable, but because const was used, you cannot use the variable identifier s to **point to a different array using the assignment operator**.

2. Object.freeze(obj) : Ensure your data doesn't change. Any attempt at changing the object will be rejected, with an error thrown if the script is running in strict mode.

    ```JavaScript
    let obj = {
      name:"FreeCodeCamp",
      review:"Awesome"
    };
    Object.freeze(obj);
    obj.review = "bad";
    obj.newProp = "Test";
    console.log(obj); 
    /* The obj.review and obj.newProp assignments will result in errors, because our editor runs in strict mode by default, and the console will display the value { name: "FreeCodeCamp", review: "Awesome" }.*/
    ```

3. Arrow function syntax

    ```JavaScript
    const myFunc = () => {
      const myVar = "value";
      return myVar;
    }
    ```

    ```JavaScript
    const myFunc = function() {
      const myVar = "value";
      return myVar;
    }
    ```

    - When there is no function body, and only a return value, arrow function syntax allows you to omit the keyword return as well as the brackets surrounding the code. This helps simplify smaller functions into one-line statements:

        ```JavaScript
        const myFunc = () => "value";
        ```

    - Pass arguments into an arrow function. (The return keyword is omitted)

        ```JavaScript
        const doubler = (item) => item * 2;
        /* If an arrow function has a single parameter, the parentheses enclosing the parameter may be omitted. */
        const doubler2 = item => item * 2;

        const multiplier = (item, multi) => item * multi;
        ```

        ```JavaScript
        const doubler = (item) => {return item * 2;}
        ```

        *PS: Arrow function should be a **constant** variable.*

    - Default Parameters

        ```JavaScript
        const greeting = (name = "Anonymous") => "Hello " + name;
        console.log(greeting("John"));
        console.log(greeting());
        // The console will display the strings Hello John and Hello Anonymous.
        ```

4. Rest Parameters : With the rest parameter, you can create functions that take a variable number of arguments. These arguments are stored in an `array` that can be accessed later from inside the function.

   ```JavaScript
   function howMany(...args) {
       return "You have passed " + args.length + " arguments.";
   }
   console.log(howMany(0, 1, 2));
   console.log(howMany("string", null, [1, 2, 3], { }));
   /* Output: You have passed 3 arguments.
   You have passed 4 arguments. */
   ```

5. Spread operator : ES6 introduces the spread operator, which allows us to `expand` arrays and other expressions in places where multiple parameters or elements are expected.

    ```JavaScript
    const arr1 = ['JAN', 'FEB', 'MAR', 'APR', 'MAY'];
    let arr2;
    arr2 = [...arr1];
    console.log(arr2);
    // Output: ['JAN', 'FEB', 'MAR', 'APR', 'MAY']

    /* console.log(arr2 === arr1) // Output: false */

    const [a, b] = [1, 2, 3, 4, 5, 6];
    console.log(a, b);
    // Output: 1, 2

    const [a, b,,, c] = [1, 2, 3, 4, 5, 6];
    console.log(a, b, c);
    // Output: 1, 2, 5
    
    [a, b] = [b, a];
    // use array destructuring to swap a and b

    const [a, b, ...arr] = [1, 2, 3, 4, 5, 7];
    console.log(a, b);
    console.log(arr);
    // Output: 1, 2 and [3, 4, 5, 7]
    ```

6. [apply()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)
7. Destructuring assignment is special syntax introduced in ES6, for neatly assigning values taken directly from an object.

   ```JavaScript
   const user = { name: 'John Doe', age: 34 };
   // ES5
   const name = user.name;
   const age = user.age;
   // ES6
   const { name, age } = user;
   ```

   You can extract as many or few values from the object as you want.

   ```JavaScript
   const { name } = user;
   ```

   Destructuring allows you to assign a new variable name when extracting values.

   ```JavaScript
    const { name: userName, age: userAge } = user;
   ```

   In some cases, you can destructure the object in a function argument itself.

   Consider the code below:

    ```JavaScript
    const profileUpdate = (profileData) => {
        const { name, age, nationality, location } = profileData;
    }
    ```

    This effectively destructures the object sent into the function. This can also be done in-place:

    ```JavaScript
    const profileUpdate = ({ name, age, nationality, location }) => {
        console.log(name);     
    }
    const profileData = { name: "murphy" };
    // call it
    profileUpdate(profileData);
    // Output: murphy
    ```

8. Template literal : Template literals allow you to create `multi-line` strings and to use `string interpolation features` to create strings. backticks ` and ${variable} or ${expertion}

    ```JavaScript
    const person = {
        name: "Zodiac Hasbro",
        age: 56
    };
    // This saves inserting \n within strings. 
    const greeting = `Hello, my name is ${person.name}!
    I am ${person.age} years old.`;
    /**
        * Output: Hello, my name is Zodiac Hasbro!
        * I am 56 years old.
        */
    ```

9. Write Concise Object Literal Declarations Using Object Property Shorthand

    ```JavaScript
    // ES5
    const createPerson = (name, age, gender) => {
        return {
            name,
            age,
            gender
        };
    };
    // ES6
    const createPerson = (name, age, gender) => {
        return {
            name,
            age,
            gender
        };
    };
    ```

10. Defining functions within objects

    ```JavaScript
    // ES5
    const person = {
    name: "Taylor",
    sayHello: function() {
        return `Hello! My name is ${this.name}.`;
    }
    };
    // ES6
    const person = {
    name: "Taylor",
    sayHello() {
        return `Hello! My name is ${this.name}.`;
    }
    };
    ```

11. `class`, In ES6, if the constructor method is not explicitly defined, then it is implicitly defined with no arguments.

    ```JavaScript
    class Clazz {
        constructor() {

        }
        OtherMethod() {

        }
        set property(arg) {
            this.property = arg;
        }
        get property() {
            return this.property;
        }
    }
    const Clazz1 = new Clazz();
    // call set
    Clazz1.property = "arg";
    // call get
    console.log(Clazz1.property);
    ```

12. [export](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/export)

    ```JavaScript
    const func1 = function(arg) {

    }

    const object1 = {};

    export {func1, object1};

    // default export
    exporst default func1() {

    };
    ```

    [import](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/import)

    ```JavaScript
    import {func1, object1} from "filepath/filename.js";

    // import all from one file
    // import * as name from "filepath/filename.js";

    // Alias
    // import {func1 as alias, object1} from "filepath/filename.js";

    // Default import, is not surrounded by curly braces
    // import name from "filepath/filename.js";

    // call it
    func1();
    ```

13. [promise](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise)
    - Promise is a `constructor` function, so you need to use the new keyword to create one.
    - There are three states: pending, fulfilled, and rejected.

    ```JavaScript
    // Handle a Fulfilled Promise with then
    const makeServerRequest = new Promise((resolve, reject) => {
    // responseFromServer is set to true to represent a successful response from a server
        let responseFromServer = true;
        if(responseFromServer) {
            resolve("We got the data");
        } else {  
            reject("Data not received");
        }
    });
    // resolve
    makeServerRequest.then(result => {
        console.log(result);
    });
    // reject
    makeServerRequest.catch(error => {
        console.log(error);
    });
    ```
