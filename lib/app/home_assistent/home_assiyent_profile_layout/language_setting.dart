import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/add_language.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          title: const Text(
            'Language Setting',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 300, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: const Text('LANGUAGE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 18))),
            ListTile(
              leading: const Text('English',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              title: Padding(
                padding: const EdgeInsets.only(right: 110),
                child: GradientButton(title: 'default', onPressed: () {}),
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
            ListTile(
              leading: const Text('Arabic',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
            GradientButton(
              height: 45.h,
              title: 'Add a Language',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return const AddLanguage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
