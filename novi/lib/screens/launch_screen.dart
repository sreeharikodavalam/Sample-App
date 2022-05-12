import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moovebe/api/api_auth.dart';
import 'package:moovebe/constants/app_colors.dart';
import 'package:moovebe/screens/home_screen.dart';
import 'package:moovebe/screens/login_screen.dart';
import 'package:moovebe/utils.dart';
import 'package:moovebe/widgets/app_buttons.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool isLoading = true;
  bool isLogged = false;
  bool connection = true;

  _setLoadingState(status) => setState(() => isLoading = status);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiAuth.refreshToken().then((value) {
      isLogged = value;
      _setLoadingState(false);
    }).onError((error, stackTrace) {
      _setLoadingState(false);
      print("error " + error.toString());
      print("stackTrace " + stackTrace.toString());
      customDialog(context: context, title: "Connectivity problem", description: "Unable to connect with server");
      connection = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: isLoading
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
                      )
                    : AppButtonLarge(
                        onButtonClick: () {
                          if (connection) {
                            if (isLogged) {
                              pushScreen(context, const HomeScreen());
                            } else {
                              pushScreen(context, const LoginScreen());
                            }
                          } else {
                            customDialog(context: context, title: "Connectivity problem", description: "Unable to connect with server, try restarting the app ");
                          }
                        },
                        text: "Get Started",
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
