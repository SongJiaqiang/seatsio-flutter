import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'seating_config_change.dart';
import 'seatsio_category.dart';

typedef CategoryListCallback = void Function(List<SeatsioCategory>?);

class SeatingChart {
  SeatingChart(this.webviewController);

  final WebViewController webviewController;

  void rerender() {
    // inject javascript to SeatsioWebView
  }

  void selectObject(List<String> objects) {
    // inject javascript to SeatsioWebView
  }

  void deselectObject(List<String> objects) {
    // inject javascript to SeatsioWebView
  }

  // todo(sjq): 待优化
  void changeConfig(SeatingConfigChange configChange) {
    // print("[Seatsio]-> changeConfig ");

    final Map configMap = configChange.toMap();
    String configJson = jsonEncode(configMap);
    configJson = configJson.replaceAll("'", "\\\'");

    // print("[Seatsio]-> changeConfig configJson1: $configJson");
    // configJson = '{"objectColor":"(object, dfValue, extraConfig) => {if(extraConfig[object.label] == \\\'true\\\') {return \\\'#00FF00\\\'} else {return dfValue}}", "maxSelectedObjects":2, "extraConfig":{"W-25":"true", "W-26":"true"}}';
    // print("[Seatsio]-> changeConfig configJson2: $configJson");

    final String jsString = "changeConfig('$configJson', postMessageToFlutter)";
    debugPrint("[Seatsio]-> changeConfig jsString: $jsString");
    webviewController.evaluateJavascript(jsString);
  }

  void listCategories(CategoryListCallback callback) {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";
    webviewController.evaluateJavascript(jsString);

    callback([]);
  }

  void requestListCategories() {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";
    webviewController.evaluateJavascript(jsString);
  }
}
