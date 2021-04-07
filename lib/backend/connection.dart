import 'package:mongo_dart/mongo_dart.dart';

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

// Find User
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
  return(user);
}

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
  return(user);
}

authenticateUser(String email, String password) async {
  bool authenticated = false;

  Db db = await Db.create(
      'mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz');
  await db.open();
  print('Connected to MongoDb');
  DbCollection users = db.collection('users');

  if(users.find(where.eq('email', email)) != null){
    var user = await users.find(where.eq('email', email)).toList();
    if( user[0]['password'] == password ){
      authenticated = true;
      print("Authentication Success");
    }
    else{
      print("Authentication Failed");
    }
  }
  else{
    print("Authentication Failed");
  }

  await db.close();

  return authenticated;
}

// Update User
//updateUser() {}
/*main(List<String> args) {
  createUser('Test One', 'Test1', 62, 125, 28, '1234', 17);
  findUserByUsername('Test1');
  findUserById('606ccc2e1e55117067049ba3');
  return;
}*/
