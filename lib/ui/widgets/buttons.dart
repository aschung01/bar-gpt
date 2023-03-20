import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextActionButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final double? fontSize;
  final Color? textColor;
  final Color? overlayColor;
  final bool? activated;
  final bool? isUnderlined;
  final Widget? icon;
  final bool leading;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final EdgeInsets? padding;

  const TextActionButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.overlayColor,
    this.activated,
    this.isUnderlined = true,
    this.icon,
    this.leading = false,
    this.width,
    this.height = 40,
    this.fontWeight,
    this.fontFamily,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      overlayColor: MaterialStateProperty.all(
          overlayColor ?? ColorManager.primary.withOpacity(0.1)),
      minimumSize: MaterialStateProperty.all(Size.zero),
      padding: MaterialStateProperty.all(padding),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    Widget text = Text(
      buttonText,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: (activated != null ? activated! : true)
            ? (textColor ?? Colors.black)
            : ColorManager.gray3,
        textBaseline: TextBaseline.ideographic,
        height: 1.0,
      ),
    );

    Widget underlinedText = isUnderlined!
        ? DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (activated != null ? activated! : true)
                      ? (textColor ?? Colors.black)
                      : ColorManager.gray3,
                  width: 0.5,
                ),
              ),
            ),
            child: text)
        : text;

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: (activated == null || activated!) ? onPressed : null,
        style: style,
        child: icon == null
            ? underlinedText
            : Row(
                children: [
                  if (leading) icon!,
                  underlinedText,
                  if (!leading) icon!,
                ],
              ),
      ),
    );
  }
}

class ElevatedActionButton extends StatelessWidget {
  final String buttonText;
  final dynamic Function()? onPressed;
  final bool activated;
  final bool disabledStyleOutline;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? overlayColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final BorderSide? borderSide;
  final Widget? leading;
  const ElevatedActionButton({
    Key? key,
    required this.buttonText,
    required dynamic Function() this.onPressed,
    this.disabledStyleOutline = false,
    this.activated = true,
    this.height = 60,
    this.width = 220,
    this.backgroundColor,
    this.overlayColor,
    this.borderRadius = 30,
    this.borderSide,
    this.textStyle,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      backgroundColor: disabledStyleOutline
          ? MaterialStateProperty.all(
              backgroundColor ??
                  ColorManager.primary, // Use the component's default.
            )
          : MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return ColorManager.gray6;
                }
                return backgroundColor ??
                    ColorManager.primary; // Use the component's default.
              },
            ),
      overlayColor: MaterialStateProperty.all(overlayColor),
      splashFactory: NoSplash.splashFactory,
      minimumSize: MaterialStateProperty.all(const Size(250, 50)),
      textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 16,
      )),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
      )),
      side: borderSide != null ? MaterialStateProperty.all(borderSide) : null,
      elevation: MaterialStateProperty.all(0),
    );

    return SizedBox(
      width: width,
      height: height,
      child: activated || !disabledStyleOutline
          ? ElevatedButton(
              onPressed: activated ? onPressed : null,
              style: style,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    if (leading != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: leading!,
                      ),
                    Text(
                      buttonText,
                      style: textStyle ??
                          TextStyle(
                            color: activated
                                ? ((int.parse(
                                            (backgroundColor ??
                                                    ColorManager.primary)
                                                .toString()
                                                .substring(10, 16),
                                            radix: 16) <
                                        int.parse('800000', radix: 16))
                                    ? Colors.white
                                    : ColorManager.gray6)
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            )
          : OutlinedButton(
              onPressed: activated ? onPressed : null,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  width: 1,
                  color: ColorManager.gray6,
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    if (leading != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: leading!,
                      ),
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: ColorManager.gray6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
