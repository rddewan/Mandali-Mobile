import 'package:church/domain/church_model.dart';
import 'package:core/local/db/entity/church_entity.dart';

abstract interface class IChurchRepository {
  Future<List<ChurchModel>> findAll();

  Future<void> writeChurchs(List<ChurchEntity> churches);

  Future<List<ChurchEntity>> readChurchs();

  Future<void> writeToSecureStorage(String key, String? value);
}
