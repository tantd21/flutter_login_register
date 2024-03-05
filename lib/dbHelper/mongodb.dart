
import 'dart:developer';
import 'package:thi_don_s_application2/MongoDBModel.dart';
import 'package:thi_don_s_application2/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userColection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userColection = db.collection(USER_COLLECTION);
  }
  static Future<String> insert(MongoDbModel data) async{
    try {
      var result = await userColection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Đăng ký thành công";
      } else{
        return "Đăng ký thất bại";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}