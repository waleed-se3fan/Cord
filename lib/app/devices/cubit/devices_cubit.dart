import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../login/login_cubit/login_cubit.dart';
import '../../signup/signup_cubit/cubit.dart';

part 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit() : super(DevicesInitial());

  static DevicesCubit get(context) => BlocProvider.of(context);
  var deviceController = TextEditingController();
  var updateddeviceController = TextEditingController();
  static var userToken;
  token() {
    if (SignUpCubit.token == null) {
      userToken = LoginCubit.token;
    } else {
      userToken = SignUpCubit.token;
    }
  }

  static String otpField = '';

  chnageOtp(text) {
    otpField = text;
  }

  // getSensorData() async {
  //   final response = await http.get(Uri.parse('https://cord0.me/api/sensors'),
  //       headers: {
  //         "Accept": "application/json",
  //         'authorization': 'Bearer $userToken'
  //       });

  //   if (response.statusCode == 200) {
  //     print(jsonEncode(response.body));
  //   } else {
  //     print(jsonEncode(response.body));
  //   }
  // }
  static List listOfDevices = [];
  static int id = 0;

  Future<List> getSensorData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://cord0.me/api/sensors',
        ),
        headers: {
          "Accept": "application/json",
          'authorization': 'Bearer $userToken'
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfDevices = await data['data'];
        id = await data['data'][0]['id'];
        print(id);

        //emit(getSensorDataSuccessState());

        return await listOfDevices;
      } else {
        print('Error');
        // emit(getSensorDataSuccessEphtyState());
        return List.empty();
      }
    } catch (e) {
      print(e.toString());
      return List.empty();
    }
  }

  deleteSensor(context) {
    DeleteDevice(DevicesCubit.id);
    Navigator.pop(context);
    // emit(DeleteSensorState());
    // emit(getSensorDataSuccessState());
    // emit(getSensorDataSuccessEphtyState());
  }

  updateSensor(context, updatedDevice) {
    UpdateDevice(DevicesCubit.id, updatedDevice);
    Navigator.pop(context);
    // emit(DeleteSensorState());
    // emit(getSensorDataSuccessState());
    // emit(getSensorDataSuccessEphtyState());
  }

  postSensorData(name, code) async {
    try {
      final response = await http
          .post(Uri.parse('https://cord0.me/api/sensors'), headers: {
        "Accept": "application/json",
        'authorization': 'Bearer $userToken'
      }, body: {
        'name': name,
        'code': code
      });

      if (response.statusCode == 201) {
        print('success');
        print(jsonDecode(response.body));
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var controller = TextEditingController();

  static List device_list = [];

  void add_to_list() {
    device_list.add(device);
    emit(AddToDeviceListState());
  }

  static String device = 'my_device';

  void cord_2Device(value) {
    device = value;
    emit(DeviceState());
  }

  int current_index = 1;

  void changeBottomNB(index) {
    current_index = index;
    emit(BottomNVState());
  }

  static int deviceIndex = 0;

  static Future<String> DeleteDevice(index) async {
    try {
      final response = await http
          .delete(Uri.parse('https://cord0.me/api/sensors/$index'), headers: {
        "Accept": "application/json",
        'authorization': 'Bearer $userToken'
      });
      var data = await jsonDecode(response.body);
      print('succes Delete');
      return data;
    } catch (e) {
      print(e.toString());
      print('not Deleted');
      return e.toString();
    }
  }

  static Future<String> UpdateDevice(index, updatedDevice) async {
    try {
      final response = await http
          .post(Uri.parse('https://cord0.me/api/sensors/$index'), body: {
        'name': updatedDevice
      }, headers: {
        "Accept": "application/json",
        'authorization': 'Bearer $userToken'
      });
      var data = await jsonDecode(response.body);
      print('succes Update');
      return data;
    } catch (e) {
      print(e.toString());
      print('not Updated');
      return e.toString();
    }
  }
}
