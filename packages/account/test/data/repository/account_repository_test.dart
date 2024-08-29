import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:account/data/repository/account_repository.dart';
import 'package:account/data/api/account_api.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:core/local/db/entity/user_entity.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockAccountApi extends Mock implements AccountApi {}

class MockIsarDb extends Mock implements IsarDb {}

class MockIsecureStorage extends Mock implements ISecureStorage {}

void main() {
  test('updates_user_display_name_in_firebase', () async {
    final mockFirebaseAuth = MockFirebaseAuth();
    final mockUser = MockUser();
    final mockAccountApi = MockAccountApi();
    final mockIsarDb = MockIsarDb();
    final mockIsecureStorage = MockIsecureStorage();
    final accountRepository = AccountRepository(
      mockAccountApi,
      mockIsarDb,
      mockIsecureStorage,
    );

    final body = {'name': 'New Name'};

    when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
    when(() => mockUser.updateDisplayName('Richard'))
        .thenAnswer((_) async => Future.value());
    when(() => mockUser.reload()).thenAnswer((_) async => Future.value());
    //when(() => mockAccountApi.updateMe(body)).thenAnswer((_) async => Response(data: {}));
    //when(() => mockIsarDb.writeUser(any)).thenAnswer((_) async => Future.value());
    when(() => mockIsarDb.readUser()).thenAnswer((_) async => UserEntity());

    final result = await accountRepository.updateMe(body);

    verify(() => mockUser.updateDisplayName('Richard')).called(1);
    expect(result, isA<UserEntity>());
  });
}
