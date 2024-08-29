import 'package:church/application/ichurch_service.dart';
import 'package:church/data/repository/church_repository.dart';
import 'package:church/data/repository/ichurch_repository.dart';
import 'package:church/domain/church_model.dart';
import 'package:common/common.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final churchServiceProvider = Provider<IChurchService>((ref) {
  final churchRepository = ref.watch(churchRepositoryProvider);

  return ChurchService(churchRepository);
});

final class ChurchService implements IChurchService {
  final IChurchRepository _churchRepository;

  const ChurchService(this._churchRepository);

  @override
  Future<Result<List<ChurchModel>, Failure>> findAll() async {
    try {
      final result = await _churchRepository.findAll();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }

  @override
  Future<Result<bool, Failure>> writeToSecureStorage(
    String key,
    String? value,
  ) async {
    try {
      await _churchRepository.writeToSecureStorage(key, value);

      return const Success(true);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(message: e.toString(), stackTrace: s));
    }
  }
}
