part of 'devices_cubit.dart';

@immutable
abstract class DevicesState {}

class DevicesInitial extends DevicesState {}

class BottomNVState extends DevicesState {}

class DeviceState extends DevicesState {}

class AddToDeviceListState extends DevicesState {}

class DeleteSensorState extends DeviceState {}

class getSensorDataSuccessState extends DeviceState {}

class getSensorDataSuccessEphtyState extends DeviceState {}
