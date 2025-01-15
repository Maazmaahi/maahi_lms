part of '../cores.dart';

class DialogUtils {
  static const DialogTransitionType animationType =
      DialogTransitionType.slideFromBottom;

  static Future<void> messageSuccess({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
  }) async {
    // await ProgressUtils.hide();
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? "Success",
        message: message,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<void> messageError({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
  }) async {
    debugPrint("[ERROR] : ${message.toString()}");
    // await ProgressUtils.hide();
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? "Error",
        message: message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // static Future<T?> info<T>({
  //   required BuildContext context,
  //   String? title,
  //   String? content,
  //   String? lottiePath,
  //   EdgeInsets? lottiePadding,
  //   EdgeInsets? insetPadding,
  //   String? labelButton,
  //   Function()? onClicked,
  //   Widget? customWidget,
  //   bool isBackAfterYes = true,
  // }) {
  //   return await showAnimatedDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     animationType: animationType,
  //     curve: Curves.ease,
  //     barrierColor: Colors.black.withOpacity(0.8),
  //     builder: (_) => InfoDialog(
  //       title: title,
  //       content: content,
  //       lottiePath: lottiePath,
  //       lottiePadding: lottiePadding,
  //       padding: insetPadding,
  //       labelButton: labelButton,
  //       customWidget: customWidget,
  //       onPressed: () {
  //          if(isBackAfterYes) context.maybePop();
  //          if(onClicked != null) onClicked();
  //       },
  //     ),
  //   );
  // }

  static Future<T?> confirm<T>({
    required BuildContext context,
    String? title,
    String? content,
    String? lottiePath,
    EdgeInsets? lottiePadding,
    EdgeInsets? insetPadding,
    String? labelNoButton,
    String? labelYesButton,
    Function()? onNoClicked,
    Function()? onYesClicked,
    Widget? customWidget,
    bool isBackAfterYes = true,
  }) async {
    return await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: animationType,
      curve: Curves.ease,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) => ConfirmDialog(
        title: title,
        content: content,
        insetPadding: insetPadding,
        lottiePath: lottiePath,
        customWidget: customWidget,
        labelLeftButton: labelYesButton,
        onLeftPressed: () {
          if (isBackAfterYes) context.maybePop();
          if (onYesClicked != null) onYesClicked();
        },
        labelRightButton: labelNoButton,
        onRightPressed: () {
          if (isBackAfterYes) context.maybePop();
          if (onNoClicked != null) onNoClicked();
        },
      ),
    );
  }
}
