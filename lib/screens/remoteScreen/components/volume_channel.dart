import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remote/screens/remoteScreen/components/controller_button.dart';

class VolumeChannelControls extends StatefulWidget {
  final String ip;
  final String tvkey;

  const VolumeChannelControls({
    super.key,
    required this.ip,
    required this.tvkey,
  });

  @override
  State<VolumeChannelControls> createState() => _VolumeChannelControlsState();
}

class _VolumeChannelControlsState extends State<VolumeChannelControls> {
  bool isMuted = false;

  // Method to mute/unmute the TV
  Future<void> setAudioMute(bool status) async {
    final url = Uri.parse('http://${widget.ip}/sony/audio');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Auth-PSK': widget.tvkey,
    };
    final body = jsonEncode({
      "method": "setAudioMute",
      "params": [
        {"status": status}
      ],
      "id": 1,
      "version": "1.0"
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Mute command sent successfully: ${response.body}");
    } else {
      print(
          "Failed to send mute command: ${response.statusCode} - ${response.body}");
    }
  }

  // Method to set the volume of the TV
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

  Future<void> sendMenuCommand() async {
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
                <IRCCCode>AAAAAQAAAAEAAAAUAw==</IRCCCode>
            </u:IRCC>
        </s:Body>
    </s:Envelope>
  ''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Menu button command sent successfully!");
    } else {
      print("Failed to send Menu button command: ${response.body}");
    }
  }

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
                await  setAudioVolume("+1", target: "speaker");
                },
              ),
              MaterialButton(
                height: 50,
                minWidth: 80,
                shape: const CircleBorder(),
                child: const Icon(Icons.volume_off,
                    size: 20, color: Colors.white70),
                onPressed: () async {
                  await setAudioMute(!isMuted);
                  setState(() {
                    isMuted = !isMuted;
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
                await  setAudioVolume("-1", target: "speaker");
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
                sendMenuCommand();
                // Example: Uncomment if you want to send a key command (e.g., "home" key)
                // await tv.sendKey(KeyCodes.KEY_HOME);
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
                // Example: Uncomment if you want to send another key command (e.g., "more" key)
                // await tv.sendKey(KeyCodes.KEY_MORE);
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
                  // Example: Uncomment if you want to send a channel up key command
                  // await tv.sendKey(KeyCodes.KEY_CHUP);
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
                  // Example: Uncomment if you want to send a channel down key command
                  // await tv.sendKey(KeyCodes.KEY_CHDOWN);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
