# seatsio

## Description
Seatsio SDK for Flutter.
</br>
![seatsio-flutter-demo](https://github.com/SongJiaqiang/seatsio-flutter/raw/main/seatsio-flutter-demo.gif)

## Getting Started

First, add `seatsio` as a dependency in your `pubspec.yaml` file.
``` yaml
dependencies:
  flutter:
    sdk: flutter

  seatsio: ^0.0.2
```

Then, import `seatsio` package to your dart file.
``` dart
import 'package:seatsio/seatsio.dart';
```

Finally, config your seatsio chart with some parameters.
``` dart
class _MyHomePageState extends State<MyHomePage> {
  WebViewController? _seatsioController;
  String? objectLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 456,
              child: _buildSeatsioView(),
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
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildSeatsioView() {
    return SeatsioWebView(
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
  }

  void _clickSeat(SeatsioObject object) {
    setState(() {
      objectLabel = object.label;
    });
  }

  void _loadSeatsio() {
    final chartConfig = SeatingChartConfig.init().rebuild((b) => b
      ..workspaceKey = YourWorkspaceKey
      ..eventKey = YourEventKey
      ..session = "start");

    final url = _generateHtmlContent(chartConfig);
    _seatsioController?.loadUrl(url);
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

