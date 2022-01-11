import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestPage2State();
  }
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页面2'),
      ),
      body: Container(
        color: Colors.brown,
      ),
    );
  }
}
