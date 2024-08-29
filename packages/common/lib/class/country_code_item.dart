part of common;

class CountryCodeItem {
  final String countryCode;
  final String phoneCode;
  final String name;

  CountryCodeItem({
    required this.countryCode,
    required this.phoneCode,
    required this.name,
  });

  factory CountryCodeItem.fromJson(Map<String, String> data) {
    return CountryCodeItem(
      countryCode: data['countryCode']!,
      phoneCode: data['phoneCode']!,
      name: data['name']!,
    );
  }
}
