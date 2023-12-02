import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sound_app/models/chat_message_model.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  // Add a ScrollController
  ScrollController scrollController = ScrollController();

  List<dynamic> chatMessages = [
    ChatMessageModel('Alice', 'Hey!', true),
    ChatMessageModel(
        'Bob', 'Have you ever tried the sound comparison challenge?', true),
    ChatMessageModel(
        'Charlie', 'Sound comparison challenge? What\'s that?', false),
    ChatMessageModel(
        'Alice',
        'It\'s where we play two different sounds and guess which one is which.',
        true),
    ChatMessageModel(
        'Bob', "Sounds interesting! I'm up for the challenge.", false),
    ChatMessageModel('Alice',
        'Great! Let me find two intriguing sounds for you to compare.', true),
    ChatMessageModel('Bob', 'Sure, take your time.', false),
    ChatMessageModel(
        'Alice', 'Okay, here\'s the first sound. Guess what it is!', true),
    ChatMessageModel('Charlie', 'Is it a bird chirping?', false),
    ChatMessageModel('Alice',
        'Close, but not quite! It\'s actually a rainforest ambiance.', true),
    ChatMessageModel('Bob', 'Ah, got it wrong. Ready for the next one?', false),
    ChatMessageModel('Alice', 'Absolutely! Hit me with the next sound.', true),
    ChatMessageModel(
        'Charlie', 'Here it is. What do you think this one is?', true),
    ChatMessageModel('Bob', 'Sounds like ocean waves?', false),
    ChatMessageModel(
        'Alice', 'Bingo! You nailed it. It\'s the sound of ocean waves.', true),
    ChatMessageModel(
        'Charlie', 'Haha, that was fun! We should do this more often.', false),
    ChatMessageModel(
        'Bob',
        'Definitely! It\'s a great way to test our audio recognition skills.',
        true),
  ];

  @override
  void initState() {
    super.initState();

    // Scroll to the latest message when the widget is first initialized
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // Dispose of the ScrollController when the widget is disposed
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: Get.height * 0.8,
                color: Colors.white60,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: chatMessages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = chatMessages[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: message.isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: message.isSender
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextWidget(
                                    text: message.senderName,
                                    fSize: 14.0,
                                    fWeight: FontWeight.w600,
                                    textColor: Colors.black54,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: message.isSender
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: CustomTextWidget(
                                    text: message.message,
                                    fSize: 16,
                                    textColor: message.isSender
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              controller: chatController,
              onFieldSubmitted: (message) {},
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                hintText: 'Message',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 14,
                  ),
                  onPressed: () {
                    setState(() {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      });
                      if (chatController.text.isNotEmpty) {
                        chatMessages.add(
                            ChatMessageModel('You', chatController.text, true));
                        chatController.clear();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
