import 'package:common/common.dart';

extension UserRoleExtensions on List<UserRole?> {
  bool get canCreateChurchService => any(
        (role) =>
            role == UserRole.admin ||
            role == UserRole.superAdmin ||
            role == UserRole.elder ||
            role == UserRole.pastor ||
            role == UserRole.secretary ||
            role == UserRole.moderator,
      );
}
