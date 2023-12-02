import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomUserAudio extends StatefulWidget {
  CustomUserAudio({super.key});

  @override
  State<CustomUserAudio> createState() => _CustomUserAudioState();
}

class _CustomUserAudioState extends State<CustomUserAudio> {
  final recorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future<void> record() async {
    await recorder.startRecorder(toFile: 'audio');
  }

  Future<void> stop() async {
    await recorder.stopRecorder();
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();

    if (status == PermissionStatus.granted) {
      debugPrint('Microphone permission granted. Initializing recorder...');
    } else {
      throw ('Microphone permission denied or restricted.');
    }
    await recorder.openRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot) {
                  final duration = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;

                  return CustomTextWidget(
                    text: '${duration.inSeconds} sec',
                    fSize: 20.0,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (recorder.isRecording) {
                    await stop();
                    setState(() {});
                  } else {
                    await record();
                    setState(() {});
                  }
                },
                child: Icon(
                  recorder.isRecording ? Icons.stop : Icons.mic,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
