import 'package:flutter/material.dart';
import 'package:novi/constents/app_colors.dart';
import 'package:novi/screens/login_screen.dart';
import 'package:novi/utils.dart';
import 'package:novi/widgets/app_buttons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width * .7,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButtonLarge(
              onButtonClick: () {
                pushScreen(context, const LoginScreen());
              },
              text: "Get Started",
            ),
            ),
        ],
      ),
    );
  }
}
