import 'package:intl/intl.dart';

String? getNext7Months(int index) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final int a = index;

  List<String> nextSevenDays = [];
  final now = DateTime.now();
  final formatter = DateFormat('MMM');
  for (int i = 0; i < 7; i++) {
    final date = now.add(Duration(days: i));
    final formattedDate = formatter.format(date);
    nextSevenDays.add(formattedDate);
  }
  return nextSevenDays[a];

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
