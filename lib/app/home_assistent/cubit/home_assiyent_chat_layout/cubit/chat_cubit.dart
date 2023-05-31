import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../home_assiyent_chat_layout.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  int stat = 0;
  void changeStat(index) {
    stat = index;
    emit(ChangeStat());
  }

  void initial() {
    newUsers = users;

    emit(ChatInitial());
  }

  List x = ['', '', '', ''];

  List users = [
    User(
        'Mohammed',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTb84JafH6ha4_dVpUKcaTZrzyvYlNtTeXOd3aZHTm4ZVGZzd62ZXRVRjYuxgxZkymruI&usqp=CAU',
        'السلام عليكم ورحمة الله وبركاته',
        false),
    User(
        'Ahmed',
        'https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'السلام عليكم ورحمة الله وبركاته',
        false),
    User(
        'Omarr',
        'https://imgix.bustle.com/uploads/image/2021/7/16/07062a59-9fd1-41f8-9c99-e4c0f5d80c05-06546552-d025-4a16-ab18-d252ff01fa90-getty-1205000579.jpeg?w=800&fit=crop&crop=focalpoint&auto=format%2Ccompress&fp-x=0.4587&fp-y=0.754',
        'السلام عليكم ورحمة الله وبركاته',
        false),
    User(
        'Alaa',
        'https://imgix.bustle.com/uploads/image/2021/7/16/07062a59-9fd1-41f8-9c99-e4c0f5d80c05-06546552-d025-4a16-ab18-d252ff01fa90-getty-1205000579.jpeg?w=800&fit=crop&crop=focalpoint&auto=format%2Ccompress&fp-x=0.4587&fp-y=0.754',
        'السلام عليكم ورحمة الله وبركاته',
        false),
  ];
  List newUsers = [];
  void mySearch(myVAlue) {
    newUsers = users
        .where(
            (user) => user.name.toLowerCase().contains(myVAlue.toLowerCase()))
        .toList();
    emit(SearchState());
  }

// individual page //

  List chat_list = [];

  var controller = TextEditingController();

  void addToChatList() {
    chat_list.add(controller.text);
    emit(AddToChatList());
  }
}
