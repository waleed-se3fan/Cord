import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/textformfield.dart';
import '../../core/utils/navigator.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  static Future<dynamic> get show => showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: _radius,
        ),
        builder: (context) {
          return ContactsView();
        },
      );

  static BorderRadius get _radius => BorderRadius.vertical(
        top: Radius.circular(8),
      );

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: _radius,
      ),
      builder: (context) {
        return UnconstrainedBox(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: _radius,
            ),
            height: 550.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DefaultTextField(
                    inputType: TextInputType.name,
                    prefix: Icons.search,
                    title: 'Search',
                    filled: true,
                    fillColor: Color(0xFFF7F6FC),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your contacts:',
                      style: TextStyle(),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final invitationButton = index == 2;
                        return ListTile(
                          title: Text('Doaa Hamdy'),
                          subtitle: Text('+20 1227003795'),
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          trailing: Builder(builder: (context) {
                            if (invitationButton) {
                              return GradientButton(
                                title: 'Add',
                                width: 90,
                                height: 30,
                                fontSize: 16,
                                onPressed: () {},
                              );
                            }
                            return TextButton(
                              child: Text(
                                'Invite',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {},
                            );
                          }),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Container(
      height: 778.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
    );
  }
}
