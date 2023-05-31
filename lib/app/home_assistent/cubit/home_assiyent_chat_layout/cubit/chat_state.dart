part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChangeStat extends ChatState {}

class SearchState extends ChatState {}

class AddToChatList extends ChatState {}
