import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

import 'custom_searchbar.dart';

class AddMemberBottomSheet extends StatefulWidget {
  const AddMemberBottomSheet({Key? key}) : super(key: key);

  @override
  _AddMemberBottomSheetState createState() => _AddMemberBottomSheetState();
}

class _AddMemberBottomSheetState extends State<AddMemberBottomSheet> {
  final PageController _pageController = PageController(initialPage: 0);

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
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMemberListPage(),
          _buildGroupInfoPage(selectedMembers),
        ],
      ),
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
                text: 'New Challenge',
                fSize: 16.0,
                fWeight: FontWeight.w500,
              ),
              TextButton(
                onPressed: selectedMembers.isNotEmpty
                    ? () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                child: CustomTextWidget(
                  text: 'Next',
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
                                width: 80.0,
                                height: 80.0,
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
                                    icon: Icon(Icons.cancel)),
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
                    backgroundImage: NetworkImage(member.imageUrl),
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

  Widget _buildGroupInfoPage(List selectedMembers) {
    String? selectedFileName;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: CustomTextWidget(text: 'Back'),
              ),
              CustomTextWidget(
                text: 'Group Info',
                fSize: 16.0,
                fWeight: FontWeight.w500,
              ),
              TextButton(
                onPressed: () {},
                child: CustomTextWidget(
                  text: 'Create',
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            // height: context.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: CustomTextWidget(
                          text: 'Challenge Name',
                          fSize: 16.0,
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          CustomTextWidget(text: 'Select File'),
          const SizedBox(height: 8.0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(width: 15.0),
                    CustomTextWidget(
                        text: selectedFileName ?? 'Select Audio/Video File'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          CustomTextWidget(
              text: 'Participants ${selectedMembers.length} OF 100'),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.all(8.0),
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
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 25,
                              backgroundImage: NetworkImage(member.imageUrl),
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
                                    icon: Icon(Icons.cancel)),
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
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  void handleCheckboxChanged(bool? value, Member member) {
    setState(() {
      if (value == true) {
        selectedMembers.add(member);
      } else {
        selectedMembers.remove(member);
      }
    });
  }
}
