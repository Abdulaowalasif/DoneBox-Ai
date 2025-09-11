import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/tasks/widgets/ai_assistant_remind_card.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/ai_assistant_item_card.dart';

class AiTaskAssistant extends StatelessWidget {
  const AiTaskAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Ai Assistant", onPress: () {  },),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.send,color: AppColors.primaryColor,)),
            hint: Text("Ask Anything",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),)
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.secondaryColor,
                                  ),
                                  child: const Text(
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.secondaryColor,
                                  ),
                                  child: Text(
                                    "Hey, got task for you—we need to prep a presentation for the client meeting at 2pm, next",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                  child: const Text(
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.secondaryColor,
                                  ),
                                  child: Text(
                                    "Hey, got task for you—we need to prep a presentation for the client meeting at 2pm, next",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: AppColors.secondaryColor),
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Presentation for the client meeting",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Slide about showcasing new products and how they fit customer needs",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
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
                    AiAssistantRemindCard(icon: CupertinoIcons.check_mark, category: "Remind me", title: "something"),
                    AiAssistantItemCard(
                      icon: CupertinoIcons.flag,
                      iconColor: Colors.red,
                      category: 'Remind me',
                      title: 'High',
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
              CustomButton(text: "Save", onPressed: (){}, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
