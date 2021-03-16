import 'package:mongo_dart/mongo_dart.dart';

void main(List<String> args) async {
  Db db = await Db.create("mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");

  DbCollection users = db.collection('users');
  
  // Create
  // Read
  var user = await users.find(where.eq('username', 'demo')).toList();
  print(user);
  // Update
  // Delete
}