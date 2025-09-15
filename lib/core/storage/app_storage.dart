import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> initStorage() async {
    await GetStorage.init();
    print("get storage initialized");
  }

  static void write(String key, dynamic value) {
    _box.write(key, value);
  }

  static dynamic read(String key) {
    print(_box.read(key));
    return _box.read(key);
  }

  static void remove(String key) {
    _box.remove(key);
  }

  static void clear() {
    _box.erase();
  }
}
