import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moovebe/screens/home_screen.dart';
import 'package:moovebe/utils.dart';
import 'package:moovebe/widgets/app_buttons.dart';

class AddDriverScreen extends StatefulWidget {
  const AddDriverScreen({Key? key}) : super(key: key);

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final TextEditingController _controllerDriverName = TextEditingController();
  final TextEditingController _controllerLicenceNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light, 
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: AppBar().preferredSize.height * 1.5,
        title: const Text("Add Driver"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _controllerDriverName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _controllerLicenceNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Licence Number',
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 4),
                child: AppButtonLarge(
                  text: "Save",
                  onButtonClick: () {
                    pushScreen(context  , const HomeScreen());
                  },
                  isPrimary: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
