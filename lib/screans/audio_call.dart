// ignore_for_file: unused_field

import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'header_screen.dart';

const appId2 = "aa81e90620f14c9782a55987a17bebdb";
const token2 =
    "007eJxTYNgQJv7hrETPziLTtZsP667McIlzunFUq9V09YV/K+IMr61UYEhMtDBMtTQwMzJIMzRJtjS3MEo0NbW0ME80NE9KTUpJ2qaZktIQyMiQMNuLkZEBAkF8LgaXIIWg/KT8EgUjBgYAWxQhhQ==";
const channel2 = "DR Robot 2";

class AudioCall extends StatefulWidget {
  const AudioCall({super.key});

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  int? _remoteUid2;
  bool _localUserJoined2 = false;
  late RtcEngine _engine2;

  @override
  void initState() {
    super.initState();
    initAgora2();
  }

  Future<void> initAgora2() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine2 = createAgoraRtcEngine();
    await _engine2.initialize(const RtcEngineContext(
      appId: appId2,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine2.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection2, int elapsed2) {
          debugPrint("local user ${connection2.localUid} joined");
          setState(() {
            _localUserJoined2 = true;
          });
        },
        onUserJoined:
            (RtcConnection connection2, int remoteUid2, int elapsed2) {
          debugPrint("remote user $remoteUid2 joined");
          setState(() {
            _remoteUid2 = remoteUid2;
          });
        },
        onUserOffline: (RtcConnection connection2, int remoteUid2,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid2 left channel");
          setState(() {
            _remoteUid2 = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection2, String token2) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection2.toJson()}, token: $token2');
        },
      ),
    );
    await _engine2.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine2.enableVideo();
    await _engine2.startPreview();

    /* await _engine2.joinChannel(
      token: token2,
      channelId: channel2,
      uid: 0,
      options: const ChannelMediaOptions(),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 0, 0, 0),
      appBar: header(context, "مكالمه صوتيه"),
      body: Stack(
        children: [
          Center(
            child: _remoteAudio(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0, right: 25),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        icon: const Icon(
                          Icons.call_end,
                          size: 44,
                          color: Colors.redAccent,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteAudio() {
    if (_remoteUid2 != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine2,
          canvas: VideoCanvas(uid: _remoteUid2),
          connection: const RtcConnection(channelId: channel2),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.996),
        ),
        textAlign: TextAlign.center,
      );
    }
  }
}
