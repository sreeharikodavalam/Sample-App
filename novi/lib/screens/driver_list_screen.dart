import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moovebe/screens/add_driver.dart';
import 'package:moovebe/screens/bus_manage_screen.dart';
import 'package:moovebe/utils.dart';
import 'package:moovebe/widgets/app_buttons.dart';
import 'package:moovebe/widgets/bus_card_item.dart';

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
            statusBarIconBrightness: Brightness.light, 
            statusBarBrightness: Brightness.light,
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
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: AppCardHorizontal(
                          imageUrl: 'https://thumbs.dreamstime.com/b/male-driver-black-mask-driving-intercity-bus-tourism-health-people-concept-male-driver-wearing-face-protective-black-mask-198488237.jpg',
                          busName: "KSRTC",
                          description: "Licence No : 56465462131123",
                          actionText: "Delete",
                          onButtonClick: () => _confirmDeletion(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 4, top: 4),
                child: AppButtonLarge(
                  text: "Add Driver",
                  onButtonClick: () {
                    pushScreen(context  , const AddDriverScreen());
                  },
                  isPrimary: true,
                ),
              ),
            ],
          ),
        )
    );
  }
  Future<void> _confirmDeletion() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure want to delete driver?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This action cant be reverted'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                customDialog(context: context, title: "Deleted ", description: "driver data deleted successfully");
              },
            ),
          ],
        );
      },
    );
  }



}


