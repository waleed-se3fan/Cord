import 'package:cord_2/app/onboarding/onboarding_cubit/onboarding_states.dart';
import 'package:cord_2/app/signup/presentation/signup_screen.dart';
import 'package:cord_2/core/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/onboarding_model.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  //TODO VARIABLES
  OnBoardingCubit() : super(OnBoardingInitState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  bool isLast = false;
  final boardController = PageController();
  int currentIndex = 0;
  //TODO LISTS
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/voice.png',
        title: 'Say what you want',
        body:
            'Connect the device to CORD, your voice is now heard by converting silent speech into audible and written words.'),
    BoardingModel(
        image: 'assets/images/chat.png',
        title: 'Communicate with others easily',
        body:
            'You can communicate with your family and friends via CORD using our chat and you can sent voice message to them.'),
    BoardingModel(
        image: 'assets/images/speech.png',
        title: 'Translate your speech to any language',
        body: 'Send text and voice mesages to anyone on several langouges.'),
  ];
  //TODO METHODS
  void changeIndex(BuildContext _) {
    if (isLast) {
      debugPrint('Navigate to Login Screen');
      navigateAndFinish(_, SignUpScreen());
    } else {
      boardController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  void indexListener(index) {
    debugPrint(index.toString());
    currentIndex = index;
    if (index == 2) {
      isLast = true;
      emit(OnBoardingLastState());
    } else {
      isLast = false;
      emit(OnBoardingInitState());
    }
  }
}
