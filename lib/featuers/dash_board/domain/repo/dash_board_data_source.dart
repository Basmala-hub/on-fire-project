import 'package:on_fire/featuers/dash_board/data/models/on_fire_dto.dart';

abstract interface class FireDataSource {
  Stream<OnFireDto> getFireData();
}