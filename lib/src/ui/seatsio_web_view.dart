import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/seating_chart.dart';
import '../models/seatsio_category.dart';
import '../models/seating_chart_config.dart';
import '../models/seatsio_object.dart';

class SeatsioWebView extends StatefulWidget {
  const SeatsioWebView({
    Key? key,
    required this.enableRenderChart,
    this.seatsioController,
    this.onObjectClicked,
    this.onChartRendered,
    this.onWebViewCreated,
    this.onCategoryListCallback,
  }) : super(key: key);

  final WebViewCreatedCallback? onWebViewCreated;
  final SeatingChartCallback? onChartRendered;
  final SeatsioObjectCallback? onObjectClicked;
  final SeatsioCategoryListCallback? onCategoryListCallback;
  final bool enableRenderChart;
  final SeatsioController? seatsioController;

  @override
  State<StatefulWidget> createState() => _SeatsioWebViewState();
}

class _SeatsioWebViewState extends State<SeatsioWebView> {
  late WebViewController webviewController;

  @override
  void initState() {
    // Android指定WebView
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final webview = _buildWebView();

    return webview;
  }

  Widget _buildWebView() {
    return WebView(
      initialUrl: "",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        webviewController = controller;
        widget.onWebViewCreated?.call(controller);
      },
      javascriptChannels: <JavascriptChannel>{
        _onObjectClickedChannel(),
        _onChartRenderedChannel(),
        _onFlutterJsBridgeChannel(),
      },
    );
  }

  JavascriptChannel _onObjectClickedChannel() {
    return JavascriptChannel(
      name: "onObjectClicked",
      onMessageReceived: (JavascriptMessage message) {
        debugPrint(
            "[Seatsio]-> onObjectClicked callback message: ${message.message}");

        final object = SeatsioObject.fromJson(message.message);
        if (object != null) {
          widget.onObjectClicked?.call(object);
        }
      },
    );
  }

  JavascriptChannel _onChartRenderedChannel() {
    return JavascriptChannel(
      name: "onChartRendered",
      onMessageReceived: (JavascriptMessage message) {
        debugPrint(
            "[Seatsio]-> onChartRendered callback message: ${message.message}");

        final seatingChart = SeatingChart(webviewController);
        widget.onChartRendered?.call(seatingChart);
      },
    );
  }

  JavascriptChannel _onFlutterJsBridgeChannel() {
    return JavascriptChannel(
      name: "FlutterJsBridge",
      onMessageReceived: (JavascriptMessage message) {
        debugPrint(
            "[Seatsio]-> _onFlutterJsBridgeChannel callback message: ${message.message}");

        final cagetories = SeatsioCategory.arrayFromJson(message.message);
        if (cagetories != null && cagetories.isNotEmpty) {
          widget.onCategoryListCallback?.call(cagetories);
        }
      },
    );
  }
}

class SeatsioController {
  SeatsioController(this.widget);

  final Widget widget;

  Future<void> reload() async {}

  Future<void> selectObject(SeatsioObject object) async {}

  Future<void> deselectObject(SeatsioObject object) async {}
}
