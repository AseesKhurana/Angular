import 'package:flutter/material.dart';
import 'package:flutter_training/NewsPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

/*void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsPage(),
    );
  }
}*/

class WebViewPage extends StatefulWidget {

  String? url;

  WebViewPage({Key? key, @required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
