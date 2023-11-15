import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/seating_chart_config.dart';
import '../util/seatsio_js_bridge.dart';
import '../assets/seatsio_html.dart';

typedef void SeatsioWebViewCreatedCallback(SeatsioWebViewController controller);

class SeatsioWebViewController {
  SeatsioWebViewController(this.webViewController);

  final WebViewController webViewController;

  SeatingChartConfig? _chartConfig;

  void runReload(SeatingChartConfig? newChartConfig) {
    if (newChartConfig != null) {
      _chartConfig = newChartConfig;
    }

    if (_chartConfig != null) {
      final url = _generateHtmlContent(_chartConfig!);
      webViewController.loadRequest(Uri.parse(url));
    } else {
      debugPrint("[Seatsio]-> Not found seatsio chart config info.");
    }
  }

  void reloadChart(String token, String session) {
    if (_chartConfig != null) {
      final newChartInfo = _chartConfig!.rebuild((b) => b
        ..holdToken = token
        ..session = session);
      final url = _generateHtmlContent(newChartInfo);
      webViewController.loadRequest(Uri.parse(url));
    } else {
      debugPrint("[Seatsio]-> Not found seatsio chart config info.");
    }
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
    final htmlString =
        seatsioHTML.replaceFirst("%region%", chartConfig.region ?? "eu").replaceFirst("%configAsJs%", chartConfigJson);

    debugPrint("[Seatsio]-> _generateHtmlContent: $htmlString");

    // Encode HTML string with utf8
    final url = Uri.dataFromString(
      htmlString,
      mimeType: "text/html",
      encoding: utf8,
    );

    return url.toString();
  }

  Future<void> evaluateJavascript(String javascriptString) => webViewController.runJavaScript(javascriptString);
}
