
import 'package:flutter/material.dart';
import 'package:flutter_native_web_example/test_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage2 extends StatefulWidget {
  @override
  WebPage2State createState() => WebPage2State();
}

class WebPage2State extends State<WebPage2> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Native WebView as Widget'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TestPage();
              }));
            },
            child: Text('Native WebView2 as Widget\n\n'),
          ),
          Container(
            child: WebView(
              initialUrl: 'https://www.baidu.com',
            ),
            height: 500.0,
            width: 500.0,
          ),
        ],
      ),
    );
  }
}
