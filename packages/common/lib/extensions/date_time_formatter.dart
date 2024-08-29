part of common;

extension DateTimeFormatter on DateTime? {
  String get dateTimeToString =>
      DateFormat('dd/MM/yyyy h:mm a').format(this ?? DateTime.now());

  String get dateTimeOrderHistory =>
      DateFormat('dd MMM yyyy').format(this ?? DateTime.now());
}

extension DateOfBirthFormatter on DateTime {
  String get dateOfBirth => DateFormat('yyyy-MM-dd').format(this);
}
