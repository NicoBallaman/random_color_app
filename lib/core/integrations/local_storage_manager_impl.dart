import 'package:random_color_app/core/abstractions/local_storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManagerImpl implements LocalStorageManager {
  @override
  Future<void> saveData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
