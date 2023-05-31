import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/gradient_button.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';

Future<void> showLanguageDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return const _Dialog();
    },
  );
}

class _Dialog extends StatefulWidget {
  const _Dialog({Key? key}) : super(key: key);

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Dialog(
            alignment: Alignment.topCenter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 70.h),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Language of your audio:',
                        style: TextStyle(
                          fontSize: 14,
                          height: 21 / 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...[
                    'English',
                    'Spanish',
                    'French',
                    'German',
                    'Italian'
                  ].map((e) => Column(
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              HomeCubit.selectedLanguage = e;
                              switch (HomeCubit.selectedLanguage) {
                                case 'English':
                                  {
                                    HomeCubit.type = 'en';
                                  }
                                  break;
                                case 'Spanish':
                                  {
                                    HomeCubit.type = 'es';
                                  }
                                  break;
                                case 'French':
                                  {
                                    HomeCubit.type = 'fr';
                                  }
                                  break;
                                case 'Italian':
                                  {
                                    HomeCubit.type = 'it';
                                  }
                                  break;
                                case 'German':
                                  {
                                    HomeCubit.type = 'de';
                                  }
                                  break;
                              }
                            }),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Visibility(
                                  visible: HomeCubit.selectedLanguage == e,
                                  child: Image.asset('assets/icons/check.png'),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1.2,
                            height: 20,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: GradientButton(
                        title: 'Select',
                        onPressed: () {
                          Navigator.pop(context, HomeCubit.selectedLanguage);
                          cubit.translate(HomeCubit.type);
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
