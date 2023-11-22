import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seatsio/src/models/hold_token.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/seating_chart.dart';
import '../models/seating_chart_config.dart';
import '../models/seatsio_category.dart';
import '../models/seatsio_object.dart';
import '../util/seatsio_web_view_controller.dart';

class SeatsioWebView extends StatefulWidget {
  const SeatsioWebView({
    super.key,
    bool enableDebug = false,
    String? initialUrl,
    SeatsioWebViewCreatedCallback? onWebViewCreated,
    SeatsioCategoryListCallback? onCategoryListCallback,
    SeatingChartCallback? onChartRendered,
    VoidCallback? onChartRenderingFailed,
    SeatsioObjectCallback? onObjectClicked,
    SeatsioObjectTicketTypeCallback? onObjectSelected,
    SeatsioObjectTicketTypeCallback? onObjectDeselected,
    VoidCallback? onSelectionValid,
    SelectionValidatorTypesCallback? onSelectionInvalid,
    SeatsioObjectsBoolCallback? onBestAvailableSelected,
    VoidCallback? onBestAvailableSelectionFailed,
    SeatsioObjectsTicketTypesCallback? onHoldSucceeded,
    SeatsioObjectsTicketTypesCallback? onHoldFailed,
    VoidCallback? onHoldTokenExpired,
    SeatsioHoldTokenCallback? onSessionInitialized,
    SeatsioObjectsTicketTypesCallback? onReleaseHoldSucceeded,
    SeatsioObjectsTicketTypesCallback? onReleaseHoldFailed,
    SeatsioObjectCallback? onSelectedObjectBooked,
    Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
  })  : this._enableDebug = enableDebug,
        this._initialUrl = initialUrl,
        this._onWebViewCreated = onWebViewCreated,
        this._onCategoryListCallback = onCategoryListCallback,
        this._onChartRendered = onChartRendered,
        this._onChartRenderingFailed = onChartRenderingFailed,
        this._onObjectClicked = onObjectClicked,
        this._onObjectSelected = onObjectSelected,
        this._onObjectDeselected = onObjectDeselected,
        this._onSelectionValid = onSelectionValid,
        this._onSelectionInvalid = onSelectionInvalid,
        this._onBestAvailableSelected = onBestAvailableSelected,
        this._onBestAvailableSelectionFailed = onBestAvailableSelectionFailed,
        this._onHoldSucceeded = onHoldSucceeded,
        this._onHoldFailed = onHoldFailed,
        this._onHoldTokenExpired = onHoldTokenExpired,
        this._onSessionInitialized = onSessionInitialized,
        this._onReleaseHoldSucceeded = onReleaseHoldSucceeded,
        this._onReleaseHoldFailed = onReleaseHoldFailed,
        this._onSelectedObjectBooked = onSelectedObjectBooked,
        this._gestureRecognizers = gestureRecognizers;

  /// Output some log if setting the [enableDebug] to true.
  final bool _enableDebug;

  /// The initial URL to load.
  final String? _initialUrl;

  final SeatsioWebViewCreatedCallback? _onWebViewCreated;

  final SeatsioCategoryListCallback? _onCategoryListCallback;

  final SeatsioObjectCallback? _onObjectClicked;

  final SeatsioObjectTicketTypeCallback? _onObjectSelected;

  final SeatsioObjectTicketTypeCallback? _onObjectDeselected;

  final SeatingChartCallback? _onChartRendered;

  final VoidCallback? _onChartRenderingFailed;

  /// Fired when best available objects are successfully selected. This callback receives two parameters:
  /// [array_of_objects]: the best available objects
  /// [nextToEachOther]: boolean that indicates whether the selected seats are next to each other.
  /// If they aren't, you could for example show a warning to the ticket buyer.
  /// nextToEachOther is null when tables or booths are selected instead of seats.
  final SeatsioObjectsBoolCallback? _onBestAvailableSelected;

  final VoidCallback? _onBestAvailableSelectionFailed;

  final VoidCallback? _onSelectionValid;

  final SelectionValidatorTypesCallback? _onSelectionInvalid;

  final SeatsioObjectsTicketTypesCallback? _onHoldSucceeded;

  final SeatsioObjectsTicketTypesCallback? _onHoldFailed;

  final VoidCallback? _onHoldTokenExpired;

  final SeatsioHoldTokenCallback? _onSessionInitialized;

  final SeatsioObjectsTicketTypesCallback? _onReleaseHoldSucceeded;

  final SeatsioObjectsTicketTypesCallback? _onReleaseHoldFailed;

  final SeatsioObjectCallback? _onSelectedObjectBooked;

  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers;

  @override
  State<StatefulWidget> createState() => _SeatsioWebViewState();
}

class _SeatsioWebViewState extends State<SeatsioWebView> {
  late final SeatsioWebViewController _seatsioController;
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('FlutterJsBridge', onMessageReceived: flutterJsBridge)
      ..addJavaScriptChannel('onObjectClicked', onMessageReceived: onObjectClicked)
      ..addJavaScriptChannel('onObjectSelected', onMessageReceived: onObjectSelected)
      ..addJavaScriptChannel('onObjectDeselected', onMessageReceived: onObjectDeselected)
      ..addJavaScriptChannel('onChartRendered', onMessageReceived: onChartRendered)
      ..addJavaScriptChannel('onChartRenderingFailed', onMessageReceived: onChartRenderingFailed)
      ..addJavaScriptChannel('onSelectionValid', onMessageReceived: onSelectionValid)
      ..addJavaScriptChannel('onSelectionInvalid', onMessageReceived: onSelectionInvalid)
      ..addJavaScriptChannel('onBestAvailableSelectionFailed', onMessageReceived: onBestAvailableSelectionFailed)
      ..addJavaScriptChannel('onHoldSucceeded', onMessageReceived: onHoldSucceeded)
      ..addJavaScriptChannel('onHoldFailed', onMessageReceived: onHoldFailed)
      ..addJavaScriptChannel('onHoldTokenExpired', onMessageReceived: onHoldTokenExpired)
      ..addJavaScriptChannel('onSessionInitialized', onMessageReceived: onSessionInitialized)
      ..addJavaScriptChannel('onReleaseHoldSucceeded', onMessageReceived: onReleaseHoldSucceeded)
      ..addJavaScriptChannel('onReleaseHoldFailed', onMessageReceived: onReleaseHoldFailed)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (widget._enableDebug) debugPrint("[Seatsio]-> onPageFinished: $url");
          },
          onWebResourceError: (error) {
            if (widget._enableDebug) debugPrint("[Seatsio]-> onWebResourceError: ${error.description}");
          },
          onNavigationRequest: (request) {
            if (widget._enableDebug) debugPrint("[Seatsio]-> onNavigationRequest: ${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      );
    if (widget._initialUrl != null) {
      _webViewController.loadRequest(Uri.parse(widget._initialUrl!));
    }
    _seatsioController = SeatsioWebViewController(webViewController: _webViewController);
    widget._onWebViewCreated?.call(_seatsioController);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _webViewController,
      gestureRecognizers: widget._gestureRecognizers,
    );
  }

  // Handle default callback from javascript
  void flutterJsBridge(JavaScriptMessage message) {
    if (widget._enableDebug) debugPrint("[Seatsio]-> _onFlutterJsBridgeChannel callback message: ${message.message}");
    // Get categories of chart if call chart.requestCategories() on the onChartRendered callback.
    final categories = SeatsioCategory.arrayFromJson(message.message);
    if (categories != null && categories.isNotEmpty) {
      widget._onCategoryListCallback?.call(categories);
    }
  }

  void onObjectClicked(JavaScriptMessage message) {
    if (widget._onObjectClicked == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onObjectClicked callback message: ${message.message}");
    final object = SeatsioObject.fromJson(message.message);
    if (object != null) {
      widget._onObjectClicked?.call(object);
    }
  }

  void onObjectSelected(JavaScriptMessage message) {
    if (widget._onObjectSelected == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onObjectClicked callback message: ${message.message}");
    final object = SeatsioObject.fromJson(message.message);
    if (object != null) {
      widget._onObjectSelected?.call(object, null);
    }
  }

  void onObjectDeselected(JavaScriptMessage message) {
    if (widget._onObjectDeselected == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onObjectDeselected callback message: ${message.message}");
    final object = SeatsioObject.fromJson(message.message);
    if (object != null) {
      // todo: Miss ticketType parameter
      // Does not found ticketType from javascript message like iOS SDK.
      widget._onObjectDeselected?.call(object, null);
    }
  }

  void onChartRendered(JavaScriptMessage message) {
    if (widget._onChartRendered == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onChartRendered callback message: ${message.message}");
    final seatingChart = SeatingChart(_seatsioController);
    widget._onChartRendered?.call(seatingChart);
  }

  void onChartRenderingFailed(JavaScriptMessage message) {
    if (widget._onChartRenderingFailed == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onChartRenderingFailed callback message: ${message.message}");
    widget._onChartRenderingFailed?.call();
  }

  void onSelectionValid(JavaScriptMessage message) {
    if (widget._onSelectionValid == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onSelectionValid callback message: ${message.message}");
    widget._onSelectionValid?.call();
  }

  void onSelectionInvalid(JavaScriptMessage message) {
    if (widget._onSelectionInvalid == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onSelectionInvalid callback message: ${message.message}");
    // todo: Get valid types from message
    // I don't known how to decode the SelectionValidatorType from the javascript message,
    // So I always return an empty list.
    widget._onSelectionInvalid?.call([]);
  }

  void onBestAvailableSelected(JavaScriptMessage message) {
    if (widget._onBestAvailableSelected == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onBestAvailableSelected callback message: ${message.message}");
    // todo: Get array_of_objects and nextToEachOther from message
    final objects = SeatsioObject.arrayFromJson(message.message);
    if (objects != null) {
      widget._onBestAvailableSelected?.call(objects, true);
    } else {
      widget._onBestAvailableSelected?.call([], true);
    }
  }

  void onBestAvailableSelectionFailed(JavaScriptMessage message) {
    if (widget._onBestAvailableSelectionFailed == null) return;
    if (widget._enableDebug)
      debugPrint("[Seatsio]-> onBestAvailableSelectionFailed callback message: ${message.message}");
    widget._onBestAvailableSelectionFailed?.call();
  }

  void onHoldSucceeded(JavaScriptMessage message) {
    if (widget._onHoldSucceeded == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onHoldSucceeded callback message: ${message.message}");
    // todo: what about ticket types?
    final objects = SeatsioObject.arrayFromJson(message.message);
    if (objects != null) {
      widget._onHoldSucceeded?.call(objects, null);
    } else {
      widget._onHoldSucceeded?.call([], null);
    }
  }

  void onHoldFailed(JavaScriptMessage message) {
    if (widget._onHoldFailed == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onHoldFailed callback message: ${message.message}");
    // todo: what about ticket types?
    final objects = SeatsioObject.arrayFromJson(message.message);
    if (objects != null) {
      widget._onHoldFailed?.call(objects, null);
    } else {
      widget._onHoldFailed?.call([], null);
    }
  }

  void onHoldTokenExpired(JavaScriptMessage message) {
    if (widget._onHoldTokenExpired == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onHoldTokenExpired callback was called");
    widget._onHoldTokenExpired?.call();
  }

  void onSessionInitialized(JavaScriptMessage message) {
    if (widget._onSessionInitialized == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onSessionInitialized callback message: ${message.message}");
    final holdToken = HoldToken.fromString(message.message);
    widget._onSessionInitialized?.call(holdToken);
  }

  void onReleaseHoldSucceeded(JavaScriptMessage message) {
    if (widget._onReleaseHoldSucceeded == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onReleaseHoldSucceeded callback message: ${message.message}");
    // todo: get objects and types from message
    widget._onReleaseHoldSucceeded?.call([], null);
  }

  void onReleaseHoldFailed(JavaScriptMessage message) {
    if (widget._onReleaseHoldFailed == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onReleaseHoldFailed callback message: ${message.message}");
    // todo: get objects and types from message
    widget._onReleaseHoldFailed?.call([], null);
  }

  void onSelectedObjectBooked(JavaScriptMessage message) {
    if (widget._onSelectedObjectBooked == null) return;
    if (widget._enableDebug) debugPrint("[Seatsio]-> onSelectedObjectBooked callback message: ${message.message}");
    final object = SeatsioObject.fromJson(message.message);
    if (object != null) {
      widget._onSelectedObjectBooked?.call(object);
    }
  }
}
