import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Notes", onPress: () {}, trailing: Icons.add),
    );
  }
}
