import 'package:flutter/material.dart';

import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/text.dart';

class CommonLongButton extends StatefulWidget {
  final VoidCallback onPress;
  final String buttonName;
  const CommonLongButton({
    super.key,
    required this.onPress,
    required this.buttonName,
  });

  @override
  State<CommonLongButton> createState() => _CommonLongButtonState();
}

class _CommonLongButtonState extends State<CommonLongButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor),
        height: 40,
        width: double.infinity,
        child: Center(child: TextWidgets.bodyText(text: widget.buttonName, color: secondaryColor, fontSize: 18)),
      ),
    );
  }
}

class CommonIconButton extends StatefulWidget {
  final VoidCallback onPress;
  final IconData icon;
  final bool? isStack;
  const CommonIconButton({
    super.key,
    required this.onPress,
    required this.icon,
    this.isStack = false,
  });

  @override
  State<CommonIconButton> createState() => _CommonIconButtonState();
}

class _CommonIconButtonState extends State<CommonIconButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.isStack!) {
      return GestureDetector(
        onTap: widget.onPress,
        child: Container(
          decoration: BoxDecoration(color: greyLight, shape: BoxShape.circle),
          height: 40,
          width: 40,
          child: Center(
              child: Stack(
            children: [
              Icon(
                widget.icon,
                size: 25,
              ),
              Positioned(
                top: 2,
                left: 15,
                child: Container(
                  decoration: const BoxDecoration(color: red, shape: BoxShape.circle),
                  width: 8,
                  height: 8,
                ),
              ),
            ],
          )),
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.onPress,
        child: Container(
          decoration: BoxDecoration(color: greyLight, shape: BoxShape.circle),
          height: 40,
          width: 40,
          child: Center(child: Icon(widget.icon)),
        ),
      );
    }
  }
}
