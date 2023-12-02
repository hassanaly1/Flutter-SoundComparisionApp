import 'package:flutter/material.dart';
import 'package:sound_app/views/challenge/components/custom_user_audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, body: CustomUserAudio());
  }
}
//       bottomNavigationBar: Align(
//         alignment: Alignment.bottomCenter,
//         child: SocialMediaRecorder(
//           backGroundColor: Colors.grey.shade200,
//           cancelTextBackGroundColor: Colors.red,
//           lockButton: const Icon(Icons.lock_outline_rounded),
//           maxRecordTimeInSecond: 5,
//           initRecordPackageWidth: 60,
//           startRecording: () {
// // function called when start recording
//           },
//           stopRecording: (_time) {
//             print(_time);
// // function called when stop recording, return the recording time
//           },
//           sendRequestFunction: (soundFile, _time) {
// //  print("the current path is ${soundFile.path}");
//             print(soundFile.path);
//           },
//           encode: AudioEncoderType.AAC,
//         ),
//       ),
//

// Padding(
// padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
// child: AudioWaveforms(
// size: Size(MediaQuery.of(context).size.width, 200.0),
// recorderController: controller,
// enableGesture: true,
// waveStyle: const WaveStyle(
// showDurationLabel: true,
// spacing: 8.0,
// showBottom: false,
// extendWaveform: true,
// showMiddleLine: false,
// ),
// ),
// ),
// return VoiceMessage(
//   contactCircleColor: Colors.black,
//   contactPlayIconColor: Colors.black,
//   contactPlayIconBgColor: Colors.black,
//   contactBgColor: Colors.black,
//   mePlayIconColor: Colors.black,
//   meBgColor: AppColors.primaryColor,
//   audioSrc: 'assets/audio/audio.mp3',
//   played: true, // To show played badge or not.
//   me: true, // Set message side.
//   onPlay: () {
//     print('playing');
//   }, // Do something when voice played.
// );
