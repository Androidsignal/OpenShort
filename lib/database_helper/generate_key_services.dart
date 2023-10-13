import '../infrastucture/model/generate_key_model.dart';
import 'db_helper.dart';

class GenerateKeyServices {
  void saveUser(String name, String email, String key, String dateTime) {
    DbHelper.insert('generateKey', {'name': name, 'email': email, 'key': key, 'dateTime': dateTime});
  }

  Future<List<GenerateKeyModel>> fetchUsers() async {
    final keyList = await DbHelper.getData('generateKey');
    return keyList.map((item) => GenerateKeyModel(name: item['name'].toString(), email: item['email'].toString(), key: item['key'].toString(), dateTime: item['dateTime'].toString())).toList();
  }
}
