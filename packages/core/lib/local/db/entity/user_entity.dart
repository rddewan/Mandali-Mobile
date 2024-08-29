// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:isar/isar.dart';

part 'user_entity.g.dart';

@collection
class UserEntity {
  Id? id;

  String? name;
  String? email;
  String? phoneNumber;
  String? photo;

  List<RoleEntity>? role;
  UserChurchEntity? church;
}

@embedded
class RoleEntity {
  int? id;
  @Enumerated(EnumType.name)
  UserRole? name;
}

@embedded
class UserChurchEntity {
  int? id;
  String? name;
}
