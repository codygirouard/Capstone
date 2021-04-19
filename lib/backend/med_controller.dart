import 'package:mongo_dart/mongo_dart.dart';
import 'models/users.dart';
import 'models/medicine.dart';

//! add medicine
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

//! get medicine by user ID
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

//! update medicine
updateMed(String medId) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection meds = db.collection('medicine');

  await meds.update(await meds.findOne(where.id(ObjectId.parse(medId))), {
    // reassign med attributes
  });

  print('Closing MongoDB');
  await db.close();
}

//! Delete medicine
deleteMedicine(String medId) async {
  Db db = await Db.create(
      "mongodb+srv://user:teamultragroup@cluster0.rbbqs.mongodb.net/ultramedz");
  await db.open();
  print("Connected to MongoDB");
  DbCollection meds = db.collection('medicine');

  await meds.remove(where.id(ObjectId.parse(medId)));
  print('User (_id: ${medId}) removed.');

  print('Closing MongoDB');
  await db.close();
}
