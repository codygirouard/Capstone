import 'package:mongo_dart/mongo_dart.dart';

dbConnect() async {
  var db = Db("mongodb+srv://<user>:<password>@<host>:<port>/<database-name>?<parameters>");
  await db.open();
}

