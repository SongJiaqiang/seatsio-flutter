import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/seating_chart.dart';
import '../models/seatsio_category.dart';
import '../models/seating_chart_config.dart';
import '../models/seatsio_object.dart';
import '../util/seatsio_web_view_controller.dart';

class SeatsioWebView extends StatefulWidget {
  const SeatsioWebView({
    Key? key,
    bool enableDebug = false,
    SeatsioWebViewCreatedCallback? onWebViewCreated,
    SeatingChartCallback? onChartRendered,
    SeatsioCategoryListCallback? onCategoryListCallback,
    SeatsioObjectCallback? onObjectClicked,
    SeatsioObjectCallback? onObjectSelected,
    SeatsioObjectCallback? onObjectDeselected,
  })  : this._enableDebug = enableDebug,
        this._onWebViewCreated = onWebViewCreated,
        this._onChartRendered = onChartRendered,
        this._onCategoryListCallback = onCategoryListCallback,
        this._onObjectClicked = onObjectClicked,
        this._onObjectSelected = onObjectSelected,
        this._onObjectDeselected = onObjectDeselected,
        super(key: key);

  final bool _enableDebug;
  final SeatsioWebViewCreatedCallback? _onWebViewCreated;
  final SeatingChartCallback? _onChartRendered;
  final SeatsioCategoryListCallback? _onCategoryListCallback;
  final SeatsioObjectCallback? _onObjectClicked;
  final SeatsioObjectCallback? _onObjectSelected;
  final SeatsioObjectCallback? _onObjectDeselected;

  @override
  State<StatefulWidget> createState() => _SeatsioWebViewState();
}

class _SeatsioWebViewState extends State<SeatsioWebView> {
  late SeatsioWebViewController _seatsioController;

  @override
  void initState() {
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
        _seatsioController =
            SeatsioWebViewController(webViewController: controller);
        widget._onWebViewCreated?.call(_seatsioController);
      },
      javascriptChannels: <JavascriptChannel>{
        _onFlutterJsBridgeChannel(),
        _onChartRenderedChannel(),
        _onObjectClickedChannel(),
        _onObjectSelectedChannel(),
        _onObjectDeselectedChannel(),
      },
    );
  }

  JavascriptChannel _onFlutterJsBridgeChannel() {
    return JavascriptChannel(
      name: "FlutterJsBridge",
      onMessageReceived: (JavascriptMessage message) {
        if (widget._enableDebug)
          debugPrint(
              "[Seatsio]-> _onFlutterJsBridgeChannel callback message: ${message.message}");

        final cagetories = SeatsioCategory.arrayFromJson(message.message);
        if (cagetories != null && cagetories.isNotEmpty) {
          widget._onCategoryListCallback?.call(cagetories);
        }
      },
    );
  }

  JavascriptChannel _onChartRenderedChannel() {
    return JavascriptChannel(
      name: "onChartRendered",
      onMessageReceived: (JavascriptMessage message) {
        if (widget._enableDebug)
          debugPrint(
              "[Seatsio]-> onChartRendered callback message: ${message.message}");
        final seatingChart = SeatingChart(_seatsioController);
        widget._onChartRendered?.call(seatingChart);
      },
    );
  }

  JavascriptChannel _onObjectClickedChannel() {
    return JavascriptChannel(
      name: "onObjectClicked",
      onMessageReceived: (JavascriptMessage message) {
        if (widget._enableDebug)
          debugPrint(
              "[Seatsio]-> onObjectClicked callback message: ${message.message}");
        final object = SeatsioObject.fromJson(message.message);
        if (object != null) {
          widget._onObjectClicked?.call(object);
        }
      },
    );
  }

  JavascriptChannel _onObjectSelectedChannel() {
    return JavascriptChannel(
      name: "onObjectSelected",
      onMessageReceived: (JavascriptMessage message) {
        if (widget._enableDebug)
          debugPrint(
              "[Seatsio]-> onObjectSelected callback message: ${message.message}");
        final object = SeatsioObject.fromJson(message.message);
        if (object != null) {
          widget._onObjectSelected?.call(object);
        }
      },
    );
  }

  JavascriptChannel _onObjectDeselectedChannel() {
    return JavascriptChannel(
      name: "onObjectDeselected",
      onMessageReceived: (JavascriptMessage message) {
        if (widget._enableDebug)
          debugPrint(
              "[Seatsio]-> onObjectDeselected callback message: ${message.message}");
        final object = SeatsioObject.fromJson(message.message);
        if (object != null) {
          widget._onObjectDeselected?.call(object);
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
