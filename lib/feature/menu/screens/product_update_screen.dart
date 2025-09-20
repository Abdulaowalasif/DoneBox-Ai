import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/conts/my_text_style.dart';

class ProductUpdateScreen extends StatelessWidget {
  const ProductUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const data =
        '''\u2022Read guides and tutorials for advanced DoneBox features
\u2022Learn about upcoming releases before everyone else
\u2022Get tips and insights to boost your daily workflow''';

    return Scaffold(
      appBar: CustomAppbar(title: "Product updates & blog", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            children: [
              Text(
                "Don’t miss a thing! Our blog and update section keeps you informed about the latest features, improvements, and productivity tips.",
                style: MyTextStyle.w5s16(context),
              ),
              Text(data, style: MyTextStyle.w5s16(context)),
              Text(
                "Stay ahead with DoneBox, and make sure you never miss a new update or important announcement.",
                style: MyTextStyle.w5s16(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
