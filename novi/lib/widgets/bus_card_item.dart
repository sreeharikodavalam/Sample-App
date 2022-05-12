import 'package:flutter/material.dart';
import 'package:moovebe/widgets/app_buttons.dart';

class AppCardHorizontal extends StatelessWidget {
  final String imageUrl;
  final String busName;
  final String description;
  final String actionText;
  final VoidCallback onButtonClick;

  const AppCardHorizontal({
    Key? key,
    required this.imageUrl,
    required this.busName,
    required this.description,
    required this.actionText,
    required this.onButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    busName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          AppButtonSmall(
            text: actionText,
            onButtonClick: () => onButtonClick.call(),
            isPrimary: true,
          )
        ],
      ),
    );
  }
}
