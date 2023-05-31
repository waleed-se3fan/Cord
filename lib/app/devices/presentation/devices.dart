import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/colors.dart';
import '../cubit/devices_cubit.dart';

class Devices extends StatelessWidget {
  Widget devicesWidget;
  Devices(this.devicesWidget);

  @override
  Widget build(BuildContext context) {
    var cubit = DevicesCubit();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.kWhite,
          title: Text(
            'Devices',
            style: TextStyle(
              color: AppColors.kBlack,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20), child: devicesWidget),
    );
  }
}
