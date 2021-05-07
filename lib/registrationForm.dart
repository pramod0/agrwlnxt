import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  InAppWebViewController controller;
  String url =
      'https://docs.google.com/forms/d/e/1FAIpQLSf55iytKUYH7y6k7kLpxpaVIPHwMaZeJA4h3vN3-7ekXoGPOw/viewform?usp=sf_link';
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Agrawal Guide'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container(),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: InAppWebView(
                    initialUrl: url,
                    initialHeaders: {},
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform:
                            InAppWebViewOptions(debuggingEnabled: true)),
                    onWebViewCreated: (webViewController) =>
                        controller = webViewController,
                    onLoadStart: (controller, url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (controller, url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (controller, progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        )
     );
  }
}
