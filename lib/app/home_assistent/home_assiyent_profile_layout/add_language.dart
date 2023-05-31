import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/styles/colors.dart';
import '../../../core/utils/variables.dart';

class AddLanguage extends StatefulWidget {
  const AddLanguage({super.key});

  @override
  State<AddLanguage> createState() => _HomeAssistantState();
}

class _HomeAssistantState extends State<AddLanguage> {
  // List<Contact>? contacts;

  @override
  void initState() {
    // getPhoneData();
  }

  /* Future<void> getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts();
      setState(() {});
    }
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Add Language',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(bottom: 100, left: 10, right: 10, top: 20),
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
                    borderSide: BorderSide(color: AppColors.kLightPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: Variables().countries.length,
                itemBuilder: (context, index) {
                  return InkWell(
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
                                        Text(
                                            'Set Franca as the defult system language?'),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text('Yes'),
                                        Divider(),
                                        Text('No')
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
                                        child: Text(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Variables().countries[index],
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        index == 6
                            ? Container()
                            : Divider(
                                color: Colors.grey,
                                thickness: 0.3,
                              )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
