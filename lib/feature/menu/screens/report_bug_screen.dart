import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/conts/my_text_style.dart';

class ReportBugScreen extends StatelessWidget {
  const ReportBugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String data = '''\u2022Describe the issue and what you were doing
\u2022Attach screenshots or recordings if possible
\u2022Submit the report and track progress''';

    return Scaffold(
      appBar: CustomAppbar(title: "Report A Bug", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              Text(
                "Found a bug? Reporting it helps us make DoneBox better for everyone.",
                style: MyTextStyle.w5s16(),
              ),
              Text(data, style: MyTextStyle.w5s16()),
              Text(
                "Our team will prioritize fixing the bug, and your feedback will directly influence future updates.",

                style: MyTextStyle.w5s16(),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  hint: Text("Type here", style: GoogleFonts.poppins()),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "Report Bug",
                onPressed: () {
                  Get.back();
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
