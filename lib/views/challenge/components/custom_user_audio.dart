import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomUserAudio extends StatefulWidget {
  CustomUserAudio({super.key});

  @override
  State<CustomUserAudio> createState() => _CustomUserAudioState();
}

class _CustomUserAudioState extends State<CustomUserAudio> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late Source audioUrl;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'James',
                fSize: 16.0,
              ),
              SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                                debugPrint('Audio is paused');
                              } else {
                                audioUrl = UrlSource(
                                    'https://www.chosic.com/similar-songs/track/5aIVCx5tnk0ntmdiinnYvw');

                                await audioPlayer.play(audioUrl);
                                debugPrint('Audio is playing');
                              }
                            },
                            icon: Icon(
                              Icons.play_circle,
                              color: Colors.black,
                              size: 30,
                            )),
                        Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) async {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(text: formatTime(position)),
                        CustomTextWidget(text: formatTime(duration - position)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
