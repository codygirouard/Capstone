import 'package:mongo_dart/mongo_dart.dart';

// Create User
createUser(String name, String username, int height, int weight, int age,
    String password, int streak) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  await users.insert({
    'name': name,
    'username': username,
    'height': height,
    'weight': weight,
    'age': age,
    'password': password,
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
}

findUserByUsername(String username) async {
  Db db = await Db.create(
      'mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz');
  await db.open();
  print('Connected to MongoDb');
  DbCollection users = db.collection('users');

  var user = await users.find(where.eq('username', username)).toList();
  print(user);

  print('Closing MongoDB');
  await db.close();
}

// Update User
//updateUser() {}
main(List<String> args) {
  createUser('Test One', 'Test1', 62, 125, 28, '1234', 17);
  findUserByUsername('Test1');
  findUserById('606ccc2e1e55117067049ba3');
  return;
}
