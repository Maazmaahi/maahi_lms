part of '../widgets.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final Widget? icon;
  final Color? color;
  final Color? labelColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final bool useBorder;
  final bool expanded;

  const AppRoundedButton({
    super.key,
    this.onPressed,
    required this.label,
    this.labelStyle,
    this.icon,
    this.color,
    this.labelColor,
    this.padding,
    this.height = 47,
    this.width,
    this.useBorder = false,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    final colorButton = onPressed == null
        ? context.theme.shadowColor.withOpacity(0.5)
        : (color ??
            (useBorder
                ? context.theme.appBarTheme.backgroundColor
                : context.theme.colorScheme.primary));
    return Padding(
      padding: !expanded
          ? const EdgeInsets.all(0)
          : (padding ?? const EdgeInsets.symmetric(horizontal: 4)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: borderRadius,
            border: colorButton!.computeLuminance() >= 0.5 && useBorder
                ? Border.all(color: Colors.grey)
                : Border.all(color: Colors.grey),
          ),
          height: height,
          width: width ?? context.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon,
                ),
              Text(
                label,
                style: labelStyle ??
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: labelColor ??
                          (colorButton.computeLuminance() >= 0.5
                              ? Colors.black
                              : Colors.white),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
