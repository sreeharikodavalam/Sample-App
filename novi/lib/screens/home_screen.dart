import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.black,
            child: Image.asset("assets/logo.png"),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/bus.png",
                width: MediaQuery.of(context).size.width *.45,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 16),
              Image.asset("assets/driver.png",
                width: MediaQuery.of(context).size.width *.45,
                fit: BoxFit.fill,
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Padding(
            padding:  EdgeInsets.only(left: 16, right: 16),
            child: Text("21 Buses Found"),
          )
        ],

      ),
    );
  }
}
