import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novi/screens/add_driver.dart';
import 'package:novi/screens/bus_manage_screen.dart';
import 'package:novi/utils.dart';
import 'package:novi/widgets/app_buttons.dart';
import 'package:novi/widgets/bus_card_item.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  State<DriverList> createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          toolbarHeight: AppBar().preferredSize.height * 1.5,
          title: const Text("Driver List"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("21 Drivers found", textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: AppCardHorizontal(
                          imageUrl: 'https://www.thenewsminute.com/sites/default/files/KSRTC_Facebook_3062021_1200.jpg',
                          busName: "KSRTC",
                          description: "Swift Scaniya P-Series",
                          actionText: "Manage",
                          onButtonClick: () => pushScreen(
                            context,
                            const BusManageScreen(
                              busTitle: "KSRTC Swift Scaniya P-Series",
                              busId: "0",
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              AppButtonLarge(
                text: "Add Driver",
                onButtonClick: () {
                  pushScreen(context  , const AddDriverScreen());
                },
                isPrimary: true,
              ),
            ],
          ),
        )
    );
  }
}
