import 'package:cord_2/app/onboarding/onboarding_cubit/onboarding_cubit.dart';
import 'package:cord_2/app/onboarding/onboarding_cubit/onboarding_states.dart';
import 'package:cord_2/app/onboarding/presentation/widgets/boarding_item.dart';
import 'package:cord_2/app/signup/presentation/signup_screen.dart';
import 'package:cord_2/core/components/circular_button.dart';
import 'package:cord_2/core/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/text_button.dart';
import '../../../core/styles/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OnBoardingCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  controller: cubit.boardController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.boarding.length,
                  onPageChanged: (int index) {
                    cubit.indexListener(index);
                  },
                  itemBuilder: (_, index) =>
                      BoardingItem(model: cubit.boarding[index]),
                )),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultTextButton(
                        title: 'Skip',
                        onPressed: () {
                          navigateAndFinish(context, SignUpScreen());
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(cubit.boarding.length,
                                  (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: index == cubit.currentIndex ? 35.w : 15.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                gradient: index == cubit.currentIndex
                                    ? AppColors.tGradient
                                    : null,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            );
                          })
                              .map((e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: e,
                                  ))
                              .toList(),
                        ),
                      ),
                      CircularButton(
                        icon: cubit.isLast ? Icons.done : Icons.arrow_forward,
                        onTap: () {
                          cubit.changeIndex(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
