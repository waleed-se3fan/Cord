import 'package:cord_2/app/devices/presentation/widgets/devices_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home_appbar.dart';

class HomeWithoutDevice extends StatelessWidget {
  const HomeWithoutDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeWithout_devices_AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/no_devices.png')),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: const Text(
                'No Device Connected',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: const Text(
                'Go to "Devices" section \n and connect your Device to app',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 4),
                child: Icon(
                  Icons.keyboard_double_arrow_down_outlined,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }
}
