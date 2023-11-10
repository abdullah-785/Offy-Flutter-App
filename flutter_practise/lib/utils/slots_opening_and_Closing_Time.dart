List<DateTime> slotsBWOpeningAndClosingTime(
  DateTime opening,
  DateTime closing,
  int slotDuration,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  List<DateTime> slots = [];
  int slotDurationInMinutes = slotDuration ?? 60;
  DateTime currentSlot = DateTime(
    opening.year,
    opening.month,
    opening.day,
    opening.hour,
    opening.minute,
  );

  while (currentSlot.isBefore(closing) || currentSlot == closing) {
    slots.add(currentSlot);
    currentSlot = currentSlot.add(Duration(minutes: slotDurationInMinutes));
  }
  final now = DateTime.now();
  return slots.where((dateTime) => dateTime.isAfter(now)).toList();

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
