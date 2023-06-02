import "package:DC_Robot/screans/audio_call.dart";
import "package:DC_Robot/screans/video_call.dart";
import "package:DC_Robot/var.dart";
import "package:flutter/material.dart";
import "header_screen.dart";

class CallScrean extends StatefulWidget {
  const CallScrean({Key? key}) : super(key: key);

  @override
  CallScreanState createState() => CallScreanState();
}

class CallScreanState extends State<CallScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "بدء مكالمة"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child: Image.asset(
              'images/dc.jpg',
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "نعمه الله مصطفى",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "+20 128 283 3922",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoCall()));
                  },
                  icon: const Icon(
                    Icons.video_call,
                    size: 44,
                  ),
                  color: globals.r,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AudioCall()));
                  },
                  icon: const Icon(
                    Icons.phone,
                    size: 35,
                  ),
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
