require('dotenv').config();

// 1.Install and Set Up Mongoose
/** Do not surround the values with quotes when using the Replit SECRETS tab. */
const mongoose = require('mongoose');
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

// 2.Create a Model
let personSchema = mongoose.Schema({
  name:{
    type:String,
    require:true
  },
  age:Number,
  favoriteFoods:[String]
});

let Person = mongoose.model("Person", personSchema);

// 3.Create and Save a Record of a Model
const createAndSavePerson = (done) => {
  let person1 = new Person({
    name: "Murphy",
    age: "20",
    favoriteFoods: ["carrot"]
  });

  person1.save((err, data) => {
    if(err)
      return console.log(err);
    done(null, data);
  })
};

// 4.Create Many Records with model.create()
let arrayOfPeople = [{name: "Joe", age: "20", favoriteFoods: ["Pizza"]}, {name: "Will", age: "12", favoriteFoods: ["Mcdonalds"]}];

const createManyPeople = (arrayOfPeople, done) => {
  Person.create(arrayOfPeople, (err, people) => {
    if(err)
      console.log(err);
    done(null, people);
  });
};

// 5.Use model.find() to Search Your Database
const findPeopleByName = (personName, done) => {
  var key = { name: personName };
  Person.find(key, (err, people) => {
    if(err)
      console.log(err);
    done(null, people);
  });
};

// 6.Use model.findOne() to Return a Single Matching Document from Your Database
const findOneByFood = (food, done) => {
  var key = { favoriteFoods: food };
  Person.findOne(key, (err, person) => {
    if(err)
      console.log(err);
    done(null, person);
  });
};

// 7.Use model.findById() to Search Your Database By _id
const findPersonById = (personId, done) => {
  var key = { _id: personId };
  Person.findById(key, (err, person) => {
    if(err)
      console.log(err);
    done(null, person);
  });
};

// 8.Perform Classic Updates by Running Find, Edit, then Save
const findEditThenSave = (personId, done) => {
  const foodToAdd = "hamburger";
  var key = { _id: personId };
  Person.findById(key, (err, person) => {
    if(err)
      console.log(err);
    person.favoriteFoods.push(foodToAdd);
    person.save((err, updatedPerson) => {
      if(err) return console.log(err);
      done(null, updatedPerson);
    });
  });
};

// 9.Perform New Updates on a Document Using model.findOneAndUpdate()
const findAndUpdate = (personName, done) => {
  const ageToSet = 20;
  var key = { name: personName };
  var updateProperty = { age: ageToSet };
  Person.findOneAndUpdate(personName, updateProperty, { new: true }, (err, person) => {
    if(err)
      console.log(err);
    done(null, person);
  });
};

// 10.Delete One Document Using model.findByIdAndRemove
const removeById = (personId, done) => {
  var key = { _id: personId };
  Person.findByIdAndRemove(key, (err, person) => {
    if(err)
      console.log(err);
    done(null, person);
  });
};

// 11.Delete Many Documents with model.remove()
const removeManyPeople = (done) => {
  const nameToRemove = "Mary";
  var key = { name: nameToRemove };
  Person.remove(key, (err, deleteInfo) => {
    if(err)
      console.log(err);
    done(null, deleteInfo);
  });
};

// 12.Chain Search Query Helpers to Narrow Search Results
const queryChain = (done) => {
  const foodToSearch = "burrito";
  var key = { favoriteFoods: foodToSearch };
  Person
    .find(key)
    .sort({ name: 1 })
    .limit(2)
    .select({ age: false })
    .exec((err, data) => {
      if(err)
        console.log(err);
      console.log(data);
      done(null, data);
    });
};

/** **Well Done !!**
/* You completed these challenges, let's go celebrate !
 */

//----- **DO NOT EDIT BELOW THIS LINE** ----------------------------------

exports.PersonModel = Person;
exports.createAndSavePerson = createAndSavePerson;
exports.findPeopleByName = findPeopleByName;
exports.findOneByFood = findOneByFood;
exports.findPersonById = findPersonById;
exports.findEditThenSave = findEditThenSave;
exports.findAndUpdate = findAndUpdate;
exports.createManyPeople = createManyPeople;
exports.removeById = removeById;
exports.removeManyPeople = removeManyPeople;
exports.queryChain = queryChain;
