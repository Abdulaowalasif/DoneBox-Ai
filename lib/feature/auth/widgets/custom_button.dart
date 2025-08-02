import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isEnabled ? Colors.blue : Colors.grey,
          ),
          child: isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.white,))
              : Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
        ),
      ),
    );
  }
}
