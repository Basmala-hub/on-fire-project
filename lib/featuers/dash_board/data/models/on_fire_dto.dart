class OnFireDto {
  FireSystem? fireSystem;

  OnFireDto({this.fireSystem});

  OnFireDto.fromJson(Map<String, dynamic> json) {
    // 1. الداتا اللي جاية هي نفسها الـ FireSystem (مفيش Root Key)
    fireSystem = FireSystem.fromJson(json);
  }
}

class FireSystem {
  CurrentStatus? currentStatus;
  Analytics? analytics;
  List<NotificationItem>? notifications;
  List<Record>? history;

  FireSystem({
    this.currentStatus,
    this.analytics,
    this.notifications,
    this.history,
  });

  FireSystem.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'] != null
        ? CurrentStatus.fromJson(
            Map<String, dynamic>.from(json['currentStatus']),
          )
        : null;

    analytics = json['analytics'] != null
        ? Analytics.fromJson(Map<String, dynamic>.from(json['analytics']))
        : null;

    // 2. تحويل الـ Map اللي جاية من فايربيس لـ List بأمان
    if (json['notifications'] != null) {
      final Map<dynamic, dynamic> notifMap = json['notifications'];
      notifications = notifMap.values
          .map((e) => NotificationItem.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } else {
      notifications = [];
    }

    if (json['history'] != null) {
      final Map<dynamic, dynamic> historyMap = json['history'];
      history = historyMap.values
          .map((e) => Record.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } else {
      history = [];
    }
  }
}

class CurrentStatus {
  int? gasLevel;
  String? status;
  int? lastUpdate;
  int? peakSmokeLevel;

  CurrentStatus({
    this.gasLevel,
    this.status,
    this.lastUpdate,
    this.peakSmokeLevel,
  });

  CurrentStatus.fromJson(Map<String, dynamic> json) {
    // 3. تأمين الأرقام لو رجعت double أو int أو null
    gasLevel = (json['gasLevel'] as num?)?.toInt() ?? 0;
    status = json['status']?.toString();
    lastUpdate = (json['lastUpdate'] as num?)?.toInt() ?? 0;
    peakSmokeLevel = (json['peakSmokeLevel'] as num?)?.toInt() ?? 0;
  }
}

class Analytics {
  int? totalAlerts;
  int? highestSmokeLevel;
  int? averageSmokeLevel;
  String? lastPeakTime;

  Analytics({
    this.totalAlerts,
    this.highestSmokeLevel,
    this.averageSmokeLevel,
    this.lastPeakTime,
  });

  Analytics.fromJson(Map<String, dynamic> json) {
    totalAlerts = (json['totalAlerts'] as num?)?.toInt();
    highestSmokeLevel = (json['highestSmokeLevel'] as num?)?.toInt();
    averageSmokeLevel = (json['averageSmokeLevel'] as num?)?.toInt();
    lastPeakTime = json['lastPeakTime']?.toString();
  }
}

class NotificationItem {
  String? title;
  String? message;
  String? time;
  String? status;

  NotificationItem({this.title, this.message, this.time, this.status});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    message = json['message']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
  }
}

class Record {
  int? gasLevel;
  String? status;
  String? time;

  Record({this.gasLevel, this.status, this.time});

  Record.fromJson(Map<String, dynamic> json) {
    // 4. معالجة غلطة الـ L الكابيتال والسمول اللي في الفايربيس
    gasLevel =
        (json['gasLevel'] as num?)?.toInt() ??
        (json['gaslevel'] as num?)?.toInt();
    status = json['status']?.toString();
    time = json['time']?.toString();
  }
}
