import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  Color? bgColor;

  CustomButton({required this.onPressed, required this.text, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.white, // White border on the right
          width: 1.0, // You can adjust the thickness here
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              bgColor ??
              Colors.transparent, // Change button background if needed
          foregroundColor: Colors.white, // Text color
          elevation: 0, // Optional: remove shadow
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            SizedBox(width: 5),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
