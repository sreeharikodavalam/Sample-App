import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width : MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
              child: Image.asset("assets/logo.png", width: MediaQuery.of(context).size.width * .7,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Flexible(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () { },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Text('Get Started', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),),
                ),

              ),
            ),
          )

        ],
      ),
    );
  }
}
