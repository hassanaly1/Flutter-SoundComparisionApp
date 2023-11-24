import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/home/components/custom_searchbar.dart';
import 'package:sound_app/views/home/home_screen.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile Screen Content'),
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          openBottomSheet(context);
        },
        tooltip: 'New Challenge',
        shape: const CircleBorder(side: BorderSide.none),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

void openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      bool value = false;
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
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
                      Get.back();
                    },
                    child: CustomTextWidget(text: 'Cancel', fSize: 12.0),
                  ),
                  CustomTextWidget(
                    text: 'New Challenge',
                    fSize: 16.0,
                    fWeight: FontWeight.w700,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: CustomTextWidget(text: 'Next', fSize: 12.0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const CustomSearchBar(),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      title: CustomTextWidget(
                        text: 'Michael John',
                        fSize: 16.0,
                        fWeight: FontWeight.w300,
                      ),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          value = value;
                        },
                        value: false, // Replace with your boolean variable
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
