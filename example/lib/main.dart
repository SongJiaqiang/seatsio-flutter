import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';
import 'package:built_collection/built_collection.dart';

final String TestWorkspaceKey = "afcfc4d1-d11d-476d-9956-e2c4f6c5e769";
final String TestEventKey =
    "20210807-1000-eee8070a-cfd3-4cdd-9ab0-64ae38e84900";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartConfig = SeatingChartConfig.init().rebuild((b) => b
      ..publicKey = TestWorkspaceKey
      ..events = [TestEventKey].toBuiltList().toBuilder()
      ..holdToken = null
      ..session = "none");
    final seatsioView = SeatsioWebView(
      chartConfig: chartConfig,
      enableRenderChart: false,
      onWebViewCreated: (controller) {
        print("[seatsio]->[example]-> onWebViewCreated");
        final url = _generateHtmlContent(chartConfig);
        controller.loadUrl(url);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: seatsioView,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// 生成seatsio webview html
  String _generateHtmlContent(SeatingChartConfig chartConfig) {
    final callbacks = SeatsioJsBridge.buildCallbacksConfiguration(chartConfig);

    // 将所有参数转成Map字段
    final chartConfigMap = chartConfig.toMap();

    if (chartConfig.holdToken != null) {
      chartConfigMap["holdToken"] = chartConfig.holdToken!;
    }

    // 将所有参数转成标准json字符串，不能用逗号取代冒号！
    String chartConfigJson = jsonEncode(chartConfigMap);
    // 使用单引号包裹json字符串，保证注入JavaScript中能被识别
    chartConfigJson = '$chartConfigJson';

    // 将所有callback参数转成字符串
    chartConfigJson = chartConfigJson.substring(0, chartConfigJson.length - 1);
    callbacks.forEach((e) {
      chartConfigJson = "$chartConfigJson, $e";
    });

    chartConfigJson = "$chartConfigJson}";
    final htmlString = seatsioHTML
        .replaceFirst("%region%", "eu")
        .replaceFirst("%configAsJs%", chartConfigJson);

    debugPrint("[Event]-> _generateHtmlContent: $htmlString");

    final url = Uri.dataFromString(
      htmlString,
      mimeType: "text/html",
      encoding: utf8,
    );

    return url.toString();
  }
}
