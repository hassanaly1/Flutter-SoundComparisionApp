import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/models/group_model.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/challenge/challenge_screen.dart';
import 'package:sound_app/views/profile/profile_screen.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

import 'components/custom_group_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ChallengeModel> groups = [
    ChallengeModel('The Decibel Daredevils', 10),
    ChallengeModel('Tone Twisters', 15),
    ChallengeModel('Hilarious Harmonies', 8),
    ChallengeModel('The Echo Effect Crew', 12),
    ChallengeModel('The Laughable La-Las', 20),
    ChallengeModel('Audio Oddities', 7),
    ChallengeModel('Pitch-Perfect Pranksters', 18),
    ChallengeModel('The Soundalike Chucklers', 14),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.to(ProfileScreen(), transition: Transition.upToDown);
                  },
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user.jpg',
                      height: 80,
                    ),
                  ),
                ),
              ),
              CustomTextWidget(
                text: 'Your Challenges',
                fSize: 20.0,
                fWeight: FontWeight.w700,
              ),
              const SizedBox(height: 15.0),
              Expanded(
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: groups.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ChallengeModel group = groups[index];
                          Color groupColor = Colors.orange.shade200;

                          return CustomChallengeContainer(
                            onTap: () => Get.to(ChallengeScreen()),
                            challengeName: group.name,
                            challengeMembersCount: group.membersCount,
                            color: groupColor,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
