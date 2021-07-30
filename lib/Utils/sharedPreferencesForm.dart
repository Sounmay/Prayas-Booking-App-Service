import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesForm {
  static SharedPreferences _preferences;

  static const _location = 'location';
  static const _details = 'details';
  static const _address = 'address';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLocation(String location) async =>
      await _preferences.setString(_location, location);

  static Future setAddressFormDetails(List<String> add) async =>
      await _preferences.setStringList(_address, add);

  static Future setDetails(String details) async =>
      await _preferences.setString(_details, details);

  static String getLocation() => _preferences.getString(_location);
  static List<String> getAddressforFrom() =>
      _preferences.getStringList(_address);
  static String getDetails() => _preferences.getString(_details);
}
