import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteScreen extends StatefulWidget {
  final String ip;
  final String tvkey;

  const RemoteScreen({
    Key? key,
    required this.ip,
    required this.tvkey,
  }) : super(key: key);

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  Future<void> setAudioVolume(String volume,
      {String target = 'speaker'}) async {
    final url = Uri.parse('http://${widget.ip}/sony/audio');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': widget.tvkey,
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

  Future<void> setAudioMute(bool status) async {
    final url = Uri.parse('http://${widget.ip}/sony/audio');
    final Map<String, String> headers = {
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

  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2e2e2e),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // UI components for volume and mute controls
            IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () => setAudioVolume("+1"),
            ),
            IconButton(
              icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
              onPressed: () async {
                await setAudioMute(!isMuted);
                setState(() {
                  isMuted = !isMuted;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.volume_down),
              onPressed: () => setAudioVolume("-1"),
            ),
          ],
        ),
      ),
    );
  }
}
