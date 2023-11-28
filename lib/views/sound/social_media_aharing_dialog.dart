import 'package:flutter/material.dart';

void addMemberBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const SocialMediaSharingBottomSheet();
    },
  );
}

class SocialMediaSharingBottomSheet extends StatelessWidget {
  const SocialMediaSharingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
