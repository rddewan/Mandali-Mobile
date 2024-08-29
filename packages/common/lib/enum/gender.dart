part of common;

enum Gender {
  @JsonValue(0)
  undefined(key: '', value: 0),
  @JsonValue(1)
  male(key: 'Male', value: 1),
  @JsonValue(2)
  female(key: 'Female', value: 2);

  const Gender({required this.key, required this.value});

  final String key;
  final int value;
}
