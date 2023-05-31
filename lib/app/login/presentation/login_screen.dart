import 'package:cord_2/app/layout/presentation/cord_layout.dart';
import 'package:cord_2/app/login/login_cubit/login_cubit.dart';
import 'package:cord_2/app/login/login_cubit/login_states.dart';
import 'package:cord_2/app/signup/presentation/signup_screen.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:cord_2/core/styles/colors.dart';
import 'package:cord_2/core/utils/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/components/outlined_button.dart';
import '../../../core/components/text_button.dart';
import '../../../core/components/textformfield.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/constants.dart';
import 'choise_screen.dart';

class LoginScreen extends StatelessWidget {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // if (state is LoginLoading) {
          //   isLoading = true;
          // } else if (state is LoginSuccess) {
          //      isLoading = false;
          //   navigateAndFinish(context, CordLayout());
          // } else if (state is LoginFailure) {
          //      isLoading = false;
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text(
          //       "Something Went Wrong",
          //     ),
          //   ));
          // }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Image.asset(
                          ImgAssets.logInLogo,
                          height: 120.h,
                          width: 120.w,
                        ),
                        DefaultBorderButton(
                          title: 'Login with Google',
                          onPressed: () async {
                            // function to implement the google signin

// creating firebase instance
                            final FirebaseAuth auth = FirebaseAuth.instance;

                            final GoogleSignIn googleSignIn = GoogleSignIn();
                            final GoogleSignInAccount? googleSignInAccount =
                                await googleSignIn.signIn();
                            if (googleSignInAccount != null) {
                              final GoogleSignInAuthentication
                                  googleSignInAuthentication =
                                  await googleSignInAccount.authentication;
                              final AuthCredential authCredential =
                                  GoogleAuthProvider.credential(
                                      idToken:
                                          googleSignInAuthentication.idToken,
                                      accessToken: googleSignInAuthentication
                                          .accessToken);

                              // Getting users credential
                              UserCredential result = await auth
                                  .signInWithCredential(authCredential);
                              User? user = result.user;

                              if (result != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              } // if result not null we simply call the MaterialpageRoute,
                              // for go to the HomePage screen
                            }
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
                              controller: LoginCubit.login_email,
                              inputType: TextInputType.emailAddress,
                              label: 'Email',
                              onChanged: (data) {
                                email = data;
                              },
                            ),
                            DefaultTextField(
                              controller: LoginCubit.login_password,
                              inputType: TextInputType.visiblePassword,
                              label: 'Password',
                              secure: true,
                              onChanged: (data) {
                                password = data;
                              },
                              suffix: Icons.remove_red_eye_outlined,
                            ),
                          ]
                              .map((e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: e,
                                  ))
                              .toList(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: DefaultTextButton(
                            color: Colors.grey,
                            textColor: AppColors.kGrey,
                            title: 'Forget Password?',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GradientButton(
                          title: 'Login',
                          height: 45.h,
                          onPressed: () async {
                            await cubit.httpLogin(LoginCubit.login_email.text,
                                LoginCubit.login_password.text);
                            if (cubit.login_status == true) {
                              print(LoginCubit.token);
                              print(cubit.login_message);
                              var snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                action: SnackBarAction(
                                  disabledTextColor: Colors.black,
                                  textColor: Colors.black,
                                  label: '',
                                  onPressed: () {},
                                ),
                                content:
                                    Center(child: Text(cubit.login_message)),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              navigateAndFinish(context, const ChoiceScreen());
                            } else {
                              var snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                action: SnackBarAction(
                                  disabledTextColor: Colors.black,
                                  textColor: Colors.black,
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                                content:
                                    Center(child: Text(cubit.login_message)),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
