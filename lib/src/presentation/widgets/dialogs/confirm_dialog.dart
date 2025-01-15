part of '../widgets.dart';

class ConfirmDialog extends StatelessWidget {
  final String? title, content, lottiePath;
  final String? labelLeftButton, labelRightButton;
  final Color? colorLeftButton, colorRightButton;
  final Color? colorLeftTextButton, colorRightTextButton;
  final double? lottieHeight;
  final double? fontSizeLeftButton, fontSizeRightButton;
  final Function()? onLeftPressed, onRightPressed;
  final Icon? iconLeftButton, iconRightButton;
  final Widget? customWidget;
  final EdgeInsets? insetPadding;

  const ConfirmDialog({
    super.key,
    this.title,
    this.content,
    this.lottiePath,
    this.labelLeftButton,
    this.labelRightButton,
    this.colorLeftButton,
    this.colorRightButton,
    this.colorLeftTextButton = AppColors.black,
    this.colorRightTextButton = AppColors.white,
    this.lottieHeight,
    this.fontSizeLeftButton,
    this.fontSizeRightButton,
    this.iconLeftButton,
    this.iconRightButton,
    this.onLeftPressed,
    this.onRightPressed,
    this.customWidget,
    this.insetPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding,
      child: Container(
        width: context.screenWidth * 0.9,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (lottiePath != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 8),
                  child: Lottie.asset(lottiePath!,
                      height: lottieHeight ?? 130, fit: BoxFit.fitWidth),
                ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (content != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    content!,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              if (customWidget != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: customWidget,
                ),
              if (customWidget == null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  child: Wrap(
                    runAlignment: WrapAlignment.spaceAround,
                    alignment: WrapAlignment.center,
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      AppRoundedButton(
                        onPressed: onLeftPressed,
                        label: labelLeftButton ?? "Yes",
                        labelStyle: TextStyle(
                          color: colorLeftTextButton,
                          fontSize: fontSizeLeftButton,
                        ),
                        labelColor: colorLeftButton,
                        expanded: false,
                        useBorder: true,
                        width: 110,
                        height: 42,
                      ),
                      AppRoundedButton(
                        onPressed: onRightPressed,
                        label: labelRightButton ?? "No",
                        labelStyle: TextStyle(
                          color: colorRightTextButton,
                          fontSize: fontSizeRightButton,
                        ),
                        labelColor: colorRightButton,
                        expanded: false,
                        useBorder: false,
                        width: 110,
                        height: 42,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
