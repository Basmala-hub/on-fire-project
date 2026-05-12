import 'package:injectable/injectable.dart';
import 'package:on_fire/featuers/dash_board/data/models/on_fire_dto.dart';
import 'package:on_fire/featuers/dash_board/domain/repo/dash_board_data_source.dart';
import 'package:firebase_database/firebase_database.dart';

@LazySingleton(as: FireDataSource)
class FireDataSourceImpl implements FireDataSource {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref("fireSystem");

  @override
  Stream<OnFireDto> getFireData() {
    return _ref.onValue.map((event) {
      final raw = event.snapshot.value;

      print("RAW DATA: $raw");

      if (raw == null) {
        throw Exception("No data found in Firebase");
      }

      final data = Map<String, dynamic>.from(raw as Map);

      return OnFireDto.fromJson(data);
    });
  }
}
