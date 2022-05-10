import 'package:flutter/material.dart';
import 'package:novi/constants/app_colors.dart';
import 'package:novi/constants/app_styles.dart';

class AppButtonLarge extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onButtonClick;

  const AppButtonLarge({
    Key? key,
    required this.text,
    this.isPrimary = false,
    required this.onButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isPrimary ? AppColors.primaryColor : Colors.white,
          minimumSize: const Size(100, 70),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        onPressed: () {
          onButtonClick.call();
        },
        child: Text(
          text,
          style: isPrimary ? AppStyles.largeTextWhite : AppStyles.largeTextPrimary,
        ),
      ),
    );
  }
}

class AppButtonSmall extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onButtonClick;

  const AppButtonSmall({Key? key, required this.text, this.isPrimary = false, required this.onButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: isPrimary ? AppColors.primaryColor : Colors.white, elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), minimumSize: Size(40, 40)),
      onPressed: () => onButtonClick.call(),
      child: Text(
        text,
        style: isPrimary ? AppStyles.mediumTextWhite : AppStyles.mediumTextPrimary,
      ),
    );
  }
}
