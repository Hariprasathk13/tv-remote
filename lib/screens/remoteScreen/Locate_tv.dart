import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote/models/sony_tv.dart';
import 'package:remote/screens/remoteScreen/remote_screen.dart';

// class LocateTv extends StatefulWidget {
//   const LocateTv({super.key});

//   @override
//   State<LocateTv> createState() => _LocateTvState();
// }

// class _LocateTvState extends State<LocateTv> {
//   final TextEditingController ipController = TextEditingController();
//   final TextEditingController pskController = TextEditingController();

//   void connectToTV() {
//     if (ipController.text.isNotEmpty && pskController.text.isNotEmpty) {
//       // SonyTVService.tvIP = ipController.text.toString().trim();
//       // SonyTVService.apiKey = pskController.text.toString().trim();
//       // setState(() {
//       //  SonyTVService tvService = SonyTVService(
//       //       tvIP: ipController.text,
//       //       apiKey: pskController.text,
//       //     );
//       // });
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => RemoteScreen()));

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.black87,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.4),
//                   blurRadius: 10,
//                   spreadRadius: 3,
//                 ),
//               ],
//             ),
//             child: Text(
//               "Connected to TV at ${ipController.text}",
//               style: GoogleFonts.roboto(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           behavior: SnackBarBehavior.floating,
//           margin: EdgeInsets.all(20),
//           elevation: 10,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.transparent,
//           content: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.black87,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.4),
//                   blurRadius: 10,
//                   spreadRadius: 3,
//                 ),
//               ],
//             ),
//             child: Text(
//               "Please enter both IP and Pre-Shared Key",
//               style: GoogleFonts.roboto(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           behavior: SnackBarBehavior.floating,
//           elevation: 10,
//         ),
//       );
//     }
//   }

//   // void sendCommand(String method, Map<String, dynamic> params) {
//   //   if (tvService != null) {
//   //     tvService!.sendCommand(method, params);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text("Please connect to a TV first")));
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // / Dark background
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF0A0E1F), Color(0xFF1C2B3B)], // Darker gradient
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 160,
//                 width: 160,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: const RadialGradient(
//                     colors: [
//                       Color(0xFF1D3C58), // A dark blue with a subtle teal tone
//                       Color(0xFF4E8D99) // Lighter teal with a silver touch
//                     ],
//                     stops: [
//                       0.3,
//                       1.0
//                     ], // Adjusting the spread of the colors for a smoother blend
//                     center: Alignment.center,
//                     radius: 0.8,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.7),
//                       blurRadius: 25,
//                       spreadRadius: 10,
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.tv_rounded,
//                   size: 90,
//                   color:
//                       Colors.white, // White icon color for contrast and clarity
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Title with wave-style font
//               Text(
//                 "Connect to TV",
//                 style: GoogleFonts.abrilFatface(
//                   fontSize: 50,
//                   color: Colors.white,
//                   letterSpacing: 2,
//                 ),
//               ),
//               SizedBox(height: 50),

//               // IP Address Input Field with rounded corners and soft shadows
//               TextField(
//                 controller: ipController,
//                 decoration: InputDecoration(
//                   labelText: "Enter TV IP Address",
//                   labelStyle: GoogleFonts.roboto(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.white70, width: 1),
//                   ),
//                   filled: true,
//                   fillColor: Color(0xFF2C3E50),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // PSK Input Field with rounded corners and subtle shadows
//               TextField(
//                 controller: pskController,
//                 decoration: InputDecoration(
//                   labelText: "Enter Pre-Shared Key (PSK)",
//                   labelStyle: GoogleFonts.roboto(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.white70, width: 1),
//                   ),
//                   filled: true,
//                   fillColor: Color(0xFF2C3E50),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 30),

//               // Connect Button with elegant gradient
//               ElevatedButton(
//                 onPressed: connectToTV,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   child: Text(
//                     "Connect to TV",
//                     style: GoogleFonts.roboto(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   padding: EdgeInsets.all(0),
//                 ).copyWith(
//                   shadowColor:
//                       WidgetStateProperty.all(Colors.black.withOpacity(0.6)),
//                   elevation: WidgetStateProperty.all(10),
//                 ),
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }

// class SonyTVControlApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SonyTVControlPage(),
//     );
//   }
// }

// class SonyTVControlPage extends StatefulWidget {
//   @override
//   _SonyTVControlPageState createState() => _SonyTVControlPageState();
// }

// class _SonyTVControlPageState extends State<SonyTVControlPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sony TV Remote")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [

//             if (tvService != null)
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () =>
//                           sendCommand("setPowerStatus", {"status": true}),
//                       child: Text("Power ON"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () =>
//                           sendCommand("setPowerStatus", {"status": false}),
//                       child: Text("Power OFF"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () =>
//                           tvService?.setAudioVolume("+1", target: "speaker"),
//                       child: Text("Volume Up"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () =>
//                           tvService?.setAudioVolume("-1", target: "speaker"),
//                       child: Text("Volume Down"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => tvService?.setAudioMute(true),
//                       child: Text("Mute"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => tvService?.setAudioMute(false),
//                       child: Text("Unmute"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => sendCommand(
//                           "setPlayContent", {"uri": "extInput:hdmi?port=1"}),
//                       child: Text("Switch to HDMI 1"),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

  Widget build(BuildContext context) {
    return Scaffold(
      // / Dark background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0E1F), Color(0xFF1C2B3B)], // Darker gradient
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
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF1D3C58), // A dark blue with a subtle teal tone
                      Color(0xFF4E8D99) // Lighter teal with a silver touch
                    ],
                    stops: [
                      0.3,
                      1.0
                    ], // Adjusting the spread of the colors for a smoother blend
                    center: Alignment.center,
                    radius: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 25,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.tv_rounded,
                  size: 90,
                  color:
                      Colors.white, // White icon color for contrast and clarity
                ),
              ),
              const SizedBox(height: 40),

              // Title with wave-style font
              Text(
                "Connect to TV",
                style: GoogleFonts.abrilFatface(
                  fontSize: 50,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 50),

              // IP Address Input Field with rounded corners and soft shadows
              TextField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: "Enter TV IP Address",
                  labelStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white70, width: 1),
                  ),
                  filled: true,
                  fillColor: Color(0xFF2C3E50),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),

              // PSK Input Field with rounded corners and subtle shadows
              TextField(
                controller: pskController,
                decoration: InputDecoration(
                  labelText: "Enter Pre-Shared Key (PSK)",
                  labelStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white70, width: 1),
                  ),
                  filled: true,
                  fillColor: Color(0xFF2C3E50),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),

              // Connect Button with elegant gradient
              ElevatedButton(
                onPressed: connectToTV,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    "Connect to TV",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(0),
                ).copyWith(
                  shadowColor:
                      WidgetStateProperty.all(Colors.black.withOpacity(0.6)),
                  elevation: WidgetStateProperty.all(10),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
