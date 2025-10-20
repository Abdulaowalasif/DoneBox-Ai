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
                  SingleChildScrollView(
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
                                        MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.secondaryColor,
                                    ),
                                    child: Obx(
                                      () => Text(
                                        style: MyTextStyle.w5s16(context),
                                        controller.message.value ??
                                            "Ask something",
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
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
                              Image.asset(
                                ImageConst.aiIcon,
                                height: 32,
                                width: 32,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.secondaryColor,
                                    ),
                                    child: Obx(
                                      () => controller.isLoading.value
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeAlign: 0.1,
                                            )
                                          : Text(
                                              controller
                                                      .errorMessage
                                                      .value
                                                      .isNotEmpty
                                                  ? controller
                                                        .errorMessage
                                                        .value
                                                  : controller
                                                        .aiAssistantResponse['data']['title'],
                                              softWrap: true,
                                              style: MyTextStyle.w5s16(context),
                                            ),
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
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 24,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Here is the task based on what you give",
                          style: MyTextStyle.w4s16(context),
                          softWrap: true,
                        ),
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
                        Obx(
                          () => Text(
                            controller.aiAssistantResponse['data']['title'] ??
                                "Ask Something",
                            style: MyTextStyle.w5s16(context),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller
                                    .aiAssistantResponse['data']['description'] ??
                                "Ask something",
                            style: MyTextStyle.w4s16(context),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                          ),
                        ),
                        Obx(
                          () => AiAssistantItemCard(
                            icon: CupertinoIcons.folder,
                            category: 'Category',
                            title:
                                controller
                                    .aiAssistantResponse['data']['category'] ??
                                "Ask Something",
                          ),
                        ),
                        Obx(
                          () => AiAssistantItemCard(
                            icon: Icons.calendar_today_sharp,
                            category: 'Due Date',
                            title:
                                controller
                                    .aiAssistantResponse['data']['datetime_utc'] ??
                                "Ask Something",
                          ),
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
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        hintText: "Ask Anything",
                        hintStyle: MyTextStyle.w4s12(
                          context,
                        ).copyWith(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.getAiAssistant();
                            controller.messageController.clear();
                          },
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
