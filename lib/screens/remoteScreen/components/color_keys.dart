import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/models/samsung_tv.dart';
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class ColorKeys extends StatelessWidget {

  const ColorKeys({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: ControllerButton(
            color: Colors.red,
            onPressed: () async {
            },
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: ControllerButton(
            color: Colors.green,
            onPressed: () async {
            },
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: ControllerButton(
            color: Colors.yellow,
            onPressed: () async {
            },
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: ControllerButton(
            color: Colors.blue,
            onPressed: () async {
            },
          ),
        ),
      ],
    );
  }
}
