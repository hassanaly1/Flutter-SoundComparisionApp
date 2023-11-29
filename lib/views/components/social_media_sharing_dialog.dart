import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/views/components/custom_user_card.dart';
import 'package:sound_app/views/components/social_media_card.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

void addMemberBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SocialMediaSharingBottomSheet();
    },
  );
}

class SocialMediaSharingBottomSheet extends StatelessWidget {
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
  SocialMediaSharingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextWidget(
                text: 'Share with your friends',
                fSize: 16.0,
                fWeight: FontWeight.w500),
            const SizedBox(height: 10.0),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SocialMediaCard('assets/images/facebook.svg', 'Facebook'),
                  SocialMediaCard('assets/images/whatsapp.svg', 'WhatsApp'),
                  SocialMediaCard('assets/images/instagram.svg', 'Instagram'),
                  SocialMediaCard('assets/images/twitterx.svg', 'X'),
                  SocialMediaCard('assets/images/messenger.svg', 'Messanger')
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: context.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return CustomUserCard(
                      members[index].imageUrl, members[index].name);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: CustomTextWidget(text: 'Copy Link'),
                subtitle: CustomTextWidget(
                  text: 'https://www.example.com',
                  fSize: 16.0,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {},
                ),
              ),
            ),
            const Spacer(),
            CustomButtonWidget(
              buttonText: 'Cancel',
              onTap: () => Get.back(),
            )
          ],
        ),
      ),
    );
  }
}
