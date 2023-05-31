import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
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
            'Edit Profile',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundColor: Color.fromRGBO(0, 129, 207, 1),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/icons/Avatar.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero,
                              elevation: 0.0,
                              // title: Center(child: Text("Evaluation our APP")),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  'assets/icons/icon6.png'),
                                              color: Color.fromRGBO(
                                                  130, 128, 240, 1),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Add Frame')
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  'assets/icons/icon7.png'),
                                              color: Color.fromRGBO(
                                                  130, 128, 240, 1),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Select Profile Picture')
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            const ImageIcon(
                                              AssetImage(
                                                  'assets/icons/icon7.png'),
                                              color: Color.fromRGBO(
                                                  130, 128, 240, 1),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Take Picture')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Center(
                                        child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      textColor: Colors.white,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    121, 102, 255, 1),
                                                Color.fromRGBO(
                                                    134, 143, 231, 1),
                                                Color.fromRGBO(
                                                    158, 183, 255, 1),
                                              ],
                                            )),
                                        padding: const EdgeInsets.all(14.0),
                                        child: const Text(
                                          'Cancel',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                  )
                                ],
                              ));
                        },
                      );
                    },
                    child: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 129, 207, 1),
                        radius: 10,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 13,
                        )),
                  )
                ],
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye_outlined)),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: Icon(Icons.remove_red_eye_outlined)),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Phone number'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*





*/