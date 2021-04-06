import 'package:mongo_dart/mongo_dart.dart';

dbConnect() async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection users = db.collection('users');

  await users.insert({
    'name': 'Test Two',
    'username': 'test1',
    'height': 72,
    'weight': 188,
    'age': 25,
    'password': 'hashedpass',
    'streak': 4
  });
}

main(List<String> args) {
  dbConnect();
  return;
}
