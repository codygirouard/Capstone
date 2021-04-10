import 'package:mongo_dart/mongo_dart.dart';
import 'models/users.dart';
import 'models/medicine.dart';

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

  print('Closing MongoDB');
  await db.close();

  return authenticated;
}

main(List<String> args) {
  return;
}
