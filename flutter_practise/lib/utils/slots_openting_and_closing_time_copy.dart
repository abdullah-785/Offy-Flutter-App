List<DateTime> slotsBWOpeningAndClosingTimeCopy(
  DateTime opening,
  DateTime closing,
  int slotDuration,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // from arguments opening and closing datetime create time slots list
  List<DateTime> timeSlots = [];

  DateTime currentSlot = opening;

  while (currentSlot.isBefore(closing)) {
    timeSlots.add(currentSlot);
    currentSlot = currentSlot.add(Duration(minutes: slotDuration));
  }

  final now = DateTime.now();
  return timeSlots.where((dateTime) => dateTime.isAfter(now)).toList();

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
