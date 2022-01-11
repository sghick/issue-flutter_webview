import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_web_example/web_page.dart';
import 'package:flutter_native_web_example/web_page2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Navigator Demon',
      home: new MyHomePage(
        title: '第一个页面',
      ),
    );
  }
}

/*
这是首页面，包含一个IOS风格的按钮，点击该按钮可以导航到第二个页面
 */
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 20),
            CupertinoButton(
                color: Colors.blue,
                child: new Text('web page1'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => WebPage(),
                    ),
                  );
                }),
            Container(height: 20),
            CupertinoButton(
                color: Colors.blue,
                child: new Text('web page2'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => WebPage2(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

/*
这是第二个页面，包含一个返回的按钮
 */
class SecondePage extends StatelessWidget {
  const SecondePage({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        //这是一个IOS风格材质的按钮，需要导入cupertino文件才能引用
        child: new CupertinoButton(
            color: Colors.blue,
            child: new Text('返回第一个页面'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
