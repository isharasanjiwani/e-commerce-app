import 'package:flutter/material.dart';
import 'package:flutter_project/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double ? width;

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 50
          ),
          backgroundColor: AppColors.primary
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
        ));
  }
}
