import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Email Sync'),
      body: Column(
        children: [
          EmailCard(
            leading: 'M',
            title: 'Manik Rahman',
            subTitle: 'Please review the paper',
            active: '3h ago',
          ),
          EmailCard(
            leading: 'M',
            title: 'Manik Rahman',
            subTitle: 'Please review the paper',
            active: '3h ago',
          ),
          EmailCard(
            leading: 'M',
            title: 'Manik Rahman',
            subTitle: 'Please review the paper',
            active: '3h ago',
          ),
        ],
      ),
    );
  }
}

class EmailCard extends StatelessWidget {
  final String leading;
  final String title;
  final String subTitle;
  final String active;

  const EmailCard({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsetsGeometry.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        color: Color(0xFFF7FCFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 20,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            child: Center(child: Text(leading)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                active,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
