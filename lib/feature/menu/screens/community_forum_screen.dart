import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/conts/my_text_style.dart';

class CommunityForumScreen extends StatelessWidget {
  const CommunityForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const data = '''\u2022Ask questions and share your tips
\u2022Discuss best practices for task management
\u2022Learn from tutorials, guides, and expert users
\u2022Participate in discussions about new features''';

    return Scaffold(
      appBar: CustomAppbar(title: "Community Forum", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              Text(
                "Join the DoneBox community and discover new ways to enhance your productivity.",

                style: MyTextStyle.w5s16(),
              ),
              Text(data, style: MyTextStyle.w5s16()),
              Text(
                "Collaboration and knowledge sharing help everyone get the most out of DoneBox.",

                style: MyTextStyle.w5s16(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
