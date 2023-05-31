import 'package:cord_2/app/devices/presentation/verify_qr.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'devices.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return Devices(Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/connect.png'),
        GradientButton(
          height: 45.h,
          title: 'Connect Your Device',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return VerifyWithQr();
            }));
          },
        ),
      ],
    )));
  }
}
