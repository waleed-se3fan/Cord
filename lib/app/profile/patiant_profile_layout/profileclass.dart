import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileClass extends StatelessWidget {
  String imageicon;
  String data;
  int i;
  ProfileClass(this.imageicon, this.data, this.i);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(imageicon),
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
              SizedBox(
                width: 20,
              ),
              Text(data)
            ],
          ),
          i == 3
              ? Container()
              : Divider(
                  color: Colors.grey,
                  thickness: .3,
                )
        ],
      ),
    );
  }
}
