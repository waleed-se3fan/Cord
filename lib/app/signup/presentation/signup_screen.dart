import 'package:cord_2/app/signup/signup_cubit/cubit.dart';
import 'package:cord_2/app/signup/signup_cubit/signup_states.dart';
import 'package:cord_2/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/components/gradient_button.dart';
import '../../../core/components/outlined_button.dart';
import '../../../core/components/text_button.dart';
import '../../../core/components/textformfield.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/navigator.dart';
import '../../login/presentation/choise_screen.dart';
import '../../login/presentation/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  String? name, phone, email, password, confirm;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SignUpCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Image.asset(
                            ImgAssets.logInLogo,
                            height: 100.h,
                            width: 120.w,
                          ),
                          DefaultBorderButton(
                            title: 'Signup with Google',
                            onPressed: () {
                              cubit.httpData(
                                  SignUpCubit.name.text,
                                  SignUpCubit.phone_number.text,
                                  SignUpCubit.email.text,
                                  SignUpCubit.password.text,
                                  SignUpCubit.password_confirmation.text);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              DefaultTextField(
                                controller: SignUpCubit.name,
                                inputType: TextInputType.emailAddress,
                                title: 'Name',
                                errorText: cubit.isPressed
                                    ? cubit.errorTextFunc(
                                        SignUpCubit.name.text, 'Name')
                                    : null,
                                prefix: Icons.person,
                                onChanged: (data) {
                                  name = data;
                                },
                              ),
                              DefaultTextField(
                                errorText: cubit.isPressed
                                    ? cubit.errorTextFunc(
                                        SignUpCubit.phone_number.text,
                                        'Phone Number')
                                    : null,
                                controller: SignUpCubit.phone_number,
                                inputType: TextInputType.visiblePassword,
                                title: 'Phone Number',
                                prefix: Icons.phone,
                                onChanged: (data) {
                                  phone = data;
                                },
                              ),
                              DefaultTextField(
                                errorText: cubit.isPressed
                                    ? cubit.errorTextFunc(
                                        SignUpCubit.email.text, 'Email Address')
                                    : null,
                                controller: SignUpCubit.email,
                                inputType: TextInputType.visiblePassword,
                                title: 'Email Address',
                                prefix: Icons.mail,
                                onChanged: (data) {
                                  email = data;
                                },
                              ),
                              DefaultTextField(
                                errorText: cubit.isPressed
                                    ? cubit.errorTextFunc(
                                        SignUpCubit.password.text, 'Password')
                                    : null,
                                controller: SignUpCubit.password,
                                inputType: TextInputType.visiblePassword,
                                title: 'Password',
                                prefix: Icons.lock,
                                secure: true,
                                onChanged: (data) {
                                  password = data;
                                },
                              ),
                              DefaultTextField(
                                errorText: cubit.isPressed
                                    ? cubit.errorTextFunc(
                                        SignUpCubit.password.text,
                                        'Confirm Password')
                                    : null,
                                controller: SignUpCubit.password_confirmation,
                                inputType: TextInputType.visiblePassword,
                                title: 'Confirm Password',
                                prefix: Icons.lock,
                                secure: true,
                                suffix: Icons.remove_red_eye_outlined,
                                onChanged: (data) {
                                  confirm = data;
                                },
                              ),
                            ]
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.h),
                                      child: e,
                                    ))
                                .toList(),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GradientButton(
                            title: 'Register',
                            height: 45.h,
                            onPressed: () async {
                              cubit.isPress();
                              await cubit.httpData(
                                  SignUpCubit.name.text,
                                  SignUpCubit.phone_number.text,
                                  SignUpCubit.email.text,
                                  SignUpCubit.password.text,
                                  SignUpCubit.password_confirmation.text);
                              if (SignUpCubit.register_status == true) {
                                print('Token');
                                print(SignUpCubit.token);
                                var snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  action: SnackBarAction(
                                    disabledTextColor: Colors.black,
                                    textColor: Colors.black,
                                    label: '',
                                    onPressed: () {},
                                  ),
                                  content: Center(
                                      child:
                                          Text(SignUpCubit.register_message)),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (c) {
                                  return ChoiceScreen();
                                }));
                              } else {
                                var snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                    disabledTextColor: Colors.black,
                                    textColor: Colors.black,
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                  content: Center(
                                      child:
                                          Text(SignUpCubit.register_message)),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: AppColors.kGrey),
                                ),
                                DefaultTextButton(
                                  textColor: AppColors.kPurple,
                                  title: 'Login',
                                  onPressed: () {
                                    navigateAndFinish(context, LoginScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
