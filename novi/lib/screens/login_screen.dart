import 'package:flutter/material.dart';
import 'package:novi/screens/home_screen.dart';
import 'package:novi/utils.dart';
import 'package:novi/widgets/app_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 24),
                    child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 44, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Manage your Bus and Drivers",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _controllerUsername,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Username',
                    ),
                    onChanged: (text) {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _controllerPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                    ),
                    onChanged: (text) {},
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButtonLarge(
                text: "Login",
                onButtonClick: () {
                  pushScreen(context  , const HomeScreen());
                },
                isPrimary: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}