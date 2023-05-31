import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/devices_cubit.dart';
import 'devices.dart';
import 'blutouth_access.dart';

class VerifyWithCode extends StatelessWidget {
  const VerifyWithCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DevicesCubit()..token(),
      child: BlocConsumer<DevicesCubit, DevicesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DevicesCubit.get(context);
          return Devices(Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  cubit.chnageOtp(verificationCode);
                  print(DevicesCubit.otpField);
                  /*Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const BlutouthAccess();
            }
            
            ));*/
                },
              ),
              GradientButton(
                height: 45.h,
                title: 'Continue',
                onPressed: () {
                  print(DevicesCubit.otpField);
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return const BlutouthAccess();
                  }));
                },
              )
            ],
          ));
        },
      ),
    );
  }
}
