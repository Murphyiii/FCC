let express = require('express');
let app = express();
let bodyParser = require('body-parser');

// 11.Use body-parser to Parse POST Requests
bodyParserCode = bodyParser.urlencoded({ extended: false });
app.use(bodyParserCode);

// 7.Implement a Root-Level Request Logger Middleware
/** Express evaluates functions in the order they appear in the code. This is true for middleware too. If you want it to work for all the routes, it should be mounted before them.  */
app.use((req, res, next) => {
  console.log(req.method + " " + req.path + " - " + req.ip);
  next();
});

// 1.Meet the Node console
console.log("Hello World");

// 2.Start a Working Express Server
// app.get("/", (req, res) => {
//   res.send(Hello World);
// });

// 3.Serve an HTML File
absolutePath = __dirname + "/views/index.html";

app.get("/", (req, res) => {
  res.sendFile(absolutePath);
});

// 4.Serve Static Assets
let cssAbsolutePath = __dirname + "/public";

app.use("/public", express.static(cssAbsolutePath));

// 5.Serve JSON on a Specific Route
// 6.Use the .env File
/** replit use SECRETS tab instead of .env */
app.get("/json", (req, res) => {
  if (process.env.MESSAGE_STYLE === "uppercase") {
    let msg = { "message": "HELLO JSON" };
    res.json(msg);
  } else {
    let msg = { "message": "Hello json" };
    res.json(msg);
  }
});

// 8.Chain Middleware to Create a Time Server
app.get("/now",
  (req, res, next) => {
    req.time = new Date().toString();
    next();
  },
  (req, res) => {
    res.send({
      time: req.time
    });
  });

// 9.Get Route Parameter Input from the Client
app.get("/:word/echo", (req, res, next) => {
  res.send({ echo: req.params.word });
  next();
});

// 10.Get Query Parameter Input from the Client
/** app.route(path).get(handler).post(handler) */
app.get("/name", (req, res) => {
  res.send({ name: req.query.first + ' ' + req.query.last });
});

// 12.Get Data from POST Requests
app.post("/name", (req, res) => {
  console.log(req.body)
  res.send({ name: req.body.first + " " + req.body.last });
});

module.exports = app;
