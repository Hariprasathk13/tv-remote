import 'package:flutter/material.dart';
import 'package:remote/models/sony_tv.dart';

class PrimaryKeys extends StatelessWidget {
  final SonyTVService service;
  final void Function() toggleKeypad;
  final bool keypadShown;
  const PrimaryKeys(
      {super.key,
      required this.toggleKeypad,
      required this.keypadShown,
      required this.service});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.cast, size: 30, color: Colors.cyan),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.dialpad,
              size: 30, color: keypadShown ? Colors.blue : Colors.white70),
          onPressed: toggleKeypad,
        ),
        IconButton(
          icon:
              const Icon(Icons.power_settings_new, color: Colors.red, size: 30),
          onPressed: () async {
            service.sendCommand("setPowerStatus", {"status": true});
            // sendCommand(});
            // await tv.sendKey(KeyCodes.KEY_POWER);
          },
        ),
      ],
    );
  }
}
