// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:on_fire/featuers/dash_board/data/api/fire_base_servie.dart'
    as _i744;
import 'package:on_fire/featuers/dash_board/data/repo/fire_data_source_imp.dart'
    as _i1060;
import 'package:on_fire/featuers/dash_board/data/repo/fire_repo_imp.dart'
    as _i719;
import 'package:on_fire/featuers/dash_board/domain/repo/dash_board_data_source.dart'
    as _i235;
import 'package:on_fire/featuers/dash_board/domain/repo/dash_bord_repo.dart'
    as _i67;
import 'package:on_fire/featuers/dash_board/domain/use_case/git_fire_data_use_case.dart'
    as _i1032;
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_cubit.dart'
    as _i81;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i744.FirebaseDatabaseService>(
      () => _i744.FirebaseDatabaseService(gh<_i345.FirebaseDatabase>()),
    );
    gh.lazySingleton<_i235.FireDataSource>(() => _i1060.FireDataSourceImpl());
    gh.lazySingleton<_i67.OnFireRepository>(
      () => _i719.OnFireRepositoryImpl(gh<_i235.FireDataSource>()),
    );
    gh.factory<_i1032.GetFireDataUseCase>(
      () => _i1032.GetFireDataUseCase(gh<_i67.OnFireRepository>()),
    );
    gh.factory<_i81.OnFireCubit>(
      () => _i81.OnFireCubit(gh<_i1032.GetFireDataUseCase>()),
    );
    return this;
  }
}
