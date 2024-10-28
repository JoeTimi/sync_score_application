import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'consts.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double width;
  final double height;
  final double elevation;
  final double fontSize;
  final Color btnColor, iconColor;
  final Color textColor;
  final Color borderColor, disableColor;
  final double borderRadius;
  final double padding;
  final FontWeight fontWeight;
  final double borderWidth;
  final bool isShowIcon;
  final String icon;

  const ButtonWidget({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 53,
    this.elevation = 0,
    this.onPressed,
    this.btnColor = buttonColor,
    this.textColor = whiteColor,
    this.borderColor = Colors.transparent,
    this.disableColor = buttonColor,
    this.borderRadius = 30,
    this.padding = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.borderWidth = 1,
    this.isShowIcon = false,
    this.icon = "",
    this.iconColor = whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        minWidth: width,
        elevation: elevation,
        color: btnColor,
        disabledColor: disableColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isShowIcon) const SizedBox(width: 16),
              if (isShowIcon)
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
