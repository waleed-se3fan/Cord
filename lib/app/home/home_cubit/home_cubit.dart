import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../login/login_cubit/login_cubit.dart';
import '../../signup/signup_cubit/cubit.dart';
import 'home_states.dart';
import 'package:translator/translator.dart';

import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  static String selectedLanguage = 'English';
  static String type = 'en';

  static var userToken;

  token() {
    if (SignUpCubit.token == null) {
      userToken = LoginCubit.token;
      print(userToken);
    } else {
      userToken = SignUpCubit.token;
      print(userToken);
    }
  }

  static String? data;
  Future<String?> getTextData() async {
    try {
      final response = await http
          .post(Uri.parse('https://cord0.me/api/signals/predict'), body: {
        'signal':
            '[-27535.449219,-25971.853516,-30141.794922,-19697.228516,3157.675537,-33066.187500,-27920.703125,-9997.800781]'
      }, headers: {
        "Accept": "application/json",
        'authorization': 'Bearer $userToken'
      });
      data = await jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  FlutterTts ftts = FlutterTts();

  tts() async {
    await ftts.setLanguage("en-US");
    await ftts.setSpeechRate(0.2); //speed of speech
    await ftts.setVolume(1.0); //volume of speech
    await ftts.setPitch(1);

    var result = await ftts.speak(translatedText);
  }

  stoptts() async {
    await ftts.stop();
  }

  Future<List> getSensorData() async {
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

      return listOfData;
    } catch (e) {
      print('*************');
      print(e.toString());
      return List.empty();
    }
  }

  //TODO VARIABLES
  bool isRecording = false;
  List<int> duration = [900, 700, 600, 800, 500];
  List<int> height = [30, 60, 50, 80, 60, 45, 50, 90, 35, 60];
  //TODO METHODS
  void startRecord() {
    isRecording = true;
    emit(StartRecording());
  }

  void stopRecord() {
    isRecording = false;
    emit(StopRecording());
  }

  static String translatedText =
      'When I glance over my notes and records of the Sherlock Holmes cases between the years ’82 and ’90, I am faced by so many which present strange and interesting features that it is no easy matter to know which to choose and which to leave.';
  GoogleTranslator translator = GoogleTranslator();
  translate(type) async {
    try {
      await translator.translate(data!, from: 'en', to: type).then((value) {
        translatedText = value.text;
        return translatedText;
      });
      print(translatedText);
    } catch (e) {
      translatedText = e.toString();
      return translatedText;
    }
  }
}
