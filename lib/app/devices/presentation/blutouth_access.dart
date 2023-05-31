import 'package:cord_2/app/devices/presentation/devices.dart';
import 'package:flutter/material.dart';

import 'name_device.dart';

class BlutouthAccess extends StatelessWidget {
  const BlutouthAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Devices(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/blutooth.png'),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: const Color.fromRGBO(255, 255, 255, 1),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text('CORD wants to access the Blutooth',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: ButtonTheme(
                        child: ButtonBar(
                          children: <Widget>[
                            TextButton(
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12)),
                              onPressed: () {},
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (c) {
                                  return const NameDevice();
                                }));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromRGBO(121, 102, 255, 1),
                                        Color.fromRGBO(134, 143, 231, 1),
                                        Color.fromRGBO(158, 183, 255, 1),
                                      ])),
                                  child: const Text(
                                    'Allow',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
