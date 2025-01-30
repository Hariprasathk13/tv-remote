import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'controller_button.dart';

class NumPad extends StatefulWidget {
  final ip;
  final tvkey;
  NumPad({
    super.key,
    required this.ip,
    required this.tvkey,
  });

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ControllerButton(
                child: const Text(
                  "1",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "2",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "3",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {
                  ;
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ControllerButton(
                child: const Text(
                  "4",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "5",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "6",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ControllerButton(
                child: const Text(
                  "7",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "8",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
              ControllerButton(
                child: const Text(
                  "9",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ControllerButton(
                child: Text(
                  "Tools".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () {}),
            ControllerButton(
              child: const Text(
                "0",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              onPressed: () {},
            ),
            ControllerButton(
                child: Text(
                  "guide".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                onPressed: () async {
                  await sendNavigationCommand("AAAAAgAAAMQAAABNAw==");
                })
          ])
        ]));
  }
}
