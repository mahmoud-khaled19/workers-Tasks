import 'package:flutter/material.dart';

class DefaultCustomText extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;

  const DefaultCustomText({
    super.key,
    required this.text,
    this.alignment = Alignment.center,
    required this.style,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: style
            ?.copyWith(fontSize: fontSize, color: color),
      ),
    );
  }
}
