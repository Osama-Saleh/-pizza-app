part of '../import_paths/import_paths.dart';

class CustomTextButton extends StatelessWidget {
  final double? borderradius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle testStyle;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    this.borderradius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.testStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius ?? 16.r),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? Theme.of(context).colorScheme.primary),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h,
            ),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h),
          )),
      onPressed: onPressed,
      child: Text(buttonText, style: testStyle),
    );
  }
}
