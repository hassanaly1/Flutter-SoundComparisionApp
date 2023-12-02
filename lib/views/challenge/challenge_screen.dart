import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/challenge/AudioScreen.dart';
import 'package:sound_app/views/challenge/challenge_info_screen.dart';
import 'package:sound_app/views/challenge/chat_screen.dart';
import 'package:sound_app/widgets/custom_appbar.dart';

import 'components/customPrizeWidget.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(title: 'Challenge Name', action: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            onPressed: () {
              Get.to(const ChallengeInfoScreen());
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // AudioContainer
            Container(
              padding: const EdgeInsets.all(8.0),
              color: AppColors.backgroundColor,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: context.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListView(
                      children: [
                        CustomPrizeWidget(
                          image: 'user4.jpg',
                          name: 'Scarlet Johnson',
                          similarity: '90',
                          trailingImage: '1st.png',
                        ),
                        CustomPrizeWidget(
                          image: 'user5.jpg',
                          name: 'James Harry',
                          similarity: '90',
                          trailingImage: '2nd.png',
                        ),
                        CustomPrizeWidget(
                          image: 'user6.jpg',
                          name: 'Emma Clark',
                          similarity: '90',
                          trailingImage: '3rd.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // PrizeContainer
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TabBar(
                isScrollable: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(7),
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.primaryColor,
                ),
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Audio', height: 30),
                  Tab(text: 'Chat', height: 30),
                ],
              ),
            ),

            const SizedBox(height: 10.0),

            // Tab bar
            Expanded(
              flex: 2,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  AudioScreen(),
                  ChatScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
