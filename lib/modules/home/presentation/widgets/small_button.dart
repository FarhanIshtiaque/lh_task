import 'package:flutter/material.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/text_styles.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
        required this.onPressed,

        this.color = AppColors.primary,
        this.disabledColor = AppColors.gray});
  final VoidCallback? onPressed;
  final Color? color;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: disabledColor,
      color: color,
      splashColor: AppColors.primary,
      elevation: 0,
      height:26,
      minWidth: 88,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Text('View all', style: caption1Strong,),
    );
  }
}