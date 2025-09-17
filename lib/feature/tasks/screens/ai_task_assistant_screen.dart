import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/tasks/controllers/ai_assistant_controller.dart';
import 'package:doneboxai/feature/tasks/widgets/ai_assistant_remind_card.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';
import '../widgets/ai_assistant_item_card.dart';

class AiTaskAssistantScreen extends StatelessWidget {
  const AiTaskAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AiAssistantController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(title: "Ai Assistant", onPress: () {}),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          /// Chat body content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // space for input box
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 20,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                          0.7,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.secondaryColor,
                                      ),
                                      child: Text(
                                        style: MyTextStyle.w5s16(),
                                        "Hey, got task for you—we need to prep a presentation for the client "
                                        "meeting at 2pm, next Monday. It’s about showcasing our new products "
                                        "and how they fit customer needs. Can you handle putting the slides together?",
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  ImageConst.aiIcon,
                                  height: 32,
                                  width: 32,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                          0.7,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.secondaryColor,
                                      ),
                                      child: Text(
                                        "Hey, got task for you—we need to prep a presentation for the client meeting at 2pm, next",
                                        softWrap: true,
                                        style: MyTextStyle.w5s16(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 24,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "Here is the task based on what you give",
                        style: MyTextStyle.w4s16(),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Presentation for the client meeting",
                          style: MyTextStyle.w5s16(),
                        ),
                        Text(
                          "Slide about showcasing new products and how they fit customer needs",
                          style: MyTextStyle.w4s16(),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                          ),
                        ),
                        AiAssistantItemCard(
                          icon: CupertinoIcons.folder,
                          category: 'Category',
                          title: 'Work',
                        ),
                        AiAssistantItemCard(
                          icon: Icons.calendar_today_sharp,
                          category: 'Due Date',
                          title: '15/09/2025',
                        ),
                        AiAssistantRemindCard(
                          icon: CupertinoIcons.check_mark,
                          category: "Remind me",
                          title: "something",
                        ),
                        AiAssistantItemCard(
                          icon: CupertinoIcons.flag,
                          iconColor: Colors.red,
                          category: 'Priority',
                          title: 'High',
                          textColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      Get.back();
                    },
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),

          /// Floating input box above keyboard
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        hintText: "Ask Anything",
                        hintStyle: MyTextStyle.w4s12().copyWith(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send, color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
