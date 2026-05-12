
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';

abstract class OnFireRepository {
  Stream<OnFireEntity> getFireData();
}