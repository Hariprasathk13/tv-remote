import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:remote/models/sony_tv.dart';

class PrimaryKeys extends StatelessWidget {
  final ip;
  final tvkey;
  final void Function() toggleKeypad;
  final bool keypadShown;
  const PrimaryKeys({
    super.key,
    required this.toggleKeypad,
    required this.keypadShown,
    required this.ip,
    required this.tvkey,
    // required this.service
  });
  Future<void> sendCommand(String method, Map<String, dynamic> params) async {
    final url = Uri.parse('http://$ip/sony/system');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': tvkey,
    };
    final body = jsonEncode({
      "method": method,
      "params": [params],
      "id": 1,
      "version": "1.0"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Command sent successfully: ${response.body}");
    } else {
      print("Failed to send command: ${response.body}");
    }
  }

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
          icon: Icon(Icons.power_settings_new, color: Colors.red, size: 30),
          onPressed: () async {
            await sendCommand("setPowerStatus", {"status": false});
            // sendCommand(});
            // await tv.sendKey(KeyCodes.KEY_POWER);
          },
        ),
      ],
    );
  }
}
