import 'package:mongo_dart/mongo_dart.dart';
import 'models/users.dart';
import 'models/medicine.dart';

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

getUserMedicine(String userId) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection meds = db.collection('medicine');

  var userMeds = await meds.find(where.eq('userID', userId)).toList();
  print(userMeds);

  print('Closing MongoDB');
  await db.close();
  return (userMeds);
}
