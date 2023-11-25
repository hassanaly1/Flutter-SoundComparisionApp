import 'package:flutter/material.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

import 'custom_searchbar.dart';

void addMemberBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const AddMemberBottomSheet();
    },
  );
}

class AddMemberBottomSheet extends StatefulWidget {
  const AddMemberBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddMemberBottomSheetState createState() => _AddMemberBottomSheetState();
}

class _AddMemberBottomSheetState extends State<AddMemberBottomSheet> {
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
      child: Padding(
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
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => AddGroupInfoBottomSheet(),
                            ),
                          );
                          // Get.to(AddGroupInfoBottomSheet());
                          // Do something with selected members
                          // You can access selectedMembers list here
                          // e.g., selectedMembers.forEach((member) => print(member.name));
                        }
                      : null, // Set onPressed to null to disable the button
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
                      .where((member) => member.name
                          .toLowerCase()
                          .contains(query.toLowerCase()))
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
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25,
                            backgroundImage: NetworkImage(member.imageUrl),
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

class AddGroupInfoBottomSheet extends StatefulWidget {
  const AddGroupInfoBottomSheet({super.key});

  @override
  State<AddGroupInfoBottomSheet> createState() =>
      _AddGroupInfoBottomSheetState();
}

class _AddGroupInfoBottomSheetState extends State<AddGroupInfoBottomSheet> {
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
