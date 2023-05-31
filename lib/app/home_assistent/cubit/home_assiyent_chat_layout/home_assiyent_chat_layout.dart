import 'package:cord_2/core/components/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/styles/colors.dart';
import 'contacts.dart';
import 'cubit/chat_cubit.dart';
import 'individual_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          elevation: 0,
          title: const Text(
            'Chats',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    builder: (context) {
                      return Contacts();
                    });
              },
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/icons/gradient_circle.png'),
                  Icon(Icons.add, color: AppColors.kWhite, size: 20),
                ],
              ),
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ChatCubit()..initial(),
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ChatCubit.get(context);
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 3.0,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        onChanged: (val) => cubit.mySearch(val),
                        cursorColor: AppColors.kPurple,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(CupertinoIcons.search),
                          isDense: true,
                          filled: true,
                          prefixIconConstraints: BoxConstraints(
                            maxWidth: 35,
                            minWidth: 35,
                          ),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: AppColors.kGrey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: AppColors.kLightPurple),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Chats',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    )),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.kPurple,
                              radius: 13,
                              child: Text(
                                '10',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text('New Group',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1,
                                  decorationStyle: TextDecorationStyle.solid,
                                  color: Color.fromRGBO(64, 123, 255, 1),
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.newUsers.length,
                          itemBuilder: (c, i) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return IndividualPage();
                                }));
                              },
                              child: Slidable(
                                endActionPane: ActionPane(
                                    motion: StretchMotion(),
                                    children: [
                                      SlidableAction(
                                          backgroundColor: Color.fromRGBO(
                                              166, 166, 166, 0.78),
                                          icon: Icons.more_horiz,
                                          label: 'More',
                                          onPressed: (context) {
                                            cubit.users.removeAt(i);
                                          }),
                                      SlidableAction(
                                          backgroundColor:
                                              Color.fromRGBO(134, 143, 231, 1),
                                          label: 'Archieve',
                                          icon: Icons.archive_outlined,
                                          onPressed: (context) {
                                            cubit.users.removeAt(i);
                                          }),
                                    ]),
                                key: Key(cubit.x[i]),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(),
                                      title: Text(cubit.newUsers[i].name),
                                      subtitle:
                                          Text(cubit.newUsers[i].nickname),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Yesterday',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          CircleAvatar(
                                            child: Text(
                                              '3',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            radius: 8,
                                          )
                                        ],
                                      ),
                                    ),
                                    i != cubit.newUsers.length - 1
                                        ? Divider(
                                            thickness: .3,
                                            color: Colors.grey,
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class User {
  User(this.name, this.image, this.nickname, this.isFollow);
  String name;
  String image;
  String nickname;
  bool isFollow = true;
}
