import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    return MaterialApp(
      title: "Theemall",
      home: WillPopScope(
        onWillPop: () async {
          String? url = await controller.currentUrl();
          if (url == "https://theemall.probsoltechnology.in") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          //below start code of app bar i.e only for ios build
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                controller.goBack();
              },
            ),
            title: Text(
              "Theemall",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            //actions: [
            //  IconButton(
            //    icon: Icon(Icons.arrow_back),
            //    onPressed: () async {
            //      controller.goBack();
            //    },
            //  )
            //],
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          // app bar code ends
          body: Container(
            child: SafeArea(
              child: WebView(
                initialUrl: 'https://theemall.probsoltechnology.in',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController wc) {
                  controller = wc;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
