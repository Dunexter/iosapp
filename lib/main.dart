import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//import 'package:webview_flutter_upload/webview_flutter.dart';
// Chnages have been done by me on location C:\src\flutter\.pub-cache\hosted\pub.dartlang.org\webview_pro_android-2.8.3+2\android\src\main\java\io\flutter\plugins\webviewflutter\WebChromeClientHostApiImpl.java
// on line No :-249 to 275
// earlier this code was like below replace it once the take picture issue is solved
// private static void takePhotoOrOpenGallery() {
//   if (WebViewFlutterPlugin.activity==null||!FileUtil.checkSDcard(WebViewFlutterPlugin.activity)) {
//     return;
//   }
//   String[] selectPicTypeStr = {WebViewFlutterPlugin.activity.getString(R.string.take_photo),
//           WebViewFlutterPlugin.activity.getString(R.string.photo_library)};
//   new AlertDialog.Builder(WebViewFlutterPlugin.activity).

//           .setOnCancelListener(new ReOnCancelListener())
//           .setItems(selectPicTypeStr,
//                   new DialogInterface.OnClickListener() {
//                     @Override
//                     public void onClick(DialogInterface dialog, int which) {
//                       switch (which) {
//                         // 相机拍摄
//                         case 0:
//                           openCamera();
//                           break;
//                         // 手机相册
//                         case 1:
//                           openImageChooserActivity();
//                           break;
//                         default:
//                           break;
//                       }
//                     }
//                   }).show();
// }
void main() {
  runApp(new MaterialApp(
    home: const splash(),
  ));
}

// splash screen start
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [Image.asset('assets/splash_logo.png')],
      ),
      nextScreen: MyApp(),
      splashIconSize: 200,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
// splash screen end

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
          if (url == "https://theemall.ae/seller/login") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          //below start code of app bar i.e only for ios build
          // appBar: AppBar(
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () async {
          //       controller.goBack();
          //     },
          //   ),
          //   title: Text(
          //     "TheEmall-Pay Online Everywhere.",
          //     style: TextStyle(color: Colors.black),
          //   ),
          //   centerTitle: true,
          //   //actions: [
          //   //  IconButton(
          //   //    icon: Icon(Icons.arrow_back),
          //   //    onPressed: () async {
          //   //      controller.goBack();
          //   //    },
          //   //  )
          //   //],
          //   backgroundColor: Colors.white,
          //   iconTheme: IconThemeData(color: Colors.black),
          // ),
          // app bar code ends
          body: Container(
            child: SafeArea(
              child: WebView(
                // userAgent: "mobile", //Add this to resolve issue
                initialUrl: 'https://theemall.ae/seller/login',
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
