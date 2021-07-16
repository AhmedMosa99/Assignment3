import 'dart:convert';

import 'package:responsive/forms/globals.dart';
import 'package:responsive/forms/models/form_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setName(FormUser formUser) async {
    
    sharedPreferences.setString("user", formUser.toMap().toString());
  }

  FormUser getUser() {
 
    String user = sharedPreferences.getString("user");
    Map userMap = json.decode(user);
    FormUser formUser = FormUser.map(userMap);
    Globals.globals.formUser = formUser;
    return formUser;
  }

  singOut() {
    sharedPreferences.remove('user');
  }
}
