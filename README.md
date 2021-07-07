# seatsio

Seatsio SDK for Flutter.

## Getting Started

First, add `seatsio` as a dependency in your `pubspec.yaml` file.
``` yaml
dependencies:
  flutter:
    sdk: flutter

  seatsio: ^0.0.1
```

Then, import `seatsio` package to your dart file.
``` dart
import 'package:seatsio/seatsio.dart';
```

Finally, config your seatsio chart with some parameters.
``` dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';
import 'package:built_collection/built_collection.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String YourWorkspaceKey = "";
const String YourEventKey = "20210807-1000-eee8070a-cfd3-4cdd-9ab0-64ae38e84900";

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
  WebViewController? _seatsioController;
  String? objectLabel;

  void _loadSeatsio() {
    final chartConfig = SeatingChartConfig.init().rebuild((b) => b
      ..publicKey = YourWorkspaceKey
      ..events = [YourEventKey].toBuiltList().toBuilder()
      ..holdToken = null
      ..session = "none"
      );

    final url = _generateHtmlContent(chartConfig);
    _seatsioController?.loadUrl(url);
  }

  void _clickSeat(SeatsioObject object) {
    setState(() {
      objectLabel = object.label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final seatsioView = SeatsioWebView(
      enableRenderChart: false,
      onWebViewCreated: (controller) {
        print("[seatsio]->[example]-> onWebViewCreated");
        _seatsioController = controller;
        _loadSeatsio();
      },
      onObjectClicked: (object) {
        print("[seatsio]->[example]-> onObjectClicked, label: ${object.label}");
        _clickSeat(object);
      },
      onChartRendered: (chart) {
        print("[seatsio]->[example]-> onChartRendered");
        chart.requestListCategories();
      },
      onCategoryListCallback: (categoryList) {
        print(
            "[seatsio]->[example]-> onCategoryListCallback, categoryList: $categoryList");
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 333,
              child: seatsioView,
            ),
            Text(
              objectLabel ?? 'Try to click a seat object',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadSeatsio,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  /// Generate html for seatsio webview
  String _generateHtmlContent(SeatingChartConfig chartConfig) {

    // Convert chart configs to map
    final chartConfigMap = chartConfig.toMap();

    // Convert map to json string
    String chartConfigJson = jsonEncode(chartConfigMap);
    chartConfigJson = '$chartConfigJson';
    // Append callback string to json string.
    final callbacks = SeatsioJsBridge.buildCallbacksConfiguration(chartConfig);
    chartConfigJson = chartConfigJson.substring(0, chartConfigJson.length - 1);
    callbacks.forEach((e) {
      chartConfigJson = "$chartConfigJson, $e";
    });
    chartConfigJson = "$chartConfigJson}";

    // Insert json string of chart config to the seatsio HTML template.
    final htmlString = seatsioHTML
        .replaceFirst("%region%", "eu")
        .replaceFirst("%configAsJs%", chartConfigJson);

    debugPrint("[Event]-> _generateHtmlContent: $htmlString");

    // Encode HTML string with utf8
    final url = Uri.dataFromString(
      htmlString,
      mimeType: "text/html",
      encoding: utf8,
    );

    return url.toString();
  }
}
```

