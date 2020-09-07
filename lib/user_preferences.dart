import 'package:shared_preferences/shared_preferences.dart';



class UserPreferences {
  static SharedPreferences _prefs;

 static Future init() async {
   _prefs = await SharedPreferences.getInstance();
 }

  get dateOfBirth {
    return _prefs.getString('dateOfBirth');
  }

  set dateOfBirth(String value) {
    _prefs.setString('dateOfBirth', value);
  }

  get numberOfYears {
    return _prefs.getString('numberOfYears');
  }

  set numberOfYears(String value) {
    _prefs.setString('numberOfYears', value);
  }
}






