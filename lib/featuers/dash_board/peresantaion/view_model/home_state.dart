import 'package:fl_chart/fl_chart.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';


abstract class FireState {}

class InitialState extends FireState {}

class LoadingState extends FireState {}

class SucessState extends FireState {
  final OnFireEntity data;
final List<FlSpot> trend;
  SucessState({required this.data, required this.trend});
}

class ErrorState extends FireState{
  final String massege;
  ErrorState({required this.massege});
}
