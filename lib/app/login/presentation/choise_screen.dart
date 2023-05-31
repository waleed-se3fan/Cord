import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/home_assistent.dart';
import 'package:cord_2/app/layout/presentation/cord_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/gradient_button.dart';
import '../../../core/utils/navigator.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 9, right: 9, top: 5, bottom: 110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/choise.png'),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Continue as :',
            ),
          ),
          GradientButton(
            height: 45.h,
            onPressed: () {
              navigateAndFinish(context, const CordLayout());
            },
            title: 'Patient',
          ),
          SizedBox(
            height: 1,
          ),
          GradientButton(
            height: 45.h,
            onPressed: () {
              navigateAndFinish(context, HomeAssistant());
            },
            title: 'Assistent',
          )
        ],
      ),
    ));
  }
}
