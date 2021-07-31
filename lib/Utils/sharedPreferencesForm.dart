import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesForm {
  static SharedPreferences _preferences;

  static const _address = 'address';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future setAddressFormDetails(List<String> add) async =>
      await _preferences.setStringList(_address, add);

 
  static List<String> getAddressforFrom() =>
      _preferences.getStringList(_address);
}
