import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Abror`s website"),
      ),
      body: WebView(
        initialUrl: "https://mystifying-williams-7708fe.netlify.app/",
        onWebViewCreated: (controller) => _controller.complete(controller),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 20),
          child: ButtonBar(
            children: [
              navigationButton(Icons.chevron_left, () => null),
              navigationButton(Icons.chevron_right, () => null),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function() onPressed) {
    return FutureBuilder(
      future: _controller.future,
      builder: (context, AsyncSnapshot snapshot) {
        return IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        );
      },
    );
  }

  void goForward() async {}

  void goBack() async {}
}
