import 'package:mongo_dart/mongo_dart.dart';

Future<void> connectToMongo() async{
  void displayUsers(Map user) {
    print('Username: ${user["username"]}, Password: ${user["password"]}');
    }

    var db = await Db.create("mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/medicineManagement?retryWrites=true&w=majority");
    await db.open();

    var users = db.collection('user');
    await users
        .find(where
        .eq('username','demo'))
        .forEach(displayUsers);
    await db.close();
  }
