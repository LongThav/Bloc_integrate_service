import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/utils/constant.dart';
import 'package:project/views/login_view.dart';


class UserInfo{
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final String key = "";
  final String noUser = "";

  void write(String value){
    _flutterSecureStorage.write(key: key, value: value);
  }
  
  Future<String> readUserInfoLocal()async{
    String? user = await _flutterSecureStorage.read(key: key);
    return user ?? noUser;
  }

  void deleteAll(BuildContext context){
    _flutterSecureStorage.delete(key: key);
    if(key.isEmpty){
      pusReplaceScreen(context, const LoginView());
    }
  }
}