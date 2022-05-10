import 'package:flutter/material.dart';

class RedSeat extends StatelessWidget {
  final double width;
  const RedSeat({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/red_seat.png",width: width,height: width,fit: BoxFit.fill,);
  }
}

class BlackSeat extends StatelessWidget {
  final double width;
  const BlackSeat({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/black_seat.png",width: width,height: width,fit: BoxFit.fill,);
  }
}
