abstract class LocalStorageManager {
  Future<void> saveData(String key, String value);
  Future<String?> getData(String key);
  Future<void> remove(String key);
}
