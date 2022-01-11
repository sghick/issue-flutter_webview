import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web_example/test_page2.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页面'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: CupertinoButton(
            color: Colors.blue,
            child: Text('下一页'),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => TestPage2(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
