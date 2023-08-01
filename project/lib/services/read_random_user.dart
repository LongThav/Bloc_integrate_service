import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/login_model.dart';
import 'package:project/utils/url_base.dart';

import '../models/random_user_model.dart';

class Services {
  late RandomInfoModel randomInfoModel;
  Future<RandomInfoModel> readRandomUser() async {
    try {
      String url = "https://randomuser.me/api/?results=5";
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        randomInfoModel = await compute(_parJson, response.body);
      } else {
        debugPrint("another Error");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return randomInfoModel;
  }

  late LoginModel loginModel;
  Future<LoginModel> loginAuth(
      String email, String password, BuildContext context) async {
    try {
      final Map<String, dynamic> map = {'email': email, 'password': password};
      String url = mainUrl + loginendPoint;
      http.Response response = await http.post(Uri.parse(url), body: map);
      debugPrint("Responese Body: ${response.body}");
      if (response.statusCode == 200) {
        loginModel = await compute(parLoginJson, response.body);
        debugPrint("Login successfully");
      } else {
        debugPrint("Other Error");
      }
    } catch (err) {
      throw Exception('Error: $err');
    }
    
    return loginModel;
  }
}

RandomInfoModel _parJson(String str) =>
    RandomInfoModel.fromJson(json.decode(str));
LoginModel parLoginJson(String str) => LoginModel.fromJson(json.decode(str));
