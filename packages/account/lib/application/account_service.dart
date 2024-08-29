import 'dart:io';

import 'package:account/application/iaccount_service.dart';
import 'package:account/data/repository/account_repository.dart';
import 'package:account/data/repository/iaccount_repository.dart';
import 'package:common/common.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountServiceProvider = Provider.autoDispose<IAccountService>((ref) {
  final accountRepository = ref.watch(accountRepositoryProvider);

  return AccountService(accountRepository);
});

final class AccountService implements IAccountService {
  final IAccountRepository _accountRepository;

  AccountService(this._accountRepository);

  @override
  Future<Result<UserEntity?, Failure>> me() async {
    try {
      final result = await _accountRepository.me();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  Future<UserEntity?> readUser() async {
    try {
      final result = await _accountRepository.readUser();

      return result;
    } on Failure catch (_) {
      rethrow;
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<Result<bool, Failure>> deleteMe() async {
    try {
      await _accountRepository.deleteMe();

      return const Success(true);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<UserEntity?, Failure>> updateMe(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await _accountRepository.updateMe(body);

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  Future<Result<bool, Failure>> signOut() async {
    try {
      final result = await _accountRepository.signOut();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  Future<Result<bool, Failure>> clearData() async {
    try {
      await _accountRepository.clearData();

      return const Success(true);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  Future<Result<String, Failure>> uploadProfilePhoto(File photo) async {
    try {
      final response = await _accountRepository.uploadProfilePhoto(photo);
      final result = response.data;

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }
}
