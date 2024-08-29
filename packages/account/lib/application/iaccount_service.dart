import 'dart:io';

import 'package:common/common.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IAccountService {
  Future<Result<UserEntity?, Failure>> me();

  Future<Result<String, Failure>> uploadProfilePhoto(File photo);

  Future<Result<UserEntity?, Failure>> updateMe(Map<String, dynamic> body);

  Future<UserEntity?> readUser();

  Future<Result<bool, Failure>> deleteMe();

  Future<Result<bool, Failure>> signOut();

  Future<Result<bool, Failure>> clearData();
}
