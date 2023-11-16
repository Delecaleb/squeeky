import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  //method to save a dynamic string to storage
  void saveString(String key, String value) {
    box.write(key, value);
  }

  //  method to get a dynamic string from storage
  String getString(String key) {
    return box.read(key) ?? ''; // Return an empty string if the key is not found
  }
}
