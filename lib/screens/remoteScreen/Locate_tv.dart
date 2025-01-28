import 'package:flutter/material.dart';
import 'package:remote/screens/remoteScreen/remote_screen.dart';

class LocateTv extends StatefulWidget {
  const LocateTv({super.key});

  @override
  State<LocateTv> createState() => _LocateTvState();
}

class _LocateTvState extends State<LocateTv> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController pskController = TextEditingController();

  void connectToTV() {
    if (ipController.text.isNotEmpty && pskController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RemoteScreen(
            ip: ipController.text,
            tvkey: pskController.text,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Connected to TV at ${ipController.text}"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both IP and Pre-Shared Key")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0E1F), Color(0xFF1C2B3B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Your UI elements go here...

              // Connect Button
              ElevatedButton(
                onPressed: connectToTV,
                child: Text("Connect to TV"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
