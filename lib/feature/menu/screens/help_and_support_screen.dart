import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/help_support_card.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Help & Support", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hint: Text("search FAQs, guides or keywords"),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              HelpSupportCard(
                icon: Icons.live_help_outlined,
                title: "FAQs & Guides",
                text1: "Getting started with donebox",
                text1Tap: () => Get.toNamed(RoutesName.getStarted),
                text2: "Subscription & billing",
                text2Tap: () => Get.toNamed(RoutesName.subscription),
                text3: "Privacy & security",
                text3Tap: () => Get.toNamed(RoutesName.privacyPolicy),
              ),
              const SizedBox(height: 20),
              HelpSupportCard(
                icon: Icons.contact_mail_outlined,
                title: "Contact Support",
                text1: "Live Chat",
                text1Tap: () => Get.toNamed(RoutesName.liveChat),
                text2: "Email Support",
                text2Tap: () => Get.toNamed(RoutesName.emailSupport),
                text3: "Report a Bug",
              ),
              const SizedBox(height: 20),
              HelpSupportCard(
                icon: Icons.people_outline,
                title: "Community & Resources",
                text1: "Donebox community forum",
                text2: "Product updates & blog",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
