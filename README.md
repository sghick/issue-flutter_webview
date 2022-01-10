# flutter_native_web

本项目为与大家讨论问题,所以直接引用了以下2个插件,demo为第一个插件的源码改过来的
https://pub.flutter-io.cn/packages/flutter_native_web
https://pub.flutter-io.cn/packages/webview_flutter

Native WebView as a widget in flutter

Inline WebView in flutter using [AndroidView](https://docs.flutter.io/flutter/widgets/AndroidView-class.html) and [UiKitView](https://docs.flutter.io/flutter/widgets/UiKitView-class.html)

# Supported

* Android
* iOS


> Note
> * Keypad is not working (No Support by flutter)
> * Basic example of using in a ListView: https://github.com/peeto/scrollable_flutter_web_view_example

> * onPageStarted, onPageFinished Only works with Android

## Screenshot

<img src="https://github.com/PonnamKarthik/FlutterWebView/raw/master/screenshots/1.png" alt="Screenshot" style="width:150px;"/>


## How to Use

```yaml

dependencies:
  flutter_native_web: "^1.0.2"
  
```

```dart

import 'package:flutter_native_web/flutterwebview.dart';

```
```dart

WebController webController;

FlutterWebView flutterWebView = new FlutterWebView(
  onWebCreated: onWebCreated,
);
```
```dart
 new Container(
    child: flutterWebViewString,
    height: 300.0,
    width: 500.0,
 ),
 ```
 ```dart
 void onWebCreated(webController) {
     this.webController = webController;
     this.webController.loadUrl("https://facebook.com");
     this.webController.onPageStarted.listen((url) =>
         print("Loading $url")
     );
     this.webController.onPageFinished.listen((url) =>
         print("Finished loading $url")
     );
 }
```

## or

 ```dart
 String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';

 void onWebCreated(webController) {
     this.webController = webController;
     this.webController.loadData(html);
     this.webController.onPageStarted.listen((url) =>
         print("Loading $url")
     );
     this.webController.onPageFinished.listen((url) =>
         print("Finished loading $url")
     );
 }
```


### Android

Ensure the following permission is present in your Android Manifest file, located in project `/android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### iOS

Opt-in to the embedded views preview by adding a boolean property to the app's `Info.plist` file
with the key `io.flutter.embedded_views_preview` and the value `YES`.

```plist
	<key>io.flutter.embedded_views_preview</key>
	<string>YES</string>
```



## Coming soon

* JSInterface
* more (suggest)
