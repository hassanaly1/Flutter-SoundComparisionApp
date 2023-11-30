import 'package:flutter/material.dart';
import 'package:sound_app/models/member_model.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomMember extends StatelessWidget {
  final List<Member> members;
  final int index;
  const CustomMember({
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
            const SizedBox(width: 15.0),
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
