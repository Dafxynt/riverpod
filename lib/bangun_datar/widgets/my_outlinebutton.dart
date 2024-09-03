import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final double OutlineWidth;
  final String? imageAssetPath;
  final VoidCallback? onPressed; // Tambahkan parameter onPressed

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.fontSize,
    required this.OutlineWidth,
    this.imageAssetPath,
    this.onPressed, // Inisialisasi parameter onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed, // Gunakan parameter onPressed
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: OutlineWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAssetPath != null) ...[
              Image.asset(
                imageAssetPath!,
                width: 18.0,
                height: 18.0,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
