import 'dart:io';

import 'package:account/data/dto/profile_photo_response.dart';
import 'package:core/local/db/entity/user_entity.dart';

abstract interface class IAccountRepository {
  Future<UserEntity?> me();

  Future<ProfilePhotoResponse> uploadProfilePhoto(File photo);

  Future<UserEntity?> updateMe(Map<String, dynamic> body);

  Future<UserEntity?> readUser();

  Future<void> writeUser(UserEntity user);

  Future<void> deleteMe();

  Future<bool> signOut();

  Future<void> clearData();
}
