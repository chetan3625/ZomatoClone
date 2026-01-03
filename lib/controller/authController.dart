import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iosandandroid/constants/global.dart';
import 'package:iosandandroid/model/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:iosandandroid/utils/errorHandler.dart';
class AuthController{
  void createAccount({
   required BuildContext context,

    required String name,
    required String phoneno,
    required String email,
    required String password
  })
  async{
    print("Create account hit");
  User user=User(
      id: '',
      email: email,
      name: name,
      password: password,
      phoneno: phoneno,
      type: '');
 http.Response response= await http.post(Uri.parse("$uri/createaccount"),body: jsonEncode(user.fromApptoDB()),headers: <String,String>{
    'Content-Type':'application/json;charset=UTF-8'
  });
  print(response.body);
  httpErrorHandler(context: context, response: response, onSuccess: (){
    showSnackBar(context, "Account Created Succesfully");
  });

  }

}