import 'package:flutter/material.dart';

import 'components/components.dart';

class RemoteScreen extends StatefulWidget {
  final ip;
  final tvkey;
  const RemoteScreen({
    super.key, this.ip, this.tvkey,
  });

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  // SmartTV tv = SmartTV();
  bool _keypadShown = false;

  void toggleKeypad() {
    setState(() {
      _keypadShown = !_keypadShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFF2e2e2e),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryKeys(
              // service: widget.service,
              toggleKeypad: toggleKeypad,
              keypadShown: _keypadShown,
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: _keypadShown,
              child: NumPad(),
            ),
            Visibility(
              visible: !_keypadShown,
              child: DirectionKeys(
                  // service: widget.service,
                  ),
            ),
            const SizedBox(height: 50),
            ColorKeys(),
            const SizedBox(height: 50),
            VolumeChannelControls(
                // tv: widget.service,
                ),
            const SizedBox(height: 50),
            MediaControls(),
          ],
        ),
      ),
    ));
  }

}
