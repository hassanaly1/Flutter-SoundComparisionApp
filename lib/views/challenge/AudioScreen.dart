import 'package:flutter/material.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:sound_app/utilities/colors.dart';
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
      backgroundColor: Colors.green,
      body: CustomUserAudio(),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.grey.shade200,
        child: SocialMediaRecorder(
          backGroundColor: Colors.grey.shade200,
          cancelTextBackGroundColor: Colors.red,
          lockButton: const Icon(
            Icons.lock_outline_rounded,
            color: AppColors.primaryColor,
          ),
          maxRecordTimeInSecond: 5,
          initRecordPackageWidth: 60,
          // function called when start recording
          startRecording: () {},
          // function called when stop recording, return the recording time
          stopRecording: (time) {
            debugPrint(time);
          },
          sendRequestFunction: (soundFile, time) {
//  print("the current path is ${soundFile.path}");
            debugPrint(soundFile.path);
          },
          encode: AudioEncoderType.AAC,
        ),
      ),
    );
  }
}

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
