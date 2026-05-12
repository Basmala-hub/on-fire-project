import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:on_fire/core/models/result_model.dart';

@injectable
class FirebaseDatabaseService {
  final FirebaseDatabase _database;

  FirebaseDatabaseService(this._database);

  /// 🔥 reference عام
  DatabaseReference ref(String path) {
    return _database.ref(path);
  }

  /// 🔥 قراءة مرة واحدة
  Future<ResultFireBase<Map<String, dynamic>?>> getData(String path) async {
    try {
      final snapshot = await _database.ref(path).get();

      if (!snapshot.exists) {
        return Sucess(data: null);
      }

      final data = Map<String, dynamic>.from(snapshot.value as Map);

      return Sucess(data: data);
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  /// 🔥 realtime stream
  Stream<ResultFireBase<Map<String, dynamic>?>> streamData(String path) {
    return _database.ref(path).onValue.map((event) {
      try {
        final data = event.snapshot.value;

        switch (data) {
          case null:
            return Sucess(data: null);

          case Map map:
            return Sucess(data: Map<String, dynamic>.from(map));

          default:
            return Error(message: "Unexpected data format");
        }
      } catch (e) {
        return Error(message: e.toString());
      }
    });
  }

  /// 🔥 إضافة بيانات
  Future<ResultFireBase<void>> setData(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      await _database.ref(path).set(data);
      return Sucess(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  /// 🔥 تحديث بيانات
  Future<ResultFireBase<void>> updateData(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      await _database.ref(path).update(data);
      return Sucess(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }

  /// 🔥 حذف بيانات
  Future<ResultFireBase<void>> deleteData(String path) async {
    try {
      await _database.ref(path).remove();
      return Sucess(data: null);
    } catch (e) {
      return Error(message: e.toString());
    }
  }
}
