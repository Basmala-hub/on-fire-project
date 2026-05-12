import 'package:injectable/injectable.dart';
import 'package:on_fire/featuers/dash_board/data/mapper/extenstion_mapper.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';
import 'package:on_fire/featuers/dash_board/domain/repo/dash_board_data_source.dart';
import 'package:on_fire/featuers/dash_board/domain/repo/dash_bord_repo.dart';
@LazySingleton(as: OnFireRepository)
class OnFireRepositoryImpl implements OnFireRepository {
  final FireDataSource dataSource;

  OnFireRepositoryImpl(this.dataSource);

  @override
  Stream<OnFireEntity> getFireData(){
    return dataSource.getFireData().map((dto) {
      return dto.toEntity(); 
    });
  }

}