import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';
import '../widgets/notes_card.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showAddNoteDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: const Text("Add New Note"),
            ),
            alignment: Alignment.center,
            content: SizedBox(
              width: double.maxFinite, // expands to available width
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Note Title", style: MyTextStyle.w5s16(context)),
                  const TextField(
                    decoration: InputDecoration(hintText: "Write Note title"),
                  ),
                  const SizedBox(height: 20),
                  Text("Note Topic", style: MyTextStyle.w5s16(context)),
                  const TextField(
                    decoration: InputDecoration(hintText: "Write Note topic"),
                  ),
                  const SizedBox(height: 20),
                  Text("Description", style: MyTextStyle.w5s16(context)),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Type your task Description",
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel", style: MyTextStyle.w5s16(context)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Save",
                  style: MyTextStyle.w5s16(context).copyWith(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: "Notes",
        onPress: () {
          showAddNoteDialog(context);
        },
        trailing: Icons.add,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                decoration: InputDecoration(
                  hint: Text("Search Notes"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hint: Text("Write quick note...."),
                  suffixIcon: Icon(Icons.keyboard_voice_outlined),
                ),
              ),
              for (int i = 0; i < 3; i++)
                NotesCard(
                  title: "Client feedback",
                  subTitle: "Received comments on the new marketing campaign",
                  time: "10:40 AM",
                  buttonText: "marketing task",
                ),
            ],
          ),
        ),
      ),
    );
  }
}
