import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSupportScreen extends StatelessWidget {
  const EmailSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchEmail() async {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'support@donebox.ai',
        query: 'subject=Support Request&body=Hello, I need help with...',
      );

      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    }

    const data = '''\u2022 Attach screenshots or files for better clarity
\u2022 Track the status of your support requests
\u2022 Keep your communication organized and professional''';
    return Scaffold(
      appBar: CustomAppbar(title: "Email Support", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                "Prefer email? We’ve got you covered. Send detailed questions, feedback, or bug reports, and we’ll respond within 24 hours.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                data,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              RichText(
                text: TextSpan(
                  text: "Contact Email : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "support@donebox.ai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async => _launchEmail(),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text:
                      "DoneBox ensures you get timely assistance even if you’re not online for live chat. Simply compose your email and send it to ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "support@donebox.ai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async => _launchEmail(),
                    ),
                    TextSpan(
                      text: " and our team will take care of the rest. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
