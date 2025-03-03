import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final List<Color> gradientColors;
  final Color iconColor;
  final String? text;
  final bool displayIcon;
  final TextStyle? textStyle;
  final Color? solidColor;

  BottomPickerButton(
      {required this.onClick,
      required this.iconColor,
      this.text,
      this.textStyle,
      this.displayIcon = true,
      this.gradientColors = BLUE_THEME_COLOR,
      this.solidColor}) {
    if (!displayIcon) {
      assert(text != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onClick.call();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: solidColor,
            gradient: solidColor == null
                ? LinearGradient(
                    colors: gradientColors,
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)
                : null),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (text != null) Text(text!, style: textStyle),
              if (displayIcon)
                Icon(Icons.done, color: this.iconColor, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
