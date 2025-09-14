import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/conts/image_icon_const.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Live Chat", onPress: () {}),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Material(
          elevation: 4,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.send, color: AppColors.primaryColor),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Ask Anything",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            children: [
              Text(
                "Need help using DoneBox? Our live chat support is here for you. Whether it’s a quick question or detailed guidance, we’ll respond in real-time.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
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
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
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
    );
  }
}
