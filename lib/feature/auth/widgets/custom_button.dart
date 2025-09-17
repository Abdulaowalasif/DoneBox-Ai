import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isLoading;
  final IconData? leading;
  final double width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.leading,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.buttonColor : Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading != null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(leading),
                  )
                : SizedBox(),
            const SizedBox(width: 10),
            isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Text(
                    text,
                    style: MyTextStyle.w5s16().copyWith(color: Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}
