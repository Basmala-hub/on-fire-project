import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:on_fire/featuers/dash_board/domain/use_case/git_fire_data_use_case.dart';
import 'home_state.dart';

@injectable
class OnFireCubit extends Cubit<FireState> {
  final GetFireDataUseCase useCase;

  StreamSubscription? _subscription;

  List<FlSpot> trendData = [];
  int time = 0;

  OnFireCubit(this.useCase) : super(InitialState());

  void listenToFire() {
    emit(LoadingState());

    _subscription?.cancel();

    _subscription = useCase().listen(
      (data) {
        try {
          final value = data.fireSystem.currentStatus.peakSmokeLevel.toDouble();

          _addTrend(value);

          print("Cubit Data: ${data.fireSystem.currentStatus.gasLevel}");
          emit(SucessState(data: data, trend: List.from(trendData)));
          emit(SucessState(data: data, trend: List.from(trendData)));
        } catch (e) {
          emit(ErrorState(massege: e.toString()));
        }
      },
      onError: (error) {
        emit(ErrorState(massege: error.toString()));
      },
    );
  }

  void _addTrend(double value) {
    trendData.add(FlSpot(time.toDouble(), value));
    time++;

    if (trendData.length > 20) {
      trendData.removeAt(0);
    }
  }

  void clearTrend() {
    trendData.clear();
    time = 0;
  }

  void stopListening() {
    _subscription?.cancel();
    emit(InitialState());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
