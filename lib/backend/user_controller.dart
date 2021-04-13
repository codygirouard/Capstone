import 'package:mongo_dart/mongo_dart.dart';
import 'models/users.dart';
import 'models/medicine.dart';

//! USER METHODS
//! Create User
Future <bool> createUser(String fName, String lName, String email, int height, int weight, int age,
    String password, int streak, String phone, String pharmacy, String insurance, String gender, String maiden) async {
  var failed = false;
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  //assign number of instances of this email to 'exists'
  int exists = await users.count(where.eq('email',email));

  if (exists != 1) {
    //insert user into mongoDb
      await users.insert({
        'fName': fName,
        'lName': lName,
        'email': email,
        'password': password,
        'height': height,
        'weight': weight,
        'age': age,
        'streak': streak,
        'phone': phone,
        'pharmacy': pharmacy,
        'insurance': insurance,
        'gender': gender,
        'maiden': maiden
      });
      print('User created!');
  }else{
    failed = true;
    print('Exists Already');
  }

  print('Closing MongoDB');
  await db.close();
  return failed;
}

//! Find User by ID
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

//! Find user by email
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
  print('Email: ' + user[0]['email']);
  print("Height: $height");
  print("Weight: $weight");
  print("Age: $age");
  print('Password: ' + user[0]['password']);
  print("Streak: $streak");

  print('Closing MongoDB');
  await db.close();
  return (user);
}

//! Update User
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

//! Delete User
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

main(List<String> args) {
  return;
}
