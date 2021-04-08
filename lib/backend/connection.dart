import 'package:mongo_dart/mongo_dart.dart';
import 'models/users.dart';
import 'models/medicine.dart';

//! USER METHODS
// Create User
createUser(String name, String email, int height, int weight, int age,
    String password, int streak) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  await users.insert({
    'name': name,
    'email': email,
    'password': password,
    'height': height,
    'weight': weight,
    'age': age,
    'streak': streak
  });

  print('Closing MongoDB');
  await db.close();
}

// Find User by ID
findUserById(String id) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  var user = await users.find(where.id(ObjectId.parse(id))).toList();
  print(user);

  print('Closing MongoDB');
  await db.close();
  return (user);
}

// Find user by email
findUserByEmail(String email) async {
  Db db = await Db.create(
      'mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz');
  await db.open();
  print('Connected to MongoDb');
  DbCollection users = db.collection('users');

  var user = await users.find(where.eq('email', email)).toList();

  //assign ints to values because it doesn't print correctly when using user[][] template
  var height = user[0]['height'];
  var weight = user[0]['weight'];
  var streak = user[0]['streak'];
  var age = user[0]['age'];

  //print every value of a given user
  print('Name: ' + user[0]['name']);
  print('Username: ' + user[0]['username']);
  print("Height: $height");
  print("Weight: $weight");
  print("Age: $age");
  print('Password: ' + user[0]['password']);
  print("Streak: $streak");

  print('Closing MongoDB');
  await db.close();
  return (user);
}

// Authenticate user login
authenticateUser(String email, String password) async {
  bool authenticated = false;

  Db db = await Db.create(
      'mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz');
  await db.open();
  print('Connected to MongoDb');
  DbCollection users = db.collection('users');

  if (users.find(where.eq('email', email)) != null) {
    var user = await users.find(where.eq('email', email)).toList();
    if (user[0]['password'] == password) {
      authenticated = true;
      print("Authentication Success");
    } else {
      print("Authentication Failed");
    }
  } else {
    print("Authentication Failed");
  }

  await db.close();

  return authenticated;
}

// Update User
updateUser(String id, String name, String email, int height, int weight,
    int age, String password, int streak) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  await users.update(await users.findOne(where.id(ObjectId.parse(id))), {
    'name': name,
    'email': email,
    'password': password,
    'height': height,
    'weight': weight,
    'age': age,
    'streak': streak
  });

  print('Closing MongoDB');
  await db.close();
}

// Delete User
deleteUser(String id) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  await users.remove(where.id(ObjectId.parse(id)));
  print('User (_id: ${id}) removed.');

  print('Closing MongoDB');
  await db.close();
}
//! END OF USER METHODS

//! Medicine

// add medicine
addMedicine(
    String userId, String name, String dosage, int time, int repeat) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection meds = db.collection('medicine');

  await meds.insert({
    'userID': userId,
    'name': name,
    'dosage': dosage,
    'time': time,
    'repeat': repeat,
    'completed': false
  });

  print('Closing MongoDB');
  await db.close();
}

main(List<String> args) {
  // createUser('Test 2', 'test2@email.com', 72, 175, 24, '1234', 32);
  // findUserByEmail('Test1');
  // findUserById('606ccc2e1e55117067049ba3');
  // var auth = authenticateUser('test3@email.com', '1234');
  // print(auth);
  // updateUser('606e0a407f314f0c108446f3', 'test 1 update', 'test@test.com', 175, 160, 40, '1234', 12);
  // deleteUser('606e909ff039883a1d95f0b8');
  addMedicine('606e907f779fd77e42bc71b9', 'smth', '100mg', 2100, 24);
  return;
}
