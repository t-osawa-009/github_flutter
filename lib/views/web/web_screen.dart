import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  final String url;
  WebScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Webテスト'),
        ), 
        body: WebView(
          initialUrl: url,
          // JavaScriptを有効化させます
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}