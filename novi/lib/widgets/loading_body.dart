import 'package:flutter/material.dart';


class LoadingBody extends StatefulWidget {
  const LoadingBody({Key? key}) : super(key: key);

  @override
  State<LoadingBody> createState() => _LoadingBodyState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoadingBodyState extends State<LoadingBody>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
