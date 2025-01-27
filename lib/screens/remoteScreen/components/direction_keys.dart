import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class DirectionKeys extends StatelessWidget {
  final ip;
  final tvkey;
  // final SonyTVService service;
  DirectionKeys({
    super.key,
    this.ip,
    this.tvkey,
    // required this.service,
  });
  Future<void> setAudioVolume(String volume,
      {String target = 'speaker'}) async {
    final url = Uri.parse('http://$ip/sony/audio');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': tvkey,
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ControllerButton(
              onPressed: () {},
              child: const Text(
                "SMART",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: ControllerButton(
                  child: const Text(
                    "INPUT",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54),
                  ),
                  onPressed: () {})),
          Align(
              alignment: Alignment.bottomLeft,
              child: ControllerButton(
                  child: const Text(
                    "BACK",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54),
                  ),
                  onPressed: () {})),
          Align(
            alignment: Alignment.bottomRight,
            child: ControllerButton(
              child: const Text(
                "EXIT",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              onPressed: () {
                exit(0);
                // SystemNavigator.
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ControllerButton(
              child: const Text(
                "OK",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                ;
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.6),
            child: ControllerButton(
              borderRadius: 10,
              child: const Icon(Icons.arrow_drop_up,
                  size: 30, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.6),
            child: ControllerButton(
              borderRadius: 10,
              child: const Icon(Icons.arrow_drop_down,
                  size: 30, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: const Alignment(0.6, 0),
            child: ControllerButton(
              borderRadius: 10,
              child:
                  const Icon(Icons.arrow_right, size: 30, color: Colors.white),
              onPressed: () {
                setAudioVolume("+1", target: "speaker");
              },
            ),
          ),
          Align(
            alignment: const Alignment(-0.7, 0),
            child: ControllerButton(
              borderRadius: 10,
              child:
                  const Icon(Icons.arrow_left, size: 30, color: Colors.white),
              onPressed: () {
                setAudioVolume("-1", target: "speaker");
              },
            ),
          ),
        ],
      ),
    );
  }
}
