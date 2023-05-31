import 'dart:convert';
import 'dart:io';

import 'package:cord_2/app/login/login_cubit/login_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  static var login_email = TextEditingController();
  static var login_password = TextEditingController();
  var login_status;
  var login_message = '';
  static var token = '';

  static Dio dio = Dio();
  // void init() async {
  //   dio = Dio(BaseOptions(
  //     baseUrl: 'https://student.valuxapps.com/api/',
  //   ));
  // }

  Future httpLogin(email, password) async {
    try {
      final response = await http.post(
        Uri.parse('https://cord0.me/api/login'),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        token = data['access_token'];
        print(data['access_token']);
        login_status = data['status'];
        login_message = data['message'].toString();

        print('-----------------------');
      } else {
        print('************');
        var data = await jsonDecode(response.body);
        print(data);
        print(data['message']);
        login_message = await data['message'].toString();
      }
    } catch (e) {
      login_status = false;
      print(e.toString());
      login_message = e.toString();
    }
  }

  // static Future login(email, password) async {
  //   try {
  //     await dio.post('login',
  //         data: {'email': email, 'password': password}).then((value) {
  //       login_status = value.data['status'];
  //       login_message = value.data['message'];
  //       print(value.data);
  //     });
  //   } catch (e) {
  //     login_message = e.toString();
  //   }
  // }
}
