import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeatsioPage extends StatefulWidget {
  SeatsioPage({
    Key? key,
    required this.publicKey,
    required this.eventKey,
    this.holdToken,
  }) : super(key: key);
  final String publicKey;
  final String eventKey;
  final String? holdToken;

  @override
  _SeatsioPageState createState() => _SeatsioPageState();
}

class _SeatsioPageState extends State<SeatsioPage> {
  WebViewController? _seatsioController;
  String? objectLabel;

  void _loadSeatsio() {
    final chartConfig = SeatingChartConfig.init().rebuild((b) => b
      ..workspaceKey = widget.publicKey
      ..eventKey = widget.eventKey
      ..holdToken = widget.holdToken
      ..session = "none");

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
        title: Text("Seat Page"),
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
