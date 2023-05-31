import 'package:bloc/bloc.dart';
import 'package:cord_2/app/chat/presentation/chat_screen.dart';
import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/home_assistent_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../home_assiyent_profile_layout/home_assistent.dart';
import 'home_assiyent_chat_layout/home_assiyent_chat_layout.dart';

part 'home_assistent_state.dart';

class HomeAssistentCubit extends Cubit<HomeAssistentState> {
  HomeAssistentCubit() : super(HomeAssistentInitial());
  static HomeAssistentCubit get(context) => BlocProvider.of(context);

  List classed = [MyHomePage(), Profile()];

  int stat = 0;
  void changeStat(index) {
    stat = index;
    emit(ChangeStat());
  }
}
