import 'package:flutter/material.dart';

import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_web_example/test_page.dart';
import 'package:flutter_native_web_example/transitions.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => new _WebPageState();
}

class _WebPageState extends State<WebPage> with WidgetsBindingObserver {
  WebController webController;
  bool visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    return Scaffold(
        appBar: new AppBar(
          title: const Text('Native WebView as Widget'),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 0),
                        reverseTransitionDuration: Duration(milliseconds: 0),
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          // return FadeTransition(
                          //   opacity: animation,
                          //   child: TestPage(),
                          // );

                          const Offset topLeft = const Offset(0.0, 0.0);
                          const Offset topRight = const Offset(1.0, 0.0);
                          const Offset bottomLeft = const Offset(0.0, 1.0);

                          Offset startOffset = topRight;
                          Offset endOffset = topLeft;

                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: startOffset,
                              end: endOffset,
                            ).animate(animation),
                            child: TestPage(),
                          );
                        },
                      ),
                    );
                  },
                  child: Text('Native WebView as Widget\n\n')),
              new Container(
                child: flutterWebView,
                height: 300.0,
                width: 500.0,
              ),
            ],
          ),
        ));
  }

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController?.loadUrl("https://www.baidu.com");
    this.webController?.onPageStarted?.listen((url) => print("Loading $url"));
    this
        .webController
        ?.onPageFinished
        ?.listen((url) => print("Finished loading $url"));
  }
}
