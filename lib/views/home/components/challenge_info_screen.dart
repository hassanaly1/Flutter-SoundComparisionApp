import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class ChallengeInfoScreen extends StatefulWidget {
  const ChallengeInfoScreen({super.key});

  @override
  State<ChallengeInfoScreen> createState() => _ChallengeInfoScreenState();
}

class _ChallengeInfoScreenState extends State<ChallengeInfoScreen> {
  String? selectedFileName;
  List<Member> members = [
    Member('Robert White', 'assets/images/user5.jpg'),
    Member('Amanda Brown', 'assets/images/user6.jpg'),
    Member('Christopher Lee', 'assets/images/user7.jpg'),
    Member('Sarah Miller', 'assets/images/user8.jpg'),
    Member('Daniel Wilson', 'assets/images/user5.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  CustomTextWidget(
                    text: 'Group Info',
                    fSize: 18.0,
                    fWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: CustomTextWidget(
                      text: 'Edit',
                      fSize: 16.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              ClipOval(
                child: Image.asset('assets/images/user.jpg', height: 80),
              ),
              const SizedBox(height: 8.0),
              CustomTextWidget(
                  text: 'Tone Twisters', fWeight: FontWeight.w500, fSize: 18),
              CustomTextWidget(
                  text: '7 participants', fWeight: FontWeight.w200, fSize: 14),
              const Divider(endIndent: 20.0, indent: 20.0),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['mp3', 'mp4', 'avi', 'mov', 'wmv'],
                  );

                  if (result != null) {
                    selectedFileName = result.files.single.name;
                    debugPrint('Selected file: ${result.files.single.path}');
                  }

                  setState(() {});
                },
                child: Container(
                  // height: context.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.edit),
                        const SizedBox(width: 15.0),
                        CustomTextWidget(
                            text:
                                selectedFileName ?? 'Select Audio/Video File'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: '7 Participants',
                    fSize: 16.0,
                  ),
                  SvgPicture.asset(
                    'assets/images/icon-search.svg',
                    height: 20.0,
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.add_circle_outlined),
                        const SizedBox(width: 20.0),
                        CustomTextWidget(
                            text: 'Add Participants',
                            fSize: 16.0,
                            fWeight: FontWeight.w500),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        return customMember(
                          members: members,
                          index: index,
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customMember extends StatelessWidget {
  final List<Member> members;
  final int index;
  const customMember({
    super.key,
    required this.members,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(members[index].imageUrl),
              radius: 20,
            ),
            SizedBox(width: 15.0),
            CustomTextWidget(
              text: members[index].name,
              fSize: 14.0,
            )
          ],
        ),
      ],
    );
  }
}
