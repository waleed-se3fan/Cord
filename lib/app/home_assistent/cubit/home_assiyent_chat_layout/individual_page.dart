import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:custom_clippers/custom_clippers.dart';

import '../../../../core/styles/colors.dart';
import 'cubit/chat_cubit.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 2,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              title: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircleAvatar(),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mohammed',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
                  ),
                ],
              ),
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
            body: Container(
              height: double.infinity,
              color: AppColors.kWhite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        reverse: false,
                        physics: const ClampingScrollPhysics(),
                        itemCount: cubit.chat_list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: ClipPath(
                                clipper:
                                    UpperNipMessageClipper(MessageType.send),
                                child: Container(
                                  padding: const EdgeInsets.all(30),
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(boxShadow: [
                                    const BoxShadow(
                                      color: Color.fromRGBO(207, 210, 245, 1),
                                    )
                                  ]),
                                  child: Text(
                                    cubit.chat_list[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: MediaQuery.of(context).size.height / 9,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(210, 209, 211, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3))
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/voice_icon.png',
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: cubit.controller,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(CupertinoIcons.search),
                            hintText: 'Write Something',
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(121, 102, 255, 1),
                              Color.fromRGBO(134, 143, 231, 1),
                              Color.fromRGBO(158, 183, 255, 1),
                            ]),
                            shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              cubit.addToChatList();
                              cubit.controller.clear();
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
