import 'package:flutter_app_test/helpers/Constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {

  Future<bool> isSessionValid() async {
    bool isValidSession = false;
    final _storage = FlutterSecureStorage();
    try {
      final dateTime = await _storage.read(key: lastLoginTime);
      final minutes = DateTime.now().difference(DateTime.parse(dateTime)).inMinutes;
      if(minutes<=5){
        isValidSession = true;
      } else {
        isValidSession = false;
      }
    } on Exception catch(e){

      isValidSession = false;
    }
    return isValidSession;
  }


}