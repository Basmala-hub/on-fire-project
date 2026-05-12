class OnFireEntity {
  final FireSystemEntity fireSystem;

  const OnFireEntity({required this.fireSystem});
}

class FireSystemEntity {
  final CurrentStatusEntity currentStatus;
  final AnalyticsEntity analytics;
  final List<NotificationItemEntity> notifications;
  final List<RecordEntity> history;

  const FireSystemEntity({
    required this.currentStatus,
    required this.analytics,
    required this.notifications,
    required this.history,
  });
}

class CurrentStatusEntity {
  final int gasLevel;
  final String status;
  final int lastUpdate;
  final int peakSmokeLevel;

  const CurrentStatusEntity({
    this.gasLevel = 0,
    this.status = "Status",
    this.lastUpdate = 0,
    this.peakSmokeLevel = 0,
  });
}

class AnalyticsEntity {
  final int totalAlerts;
  final int highestSmokeLevel;
  final int averageSmokeLevel;
  final String lastPeakTime;

  const AnalyticsEntity({
    this.totalAlerts = 0,
    this.highestSmokeLevel = 0,
    this.averageSmokeLevel = 0,
    this.lastPeakTime = "lastPeakTime",
  });
}

class NotificationItemEntity {
  final String title;
  final String message;
  final String time;
  final String status;

  const NotificationItemEntity({
    this.title = "title",
    this.message = "message",
    this.time = "time",
    this.status = "status",
  });
}

class RecordEntity {
  final int gasLevel;
  final String status;
  final String time;

  const RecordEntity({
    this.gasLevel = 0,
    this.status = "status",
    this.time = "time",
  });
}
