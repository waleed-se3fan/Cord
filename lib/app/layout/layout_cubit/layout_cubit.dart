import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../chat/presentation/chat_screen.dart';
import '../../devices/presentation/devices_screen.dart';
import '../../home/presentation/home_screen.dart';

import '../../profile/patiant_profile_layout/patiant_profile.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  //TODO VARIABLES
  int selectedNavItemIndex = 0;

  void changeIndex() {
    selectedNavItemIndex = 1;
    emit(ChangeStateIndex());
  }

  //TODO LIST OF SCREENS
  List<Widget> screens = [
    const HomeScreen(),
    DevicesScreen(),
    const ChatScreen(),
    const PatiantProfile(),
  ];
  //TODO METHODS
  void changeBottomNavIndex(int index) {
    selectedNavItemIndex = index;
    emit(LayoutBottomNavChanged());
  }
}
