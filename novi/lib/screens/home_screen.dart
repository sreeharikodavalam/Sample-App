import 'package:flutter/material.dart';
import 'package:novi/screens/bus_manage_screen.dart';
import 'package:novi/screens/driver_list_screen.dart';
import 'package:novi/utils.dart';
import 'package:novi/widgets/bus_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
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
          Image.asset(
            "assets/bus.png",
            width: MediaQuery.of(context).size.width * .45,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          InkWell(
            child: Image.asset(
              "assets/driver.png",
              width: MediaQuery.of(context).size.width * .45,
              fit: BoxFit.fill,
            ),
            onTap: () => pushScreen(context, const DriverList()),
          ),
        ],
      ),
      const SizedBox(height: 28),
      const Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Text("21 Buses Found"),
      ),
      const SizedBox(height: 28),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppCardHorizontal(
                imageUrl: 'https://www.thenewsminute.com/sites/default/files/KSRTC_Facebook_3062021_1200.jpg',
                busName: "KSRTC",
                description: "Swift Scaniya P-Series",
                actionText: "Manage",
                onButtonClick: () => pushScreen(
                  context,
                   BusManageScreen(
                    busTitle: "KSRTC Swift Scaniya P-Series",
                    busId: "0",
                    is2X2Layout: ((index%2 == 0) ? true : false),
                  ),
                ),
              ),
            );
          }),
    ]));
  }
}
