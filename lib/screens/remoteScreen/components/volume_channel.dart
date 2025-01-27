import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/models/samsung_tv.dart';
import 'package:remote/models/sony_tv.dart';
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class VolumeChannelControls extends StatefulWidget {
  final ip;
  final tvkey;
  // final SonyTVService tv;
  const VolumeChannelControls({
    super.key,
    this.ip,
    this.tvkey,
    // required this.tv,
  });

  @override
  State<VolumeChannelControls> createState() => _VolumeChannelControlsState();
}

class _VolumeChannelControlsState extends State<VolumeChannelControls> {
  Future<void> setAudioMute(bool status) async {
    final url = Uri.parse('http://${widget.ip}/sony/audio');
    final Map<String,String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': widget.tvkey,
    };
    final body = jsonEncode({
      "method": "setAudioMute",
      "params": [
        {
          "status": status,
        }
      ],
      "id": 1,
      "version": "1.0"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Mute command sent successfully: ${response.body}");
    } else {
      print("Failed to send mute command: ${response.body}");
    }
  }
Future<void> setAudioVolume(String volume,
      {String target = 'speaker'}) async {
    final url = Uri.parse('http://${widget.ip}/sony/audio');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': widget.key.toString(),
    };
    final body = jsonEncode({
      "method": "setAudioVolume",
      "params": [
        {
          "volume": volume,
          "target": target,
        }
      ],
      "id": 1,
      "version": "1.0"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Volume command sent successfully: ${response.body}");
    } else {
      print("Failed to send volume command: ${response.body}");
    }
  }

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
                setAudioVolume("+1", target: "speaker");
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
                    setAudioMute(false);
                  else
                    setAudioMute(true);
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
                  setAudioVolume("-1", target: "speaker");

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
