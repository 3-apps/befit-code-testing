import 'package:befit_code_testing/core/design_system/theme/colors/color_asset.dart';
import 'package:befit_code_testing/core/design_system/theme/fonts/font_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum _DSButtonType {
  largePrimary,
  largeSecondary,
  largeTransparent,
  smallSecondary,
}

class DSButton extends StatefulWidget {
  final _DSButtonType _type;
  final String label;
  final Function onPressed;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const DSButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
  }) : _type = _DSButtonType.largePrimary;

  const DSButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
  }) : _type = _DSButtonType.largeSecondary;

  const DSButton.secondarySmall({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
  }) : _type = _DSButtonType.smallSecondary;

  const DSButton.transparent({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isEnabled = true,
  }) : _type = _DSButtonType.largeTransparent,
       backgroundColor = null,
       foregroundColor = null;

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: pressedOpacity,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: height,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(48),
        ),
        child: isLoading
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              )
            : Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.leadingIcon != null) widget.leadingIcon!,
                  Text(
                    label,
                    style: FontAsset.labelLg.copyWith(color: textColor),
                  ),
                  if (widget.trailingIcon != null) widget.trailingIcon!,
                ],
              ),
      ),
    );
  }

  double get pressedOpacity => !widget.isEnabled || isLoading ? 1 : 0.4;

  Function()? get onPressed => !widget.isEnabled ? null : _onPressed;

  double get height {
    return switch (widget._type) {
      _DSButtonType.largePrimary => 72,
      _DSButtonType.largeSecondary => 72,
      _DSButtonType.largeTransparent => 64,
      _DSButtonType.smallSecondary => 40,
    };
  }

  EdgeInsets get padding {
    return switch (widget._type) {
      _DSButtonType.largePrimary => EdgeInsets.zero,
      _DSButtonType.largeSecondary => EdgeInsets.zero,
      _DSButtonType.smallSecondary => const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 10,
      ),
      _DSButtonType.largeTransparent => EdgeInsets.zero,
    };
  }

  Color get backgroundColor {
    if (widget._type == _DSButtonType.largeTransparent) return Colors.transparent;
    if (!widget.isEnabled) return ColorAsset.dividerLowContrastWhite;
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    return switch (widget._type) {
      _DSButtonType.largePrimary => ColorAsset.buttonDefault,
      _DSButtonType.largeSecondary => ColorAsset.backgroundSurfaceTertiary,
      _DSButtonType.smallSecondary => ColorAsset.backgroundSurfaceTertiary,
      _DSButtonType.largeTransparent => Colors.transparent,
    };
  }

  Color get textColor {
    if (!widget.isEnabled) return ColorAsset.textSecondary;
    if (widget.foregroundColor != null) return widget.foregroundColor!;

    return switch (widget._type) {
      _DSButtonType.largePrimary => ColorAsset.textInvert,
      _DSButtonType.largeSecondary => ColorAsset.textPrimary,
      _DSButtonType.smallSecondary => ColorAsset.textPrimary,
      _DSButtonType.largeTransparent => ColorAsset.textPrimary,
    };
  }

  double get spacing {
    return switch (widget._type) {
      _DSButtonType.largePrimary => 20,
      _DSButtonType.largeSecondary => 20,
      _DSButtonType.largeTransparent => 20,
      _DSButtonType.smallSecondary => 4,
    };
  }

  String get label {
    return switch (widget._type) {
      _DSButtonType.largePrimary => widget.label.toUpperCase(),
      _DSButtonType.largeSecondary => widget.label.toUpperCase(),
      _DSButtonType.smallSecondary => widget.label,
      _DSButtonType.largeTransparent => widget.label.toUpperCase(),
    };
  }

  Future<void> _onPressed() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    try {
      await widget.onPressed();
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }
}
