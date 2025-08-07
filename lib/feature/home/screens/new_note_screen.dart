import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/conts/navIds.dart';
import '../../widgets/custom_appbar.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'New Note', navIds: NavIds.home),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Type your note here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.buttonColor,  // Color for the border
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.buttonColor,  // Color for focused state
                    width: 2,  // Optional: Adjust width for focused state
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.buttonColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: "Save",
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
