import 'package:flutter/material.dart';

class TextFieldWithBoxShadow extends StatelessWidget {
  final String? errorText;
  final String? labelText;
  final TextEditingController? controller;
  final double height;

  const TextFieldWithBoxShadow({
    Key? key,
    this.errorText,
    this.labelText,
    this.controller,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorStyle = TextStyle(
      fontSize: 14,
    );

    // Wrap everything in LayoutBuilder so that the available maxWidth is taken into account for the height calculation (important if you error text exceeds one line)
    return LayoutBuilder(builder: (context, constraints) {
      // Use tp to calculate the height of the errorText
      final textPainter = TextPainter()
        ..text = TextSpan(text: errorText, style: errorStyle)
        ..textDirection = TextDirection.ltr
        ..layout(maxWidth: constraints.maxWidth);

      final heightErrorMessage = textPainter.size.height + 8;
      return Stack(
        children: [
          // Separate container with identical height of text field which is placed behind the actual textfield
          Container(
            height: height,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 3,
                  offset: Offset(3, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
          SizedBox(
            // Add height of error message if it is displayed
            height: errorText != null ? height + heightErrorMessage : height,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                errorStyle: errorStyle,
                errorText: errorText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                labelText: labelText,
              ),
              controller: controller,
            ),
          ),
        ],
      );
    });
  }
}