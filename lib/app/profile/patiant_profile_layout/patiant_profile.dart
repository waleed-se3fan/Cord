import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/profileclass.dart';
import 'package:cord_2/app/signup/presentation/signup_screen.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/variables.dart';
import '../cubit/PatientProile_cubit.dart';
import 'patint_appbar.dart';
import 'editprofile.dart';
import 'language_setting.dart';

class PatiantProfile extends StatelessWidget {
  const PatiantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PatientProileCubit()..token(),
        child: BlocConsumer<PatientProileCubit, PatientProileState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = PatientProileCubit.get(context);
              return Scaffold(
                appBar: HomeAssistentAppBar('Profile'),
                body: Container(
                  padding: EdgeInsets.only(bottom: 120, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromRGBO(0, 129, 207, 1),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage('assets/icons/Avatar.png'),
                        ),
                      ),
                      FutureBuilder(
                          future: cubit.getData('name'),
                          builder: (c, s) {
                            return Text(
                              s.data == null ? 'wait...' : s.data.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            );
                          }),
                      FutureBuilder(
                          future: cubit.getData('email'),
                          builder: (c, s) {
                            return Text(
                              s.data == null ? 'wait...' : s.data.toString(),
                              style: TextStyle(),
                            );
                          }),
                      GradientButton(
                        height: 45.h,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) {
                            return EditProfile();
                          }));
                        },
                        title: 'Edit Profile',
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: Variables().data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                index == 0
                                    ? Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                        return LanguageSetting();
                                      }))
                                    : index == 4
                                        ? Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(builder: (c) {
                                            return SignUpScreen();
                                          }), (route) => false)
                                        : null;
                              },
                              child: ProfileClass(Variables().iconimage[index],
                                  Variables().data[index], index),
                            );
                          }),
                    ],
                  ),
                ),
              );
            }));
  }
}
