import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/conts/image_icon_const.dart';
import '../../../core/conts/my_text_style.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(title: "Support", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            children: [
              Text(
                "Need help using DoneBox? Our live chat support is here for you. Whether it’s a quick question or detailed guidance, we’ll respond in real-time.",
                style: MyTextStyle.w5s16(context),
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hint: Text(
                    "Type your message here",
                    style: MyTextStyle.w5s14(context, color: Colors.grey),
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {},
                text: 'Send Feedback',
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
