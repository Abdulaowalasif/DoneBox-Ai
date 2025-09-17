import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final VoidCallback onPress;

  const ActionCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 32, width: 32),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
    );
  }
}
