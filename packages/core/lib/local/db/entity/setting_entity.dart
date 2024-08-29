import 'package:isar/isar.dart';

part 'setting_entity.g.dart';

@collection
class SettingEntity {
  @Index(unique: true)
  Id id = Isar.autoIncrement;
  String theme = 'light';
  String language = 'en';
  String timeZone = 'Asia/Kolkata';
}
