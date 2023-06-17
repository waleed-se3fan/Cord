import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../login/login_cubit/login_cubit.dart';
import '../../signup/signup_cubit/cubit.dart';

part 'PatientProile_state.dart';

class PatientProileCubit extends Cubit<PatientProileState> {
  PatientProileCubit() : super(PatientProileInitial());

  static PatientProileCubit get(context) => BlocProvider.of(context);
  static var name = 'wait...';
  static var phone = '';
  static var email = 'wait...';
  static var image = '';
  static var userToken;
  token() {
    if (SignUpCubit.token == null) {
      userToken = LoginCubit.token;
    } else {
      userToken = SignUpCubit.token;
    }
  }

  getData(myData) async {
    try {
      final response = await http.get(Uri.parse('https://cord0.me/api/profile'),
          headers: {
            "Accept": "application/json",
            'authorization': 'Bearer $userToken'
          });
      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        return await data['data'][myData];
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int stat = 0;
  void changeStat(index) {
    stat = index;
    emit(ChangeStat());
  }

  getSensorData() async {
    print('ok');
    try {
      print('----------');
      final response = await http.get(Uri.parse('https://cord0.me/api/sensors'),
          headers: {
            "Accept": "application/json",
            'authorization': 'Bearer $userToken'
          });
      var data = await jsonDecode(response.body);
      List listOfData = data['data'];

      print(data.toString());
      print(listOfData.length);
    } catch (e) {
      print('*************');
      print(e.toString());
    }
  }
}
