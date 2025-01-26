import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remote/models/samsung_tv.dart';
import 'package:remote/models/sony_tv.dart';
import 'components/components.dart';

class RemoteScreen extends StatefulWidget {
  final SonyTVService service;
  const RemoteScreen({super.key, required this.service});

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  // SmartTV tv = SmartTV();
  bool _keypadShown = false;

  @override
  void initState() {
    super.initState();
  }

  void toggleKeypad() {
    setState(() {
      _keypadShown = !_keypadShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryKeys(
              service: widget.service,
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
              child: DirectionKeys(service: widget.service,),
            ),
            const SizedBox(height: 50),
            ColorKeys(),
            const SizedBox(height: 50),
            VolumeChannelControls(
              tv: widget.service,
            ),
            const SizedBox(height: 50),
            MediaControls(),
          ],
        ),
      ),
    );
  }
}
