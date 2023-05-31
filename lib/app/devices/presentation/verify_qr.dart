import 'package:cord_2/app/devices/presentation/verify_code.dart';
import 'package:cord_2/core/components/gradient_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'devices.dart';

class VerifyWithQr extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey();

  VerifyWithQr({super.key});
  @override
  Widget build(BuildContext context) {
    return Devices(
      Center(
        child: Container(
          padding: const EdgeInsets.only(top: 60, bottom: 120),
          child: Column(
            children: [
              const Expanded(
                  child: Text(
                'QRCode',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    fontStyle: FontStyle.normal,
                    fontSize: 19),
              )),
              Expanded(
                flex: 3,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (q) {},
                  overlay: QrScannerOverlayShape(
                    overlayColor: const Color.fromRGBO(245, 245, 245, 245),
                    //customizing scan area
                    borderWidth: 10,
                    borderColor: const Color.fromARGB(255, 0, 0, 0),
                    borderLength: 20,
                    borderRadius: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Expanded(
                  child: Text(
                'OR',
                style: TextStyle(fontSize: 14),
              )),
              GradientButton(
                height: 45.h,
                title: 'Enter Device Code',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return const VerifyWithCode();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
