import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String infoCollect = '''
\u2022 Account information: email, name, and password (hashed).
\u2022 Task data: tasks, notes, reminders, attachments.
\u2022 Device data: app usage, crash logs, timezone.
\u2022 Optional (only if you enable): calendar, contacts, notifications, analytics.''';

    const String howWeUseData = '''
\u2022 Provide and sync reminders and tasks.
\u2022 Send notifications and alerts.
\u2022 Improve app performance and fix bugs.
\u2022 Comply with law and prevent abuse.''';

    const String dataSharing = '''
\u2022 We do not sell your data.
\u2022 Shared only with service providers (hosting, crash reports, payments) or if required by law.''';

    const String dataRetention = '''\u2022 We use encryption and safeguards.
\u2022 Data is deleted when you close your account, except where law requires longer retention.
''';

    return Scaffold(
      appBar: CustomAppbar(title: "Privacy & Policy", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DoneBox is a task and reminder app. We respect your privacy and only collect what’s needed to provide our services.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Information We Collect",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(infoCollect),
              const SizedBox(height: 20),
              Text(
                "How We Use Data",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(howWeUseData),
              const SizedBox(height: 20),
              Text(
                "Sharing",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(dataSharing), const SizedBox(height: 20),
              Text(
                "Security & Retention",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(dataRetention),
            ],
          ),
        ),
      ),
    );
  }
}
