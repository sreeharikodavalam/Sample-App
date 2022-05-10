import 'package:flutter/material.dart';
import 'package:novi/widgets/app_buttons.dart';

class BusCard extends StatelessWidget {
  final String imageUrl;
  final String busName;
  final String journey;

  const BusCard({Key? key, required this.imageUrl, required this.busName, required this.journey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(imageUrl, height: 80, width: 80),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(child: Column(children: [Text(busName), const SizedBox(height: 4), Text(journey)])),
          ),
          AppButtonSmall(
            text: "Manage",
            onButtonClick: () {},
          )
        ],
      ),
    );
  }
}
