part of 'hive_datasource.dart';

class AccountSource {
  final FlutterSecureStorage _flutterSecureStorage = getIt<FlutterSecureStorage>();

  Future<AccountHive?> getAccount() async {
    final Box<AccountHive> accountBox;
    FlutterSecureStorage secureStorage = _flutterSecureStorage;
    var key = await secureStorage.read(key: 'encryptionKey');
    var encryptionKey = base64Url.decode(key!);
    accountBox = await Hive.openBox<AccountHive>(accountBoxAccount,
        encryptionCipher: HiveAesCipher(encryptionKey));
    if (accountBox.values.toList().isNotEmpty) {
      return accountBox.values.toList().first;
    } else {
      return null;
    }
  }

  Future<void> saveAccount(AccountHive account) async {
    final Box<AccountHive> accountBox;
    FlutterSecureStorage secureStorage = _flutterSecureStorage;
    var key = await secureStorage.read(key: 'encryptionKey');
    var encryptionKey = base64Url.decode(key!);
    accountBox = await Hive.openBox<AccountHive>(accountBoxAccount,
        encryptionCipher: HiveAesCipher(encryptionKey));
    accountBox.add(account);
  }

  Future<void> clearAccount() async {
    final Box<AccountHive> accountBox;
    FlutterSecureStorage secureStorage = _flutterSecureStorage;
    var key = await secureStorage.read(key: 'encryptionKey');
    var encryptionKey = base64Url.decode(key!);
    accountBox = await Hive.openBox<AccountHive>(accountBoxAccount,
        encryptionCipher: HiveAesCipher(encryptionKey));
    accountBox.clear();
  }
}
