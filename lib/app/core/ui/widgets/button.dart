import 'package:cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Color? color;
  final String label;
  final Color? labelColor;
  final double labelSize;
  final double padding;
  final double width;
  final double height;

  const Button({
    Key? key,
    required this.onPressed,
    this.radius = 10,
    this.color,
    required this.label,
    this.labelColor,
    this.labelSize = 20,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
