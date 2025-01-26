import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/models/samsung_tv.dart';
import 'package:remote/models/sony_tv.dart';
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class VolumeChannelControls extends StatefulWidget {
  final SonyTVService tv;
  const VolumeChannelControls({
    super.key,
    required this.tv,
  });

  @override
  State<VolumeChannelControls> createState() => _VolumeChannelControlsState();
}

class _VolumeChannelControlsState extends State<VolumeChannelControls> {
  bool ismutted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ControllerButton(
          borderRadius: 15,
          child: Column(
            children: [
              MaterialButton(
                height: 50,
                minWidth: 50,
                shape: const CircleBorder(),
                child: const Icon(Icons.keyboard_arrow_up,
                    size: 20, color: Colors.white54),
                onPressed: () async {
                  widget.tv.setAudioVolume("+1", target: "speaker");
                },
              ),
              MaterialButton(
                height: 50,
                minWidth: 80,
                shape: const CircleBorder(),
                child: const Icon(Icons.volume_off,
                    size: 20, color: Colors.white70),
                onPressed: () async {
                  if (ismutted)
                    widget.tv.setAudioMute(false);
                  else
                    widget.tv.setAudioMute(true);
                  setState(() {
                    ismutted = !ismutted;
                  });
                },
              ),
              MaterialButton(
                height: 50,
                minWidth: 50,
                shape: const CircleBorder(),
                child: const Icon(Icons.keyboard_arrow_down,
                    size: 20, color: Colors.white54),
                onPressed: () async {
                  widget.tv.setAudioVolume("-1", target: "speaker");

                  // await tv.sendKey(KeyCodes.KEY_VOLDOWN);
                },
              ),
            ],
          ),
        ),
        Column(
          children: [
            ControllerButton(
              borderRadius: 15,
              child: Text(
                "menu".toUpperCase(),
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              onPressed: () async {
                // await widget.tv.sendKey(KeyCodes.KEY_HOME);
              },
            ),
            const SizedBox(height: 35),
            ControllerButton(
              borderRadius: 15,
              child: Text(
                "more".toUpperCase(),
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              onPressed: () async {
                // await widget.tv.sendKey(KeyCodes.KEY_MORE);
              },
            ),
          ],
        ),
        ControllerButton(
          borderRadius: 15,
          child: Column(
            children: [
              MaterialButton(
                height: 40,
                minWidth: 40,
                shape: const CircleBorder(),
                child: const Icon(Icons.keyboard_arrow_up,
                    size: 20, color: Colors.white54),
                onPressed: () async {
                  // await widget.tv.sendKey(KeyCodes.KEY_CHUP);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('P',
                    style: TextStyle(fontSize: 15, color: Colors.white70)),
              ),
              MaterialButton(
                height: 50,
                minWidth: 80,
                shape: const CircleBorder(),
                child: const Icon(Icons.keyboard_arrow_down,
                    size: 20, color: Colors.white54),
                onPressed: () async {
                  // await widget.tv.sendKey(KeyCodes.KEY_CHDOWN);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
