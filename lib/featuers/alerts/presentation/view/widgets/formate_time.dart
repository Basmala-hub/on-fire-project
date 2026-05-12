String formatTimeFull(dynamic epoch) {
  try {
    final now = DateTime.now();

    final int value = epoch is int ? epoch : int.parse(epoch.toString());

    int v = value;

    if (v < 1000000000000) {
      v *= 1000;
    }

    DateTime date = DateTime.fromMillisecondsSinceEpoch(v);

    if (date.year < 2020) {
      date = now.subtract(
        Duration(
          minutes: value % 1440, // fake distribution
        ),
      );
    }

    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? "PM" : "AM";
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    final isYesterday = date.day == now.subtract(const Duration(days: 1)).day;

    final dayLabel = isYesterday ? "Yesterday" : "${date.day}/${date.month}";

    return "$hour12:$minute $period - $dayLabel";
  } catch (e) {
    return epoch.toString();
  }
}

// state.data.fireSystem.currentStatus.lastUpdate
// time
