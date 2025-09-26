import 'package:caluclator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDealCard extends StatelessWidget {
  String title;
  String subtitle;
  String buttonText;
  Color? bgColor;
  Color? textColor;
  Color? buttonColor;
  CustomDealCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.buttonColor,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(7), // Removes rounding
        ),
        color: bgColor ?? Color(0xff4392F9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: textColor ?? Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              // You can add a product image or action button here later
              CustomButton(
                onPressed: () {},
                text: buttonText,
                bgColor: buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
