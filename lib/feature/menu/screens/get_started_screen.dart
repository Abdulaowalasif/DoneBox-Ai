import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String data =
        '''DoneBox is your AI-powered productivity assistant, designed to simplify your daily workflow. With DoneBox, you can:
    
\u2022 Summarize long texts and documents in seconds
\u2022 Break down complex tasks into simple steps
\u2022 Reply to messages with suggested tones
\u2022 Schedule reminders and daily recaps

Getting started is easy! Just set up your profile, connect your tasks, and let DoneBox help you organize your day efficiently.''';

    return Scaffold(
      appBar: CustomAppbar(title: "Get Started", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              Text(
                data,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              CustomButton(
                text: "Get Started",
                onPressed: () {},
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
