import 'package:helper/data/mocks/pattern.dart';
import 'package:helper/utils/widgets/custom_text_field_widget.dart';
import 'package:helper/utils/widgets/pfp_widget.dart';
import 'package:flutter/material.dart';

class ChangeUserInfoPage extends StatelessWidget {
  const ChangeUserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    String about = '';
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Info')),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                ProfileWidget(
                    imagePath: userInfo.profilePic,
                    onClicked: () {},
                    icon: Icons.camera),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 40,
                    ),
                    child: CustomTextField(
                      label: 'User Name',
                      text: userInfo.fullName,
                      onChanged: (value) {
                        name = value;
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: CustomTextField(
                    label: 'About:',
                    text: userInfo.about,
                    maxLines: 5,
                    onChanged: (value) {
                      about = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          userInfo.fullName = name;
                          userInfo.about = about;
                          Navigator.pop(context);
                        },
                        child: const Text("Save")),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
