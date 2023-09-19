import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../var.dart';
import '../screans/header_screen.dart';

class EcgSensorScreen extends StatefulWidget {
  final String url;

  const EcgSensorScreen({Key? key, required this.url}) : super(key: key);

  @override
  EcgSensorScreenState createState() => EcgSensorScreenState();
}

class EcgSensorScreenState extends State<EcgSensorScreen> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
      appBar: header(context, "مؤشر حيوي"),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.url),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                userAgent:
                    'https://stem.ubidots.com/app/dashboards/public/widget/KInJmmmX6UGM1D0B-ce4YYHJhG_RfhD8UexpjsePaI0?embed=true',
              ),
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
          ),
        ),
      ),
    );
  }
}
