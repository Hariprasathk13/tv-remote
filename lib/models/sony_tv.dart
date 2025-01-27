// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SonyTVService {
//   static String tvIP = "";
//   static String apiKey = "";

//   SonyTVService();

//   static Future<void> sendCommand(
//       String method, Map<String, dynamic> params) async {
//     final url = Uri.parse('http://$tvIP/sony/system');
//     final headers = {
//       'Content-Type': 'application/json',
//       'X-Auth-PSK': apiKey,
//     };
//     final body = jsonEncode({
//       "method": method,
//       "params": [params],
//       "id": 1,
//       "version": "1.0"
//     });

//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print("Command sent successfully: ${response.body}");
//     } else {
//       print("Failed to send command: ${response.body}");
//     }
//   }

//   static Future<void> setAudioVolume(String volume,
//       {String target = 'speaker'}) async {
//     print(apiKey);
//     print(tvIP);
//     final url = Uri.parse('http://$tvIP/sony/audio');
//     final headers = {
//       'Content-Type': 'application/json',
//       'X-Auth-PSK': apiKey,
//     };
//     final body = jsonEncode({
//       "method": "setAudioVolume",
//       "params": [
//         {
//           "volume": volume,
//           "target": target,
//         }
//       ],
//       "id": 1,
//       "version": "1.0"
//     });

//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print("Volume command sent successfully: ${response.body}");
//     } else {
//       print("Failed to send volume command: ${response.body}");
//     }
//   }

//   static Future<void> setAudioMute(bool status) async {
//     final url = Uri.parse('http://$tvIP/sony/audio');
//     final headers = {
//       'Content-Type': 'application/json',
//       'X-Auth-PSK': apiKey,
//     };
//     final body = jsonEncode({
//       "method": "setAudioMute",
//       "params": [
//         {
//           "status": status,
//         }
//       ],
//       "id": 1,
//       "version": "1.0"
//     });

//     final response = await http.post(url, headers: headers, body: body);

//     if (response.statusCode == 200) {
//       print("Mute command sent successfully: ${response.body}");
//     } else {
//       print("Failed to send mute command: ${response.body}");
//     }
//   }

// }
