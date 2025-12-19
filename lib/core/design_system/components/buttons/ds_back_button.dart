import 'package:befit_code_testing/core/design_system/theme/colors/color_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DSBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const DSBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed ?? () => Navigator.pop(context),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorAsset.backgroundSurfaceTertiary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          color: ColorAsset.iconPrimary,
          size: 20,
        ),
      ),
    );
  }
}
