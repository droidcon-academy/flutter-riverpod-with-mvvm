extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DateExtension on DateTime {
  String get format {
    return "$year/$month/$day";
  }
}
