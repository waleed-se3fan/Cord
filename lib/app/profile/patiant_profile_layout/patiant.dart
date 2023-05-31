import 'package:cord_2/app/home_assistent/cubit/home_assistent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/gradient_icon.dart';
import '../../../core/styles/cord_icons.dart';

class HomeAssistant extends StatelessWidget {
  const HomeAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAssistentCubit(),
      child: BlocConsumer<HomeAssistentCubit, HomeAssistentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeAssistentCubit.get(context);
          return Scaffold(
            body: cubit.classed[cubit.stat],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                  selectedItemColor: Color.fromRGBO(121, 102, 255, 1),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  onTap: (index) {
                    cubit.changeStat(index);
                    print(cubit.stat);
                  },
                  currentIndex: cubit.stat,
                  items: [
                    BottomNavigationBarItem(
                      icon: cubit.stat == 0
                          ? const GradientIcon(icon: CordIcon.home)
                          : const Icon(CordIcon.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: cubit.stat == 1
                          ? const GradientIcon(icon: CordIcon.profile)
                          : const Icon(CordIcon.profile),
                      label: 'Profile',
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
