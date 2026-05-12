import 'package:on_fire/featuers/dash_board/data/models/on_fire_dto.dart';
import 'package:on_fire/featuers/dash_board/domain/entites/on_fire_entity.dart';

extension OnFireMapper on OnFireDto {
  OnFireEntity toEntity() {
    return OnFireEntity(
      fireSystem: FireSystemEntity(
        currentStatus: CurrentStatusEntity(
          gasLevel: fireSystem?.currentStatus?.gasLevel ?? 0,
          status: fireSystem?.currentStatus?.status ?? "",
          lastUpdate: fireSystem?.currentStatus?.lastUpdate ?? 0,
          peakSmokeLevel: fireSystem?.currentStatus?.peakSmokeLevel ?? 0,
        ),
        analytics: AnalyticsEntity(
          totalAlerts: fireSystem?.analytics?.totalAlerts ?? 0,
          highestSmokeLevel: fireSystem?.analytics?.highestSmokeLevel ?? 0,
          averageSmokeLevel: fireSystem?.analytics?.averageSmokeLevel ?? 0,
          lastPeakTime: fireSystem?.analytics?.lastPeakTime ?? "",
        ),
        notifications: (fireSystem?.notifications ?? [])
            .map((e) => NotificationItemEntity(
                  title: e.title ?? "",
                  message: e.message ?? "",
                  time: e.time ?? "",
                  status: e.status ?? "",
                ))
            .toList(),
        history: (fireSystem?.history ?? [])
            .map((e) => RecordEntity(
                  gasLevel: e.gasLevel ?? 0,
                  status: e.status ?? "",
                  time: e.time ?? "",
                ))
            .toList(),
      ),
    );
  }
}