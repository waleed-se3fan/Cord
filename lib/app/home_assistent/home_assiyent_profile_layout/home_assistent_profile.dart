import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/profileclass.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/variables.dart';
import 'assistent_appbar.dart';
import 'editprofile.dart';
import 'language_setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage('assets/icons/Avatar.png'),
              ),
            ),
            const Text(
              'ALAA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              'sagasayeeed@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            GradientButton(
              height: 45.h,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
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
                          : null;
                    },
                    child: ProfileClass(Variables().iconimage[index],
                        Variables().data[index], index),
                  );
                })
          ],
        ),
      ),
    );
  }
}
