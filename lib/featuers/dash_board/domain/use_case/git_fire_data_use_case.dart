import 'package:injectable/injectable.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';
import 'package:on_fire/featuers/dash_board/domain/repo/dash_bord_repo.dart';
@injectable
class GetFireDataUseCase {
  final OnFireRepository repository;

  GetFireDataUseCase(this.repository);

  Stream<OnFireEntity> call() {
    return repository.getFireData();
  }
}