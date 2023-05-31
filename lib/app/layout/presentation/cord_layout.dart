import 'package:cord_2/core/components/gradient_icon.dart';
import 'package:cord_2/core/styles/cord_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/colors.dart';
import '../layout_cubit/layout_cubit.dart';
import '../layout_cubit/layout_states.dart';

class CordLayout extends StatelessWidget {
  const CordLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayoutCubit.get(context);
          return Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.selectedNavItemIndex,
                selectedItemColor: AppColors.kLightPurple,
                unselectedItemColor: AppColors.kGrey,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                iconSize: 20.sp,
                onTap: (index) {
                  debugPrint('$index');
                  cubit.changeBottomNavIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: cubit.selectedNavItemIndex == 0
                        ? const GradientIcon(icon: CordIcon.home)
                        : const Icon(CordIcon.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedNavItemIndex == 1
                        ? const GradientIcon(icon: CordIcon.device)
                        : const Icon(CordIcon.device),
                    label: 'Devices',
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedNavItemIndex == 2
                        ? const GradientIcon(icon: CordIcon.chat)
                        : const Icon(CordIcon.chat),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: cubit.selectedNavItemIndex == 3
                        ? const GradientIcon(icon: CordIcon.profile)
                        : const Icon(CordIcon.profile),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
            body: cubit.screens[cubit.selectedNavItemIndex],
          );
        },
      ),
    );
  }
}
