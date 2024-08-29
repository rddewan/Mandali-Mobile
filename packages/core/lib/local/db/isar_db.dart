import 'package:core/local/db/entity/church_entity.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isarDbProvider = Provider<IsarDb>((ref) {
  return IsarDb();
});

class IsarDb {
  Isar? isar;

  Future<void> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (isar != null) return;
    isar = await Isar.open(
      [UserEntitySchema, ChurchEntitySchema, SettingEntitySchema],
      directory: dir.path,
      name: 'mandali',
    );
  }

  Future<void> writeChurchs(List<ChurchEntity> churches) async {
    if (isar != null) {
      await isar?.writeTxn(() async {
        await isar?.churchEntitys.putAll(churches);
      });
    }
  }

  Future<List<ChurchEntity>> readChurchs() async {
    if (isar != null) {
      final result = await isar?.churchEntitys.where().findAll();

      return result ?? [];
    } else {
      return [];
    }
  }

  Future<void> writeUser(UserEntity user) async {
    if (isar != null) {
      await isar?.writeTxn(() async {
        await isar?.userEntitys.put(user);
      });
    }
  }

  Future<UserEntity?> readUser() async {
    if (isar != null) {
      final result = await isar?.userEntitys.where().findFirst();

      return result;
    } else {
      return null;
    }
  }

  Future<void> writeSetting(SettingEntity setting) async {
    if (isar != null) {
      final result = await isar?.settingEntitys.where().findFirst();

      if (result != null) {
        setting.id = result.id;
        await isar?.writeTxn(() async {
          await isar?.settingEntitys.put(setting);
        });

        return;
      }

      await isar?.writeTxn(() async {
        await isar?.settingEntitys.put(setting);
      });
    }
  }

  Future<SettingEntity> readSetting() async {
    if (isar != null) {
      final result = await isar?.settingEntitys.where().findFirst();

      return result ?? SettingEntity();
    }

    return SettingEntity();
  }

  Future<void> deleteAll() async {
    if (isar != null) {
      await isar?.writeTxn(() async {
        await isar?.clear();
      });
    }
  }
}
