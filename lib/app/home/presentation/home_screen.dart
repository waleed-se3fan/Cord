import 'package:cord_2/app/home/home_cubit/home_cubit.dart';
import 'package:cord_2/app/home/home_cubit/home_states.dart';
import 'package:cord_2/app/home/presentation/home_without_devices.dart';
import 'package:cord_2/app/home/presentation/widgets/stop_button.dart';
import 'package:cord_2/app/home/presentation/widgets/custom_container.dart';
import 'package:cord_2/app/home/presentation/widgets/home_appbar.dart';
import 'package:cord_2/app/home/presentation/widgets/visual_voice.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:cord_2/core/components/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..token()
        ..getTextData()
        ..getSensorData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return FutureBuilder(
              future: cubit.getSensorData(),
              builder: (c, s) {
                return s.data == null
                    ? MyShimmer(
                        MediaQuery.of(context).size.height / 1.4.toDouble())
                    : s.data!.isEmpty
                        ? HomeWithoutDevice()
                        : Scaffold(
                            appBar: const HomeAppBar(),
                            body: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 40),
                              child: Column(
                                children: [
                                  CustomContainer(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Start Speak, We hear you',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        if (cubit.isRecording) ...{
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: List<Widget>.generate(
                                                20,
                                                (index) => VisualComponent(
                                                      duration: cubit
                                                          .duration[index % 5],
                                                    )),
                                          )
                                        } else ...{
                                          Opacity(
                                            opacity: 0.5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: List.generate(
                                                20,
                                                (index) => Container(
                                                  width: 8.w,
                                                  height: cubit
                                                      .height[index % 10].h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    gradient:
                                                        AppColors.animGradient,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        }
                                      ],
                                    ),
                                  )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  AnimatedSize(
                                    duration: const Duration(milliseconds: 400),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Visibility(
                                      visible: cubit.isRecording,
                                      child: CustomContainer(
                                          child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You said:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                            //TyperAnimatedText

                                            FutureBuilder(
                                                future: cubit.getTextData(),
                                                builder: (c, s) {
                                                  return Container(
                                                    alignment: s.data == null
                                                        ? Alignment.bottomCenter
                                                        : Alignment.topLeft,
                                                    child: AnimatedTextKit(
                                                      displayFullTextOnTap:
                                                          true,
                                                      animatedTexts: [
                                                        TyperAnimatedText(HomeCubit
                                                                .translatedText ??
                                                            (HomeCubit.selectedLanguage ==
                                                                    'English'
                                                                ? 'Wait...'
                                                                : '0000000')),
                                                      ],
                                                    ),
                                                  );
                                                })
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  if (cubit.isRecording) ...{
                                    StopButton(
                                      onPressed: () {
                                        cubit.stopRecord();
                                        cubit.stoptts();
                                      },
                                    ),
                                  } else ...{
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25.w),
                                        child: GradientButton(
                                          height: 45.h,
                                          onPressed: () async {
                                            await cubit.tts();
                                            cubit.startRecord();
                                          },
                                          title: 'Start',
                                        )),
                                  },
                                ],
                              ),
                            ),
                          );
              });
        },
      ),
    );
  }
}

// final recorder = FlutterSoundRecorder();
// List<double> samples = [];
// var recordingDataController = StreamController<Food>();
// late StreamSubscription _recordingSubscription;
// Future record() async {
//   _recordingSubscription =
//       recordingDataController.stream.listen((buffer) {
//     if (buffer is FoodData) {
//       samples.add(double.parse(buffer.data!.toString()));
//       debugPrint('samples: $samples');
//     }
//   });
//   await recorder.startRecorder(toFile: 'audio',sampleRate: 16000);
// }

// Future stop() async {
//   _recordingSubscription.cancel();
//   await recorder.stopRecorder();
// }

// @override
// void initState() {
//   initRecorder();
//   super.initState();
// }

//   @override
// void dispose() {
//   _recordingSubscription.cancel();
//   recorder.stopRecorder();
//   super.dispose();
// }

// Future initRecorder() async {
//   final status = await Permission.microphone.request();
//   if (status != PermissionStatus.granted) {
//     throw RecordingPermissionException('Microphone permission not granted');
//   }
//   await recorder.openRecorder();
// }
