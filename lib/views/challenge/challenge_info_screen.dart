import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/utilities/utils.dart';
import 'package:sound_app/views/challenge/components/edit_info_dialog.dart';
import 'package:sound_app/views/home/components/custom_member.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

import '../home/components/custom_searchbar.dart';

class ChallengeInfoScreen extends StatefulWidget {
  const ChallengeInfoScreen({super.key});

  @override
  State<ChallengeInfoScreen> createState() => _ChallengeInfoScreenState();
}

class _ChallengeInfoScreenState extends State<ChallengeInfoScreen> {
  TextEditingController nameController = TextEditingController();
  String? selectedFileName;

  List<Member> members = [
    Member('John Doe', 'assets/images/user.jpg'),
    Member('Jane Smith', 'assets/images/user2.jpg'),
    Member('Michael Johnson', 'assets/images/user3.jpg'),
    Member('Emily Davis', 'assets/images/user4.jpg'),
    Member('Robert White', 'assets/images/user5.jpg'),
    Member('Amanda Brown', 'assets/images/user6.jpg'),
    Member('Christopher Lee', 'assets/images/user7.jpg'),
    Member('Sarah Miller', 'assets/images/user8.jpg'),
    Member('Daniel Wilson', 'assets/images/user5.jpg'),
  ];

  List<Member> selectedMembers = [];
  List<Member> filteredMembers = [];

  @override
  void initState() {
    super.initState();
    filteredMembers = members;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
                CustomTextWidget(
                    text: 'Group Info', fSize: 18.0, fWeight: FontWeight.w500),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: InkWell(
                      onTap: () {
                        buildEditInfoDialog(context);
                      },
                      child: CustomTextWidget(text: 'Edit', fSize: 16.0),
                    ))
              ],
            ),
            const SizedBox(height: 16.0),
            ClipOval(
              child: Image.asset('assets/images/user.jpg', height: 80),
            ),
            const SizedBox(height: 16.0),
            CustomTextWidget(
                text: 'Tone Twisters', fWeight: FontWeight.w500, fSize: 20),
            CustomTextWidget(
                text: '7 participants', fWeight: FontWeight.w200, fSize: 16),
            const Divider(endIndent: 20.0, indent: 20.0),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
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
                        text: selectedFileName ?? 'Select Audio/Video File',
                        textColor: Colors.grey,
                        fSize: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomTextWidget(text: '7 Participants', fSize: 16.0),
            const SizedBox(height: 16.0),
            Expanded(
              child: Container(
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
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return _buildMemberListPage();
                              },
                            );
                          },
                          child: CustomTextWidget(
                              text: 'Add Participants',
                              fSize: 16.0,
                              fWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Expanded(
                      child: (members.isEmpty)
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: CustomTextWidget(
                                text: 'No Members',
                                fSize: 14.0,
                              ),
                            )
                          : SingleChildScrollView(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: members.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      buildRemoveMemberBottomSheet(
                                          context, index);
                                    },
                                    child: CustomMember(
                                      members: members,
                                      index: index,
                                    ),
                                  );
                                },
                              ),
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildRemoveMemberBottomSheet(
      BuildContext context, int index) {
    // Check if index is within the valid range
    if (index < 0 || index >= members.length) {
      return Future.value(); // Do nothing if the index is invalid
    }

    // Store the removed member in a variable
    Member removedMember = members[index];

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(removedMember.imageUrl),
                          radius: 20,
                        ),
                        const SizedBox(width: 15.0),
                        CustomTextWidget(
                          text: removedMember.name,
                          fSize: 14.0,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      ],
                    ),
                    CustomButtonWidget(
                      width: 200,
                      buttonText: 'Remove Participant',
                      onTap: () {
                        // Remove the stored member from the list
                        members.remove(removedMember);

                        Utils().toastMessage(
                            '${removedMember.name} has been removed from the challenge.');
                        Get.back();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMemberListPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomTextWidget(text: 'Cancel'),
              ),
              CustomTextWidget(
                text: 'Add Participants',
                fSize: 16.0,
                fWeight: FontWeight.w500,
              ),
              TextButton(
                onPressed: () {},
                child: CustomTextWidget(
                  text: 'Add',
                  textColor:
                      selectedMembers.isNotEmpty ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          CustomSearchBar(
            onChanged: (query) {
              setState(() {
                filteredMembers = members
                    .where((member) =>
                        member.name.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            },
          ),
          const SizedBox(height: 8.0),
          AnimatedContainer(
            padding: const EdgeInsets.all(8.0),
            duration: const Duration(milliseconds: 1),
            height: selectedMembers.isNotEmpty ? 100 : 0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedMembers.map((member) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                fit: BoxFit.cover,
                                member.imageUrl,
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                radius: 10,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedMembers.remove(member);
                                      });
                                    },
                                    icon: const Icon(Icons.cancel)),
                              ),
                            ),
                          ],
                        ),
                        CustomTextWidget(
                          text: member.name,
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    backgroundImage: AssetImage(member.imageUrl),
                  ),
                  title: CustomTextWidget(
                    text: member.name,
                    fWeight: FontWeight.w400,
                    fSize: 16.0,
                  ),
                  trailing: Checkbox(
                    onChanged: (bool? value) {
                      handleCheckboxChanged(value, member);
                    },
                    value: selectedMembers.contains(member),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void handleCheckboxChanged(bool? value, Member member) {
    setState(() {
      if (value != null && value) {
        selectedMembers.add(member);
        filteredMembers.remove(member);
      } else {
        selectedMembers.remove(member);
        filteredMembers.add(member);
      }
    });
  }
}
