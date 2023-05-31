import 'dart:io';

import 'package:cord_2/app/devices/presentation/devices.dart';
import 'package:cord_2/app/layout/layout_cubit/layout_states.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/navigator.dart';
import '../../layout/layout_cubit/layout_cubit.dart';
import '../../layout/presentation/cord_layout.dart';
import '../cubit/devices_cubit.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DevicesCubit()..token(),
      child: BlocConsumer<DevicesCubit, DevicesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DevicesCubit.get(context);
          return Devices(
            Container(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('assets/images/paired.png'),
                    const Text(
                      'Device paired correctly!',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 50),
                      child: TextField(
                        controller: cubit.updateddeviceController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            hintText: 'Set name for your device'),
                      ),
                    ),
                    BlocProvider(
                      create: (context) => LayoutCubit(),
                      child: BlocConsumer<LayoutCubit, LayoutState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          var cubit2 = LayoutCubit.get(context);
                          return GradientButton(
                            height: 45.h,
                            title: 'Update',
                            onPressed: () {
                              cubit.updateSensor(
                                  context, cubit.updateddeviceController.text);
                              navigateAndFinish(context, CordLayout());
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
