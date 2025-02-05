import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class DirectionKeys extends StatefulWidget {
  final ip;
  final tvkey;
  // final SonyTVService service;
  DirectionKeys({
    super.key,
    required this.ip,
    required this.tvkey,
    // required this.service,
  });

  @override
  State<DirectionKeys> createState() => _DirectionKeysState();
}

class _DirectionKeysState extends State<DirectionKeys> {
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
        {"volume": volume, "target": target}
      ],
      "id": 1,
      "version": "1.0"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Volume command sent successfully: ${response.body}");
    } else {
      print(
          "Failed to send volume command: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> sendOKButtonCommand() async {
    final url = Uri.parse('http://${widget.ip}/sony/ircc');
    final Map<String, String> headers = {
      'Content-Type': 'text/xml',
      'X-Auth-PSK': widget.tvkey,
    };
    final body = '''
    <?xml version="1.0"?>
    <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" 
                s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
        <s:Body>
            <u:IRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1">
                <IRCCCode>AAAAQAAAAEAAABlAw==</IRCCCode>
            </u:IRCC>
        </s:Body>
    </s:Envelope>
  ''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("OK button command sent successfully!");
    } else {
      print("Failed to send OK button command: ${response.body}");
    }
  }

  Future<void> sendNavigationCommand(String irccCode) async {
    final url = Uri.parse('http://${widget.ip}/sony/ircc');
    final Map<String, String> headers = {
      'Content-Type': 'text/xml',
      'X-Auth-PSK': widget.tvkey,
    };
    final body = '''
    <?xml version="1.0"?>
    <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" 
                s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
        <s:Body>
            <u:IRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1">
                <IRCCCode>$irccCode</IRCCCode>
            </u:IRCC>
        </s:Body>
    </s:Envelope>
  ''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Navigation command sent successfully!");
    } else {
      print("Failed to send navigation command: ${response.body}");
    }
  }

// // Example Usage
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
                  onPressed: () async {
                    await sendNavigationCommand("AAAAAQAAAAEAAAAlAw==");
                  })),
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
                  onPressed: () async {
                    await sendNavigationCommand("AAAAAgAAAJcAAAAjAw==");
                  })),
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
                sendOKButtonCommand();
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.6),
            child: ControllerButton(
              borderRadius: 10,
              child: const Icon(Icons.arrow_drop_up,
                  size: 30, color: Colors.white),
              onPressed: () async {
                await sendNavigationCommand(
                    "	AAAAAQAAAAEAAAB0Aw=="); // Up Arrow
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.6),
            child: ControllerButton(
              borderRadius: 10,
              child: const Icon(Icons.arrow_drop_down,
                  size: 30, color: Colors.white),
              onPressed: () async {
                await sendNavigationCommand(
                    "	AAAAAQAAAAEAAAB1Aw=="); // Down Arrow
              },
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
