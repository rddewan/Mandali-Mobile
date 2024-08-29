import 'package:church/domain/church_model.dart';
import 'package:common/common.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IChurchService {
  Future<Result<List<ChurchModel>, Failure>> findAll();

  Future<Result<bool, Failure>> writeToSecureStorage(String key, String? value);
}
