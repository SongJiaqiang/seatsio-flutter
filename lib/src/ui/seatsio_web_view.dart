import 'dart:io';
import 'package:flutter/material.dart';
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
    SeatsioObjectsTicketTypesCallback? onReleaseHoldSucceeded,
    SeatsioObjectsTicketTypesCallback? onReleaseHoldFailed,
    SeatsioObjectCallback? onSelectedObjectBooked,
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
        this._onReleaseHoldSucceeded = onReleaseHoldSucceeded,
        this._onReleaseHoldFailed = onReleaseHoldFailed,
        this._onSelectedObjectBooked = onSelectedObjectBooked,
        super(key: key);

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

  final SeatsioObjectsTicketTypesCallback? _onReleaseHoldSucceeded;

  final SeatsioObjectsTicketTypesCallback? _onReleaseHoldFailed;

  final SeatsioObjectCallback? _onSelectedObjectBooked;

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
    return WebView(
      initialUrl: widget._initialUrl ?? "",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _seatsioController =
            SeatsioWebViewController(webViewController: controller);
        widget._onWebViewCreated?.call(_seatsioController);
      },
      javascriptChannels: _javascriptChannels(),
    );
  }

  /// Create Javascript channel for seatsio callback.
  Set<JavascriptChannel> _javascriptChannels() {
    final Set<JavascriptChannel> channels = {};

    // Handle default callback from javascript
    {
      channels.add(JavascriptChannel(
        name: "FlutterJsBridge",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> _onFlutterJsBridgeChannel callback message: ${message.message}");
          // Get categories of chart if call chart.requestCategories() on the onChartRendered callback.
          final cagetories = SeatsioCategory.arrayFromJson(message.message);
          if (cagetories != null && cagetories.isNotEmpty) {
            widget._onCategoryListCallback?.call(cagetories);
          }
        },
      ));
    }

    if (widget._onObjectClicked != null) {
      channels.add(JavascriptChannel(
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
      ));
    }

    if (widget._onObjectSelected != null) {
      channels.add(JavascriptChannel(
        name: "onObjectSelected",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onObjectSelected callback message: ${message.message}");
          final object = SeatsioObject.fromJson(message.message);
          if (object != null) {
            // todo: Miss ticketType parameter
            // Does not found ticketType from javascript message like iOS SDK.
            widget._onObjectSelected?.call(object, null);
          }
        },
      ));
    }

    if (widget._onObjectDeselected != null) {
      channels.add(JavascriptChannel(
        name: "onObjectDeselected",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onObjectDeselected callback message: ${message.message}");
          final object = SeatsioObject.fromJson(message.message);
          if (object != null) {
            // todo: Miss ticketType parameter
            // Does not found ticketType from javascript message like iOS SDK.
            widget._onObjectDeselected?.call(object, null);
          }
        },
      ));
    }

    if (widget._onChartRendered != null) {
      channels.add(JavascriptChannel(
        name: "onChartRendered",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onChartRendered callback message: ${message.message}");
          final seatingChart = SeatingChart(_seatsioController);
          widget._onChartRendered?.call(seatingChart);
        },
      ));
    }

    if (widget._onChartRenderingFailed != null) {
      channels.add(JavascriptChannel(
        name: "onChartRenderingFailed",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onChartRenderingFailed callback message: ${message.message}");
          widget._onChartRenderingFailed?.call();
        },
      ));
    }

    if (widget._onSelectionValid != null) {
      channels.add(JavascriptChannel(
        name: "onSelectionValid",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onSelectionValid callback message: ${message.message}");
          widget._onSelectionValid?.call();
        },
      ));
    }

    if (widget._onSelectionInvalid != null) {
      channels.add(JavascriptChannel(
        name: "onSelectionInvalid",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onSelectionInvalid callback message: ${message.message}");
          // todo: Get valid types from message
          // I don't known how to decode the SelectionValidatorType from the javascript message,
          // So I always return an empty list.
          widget._onSelectionInvalid?.call([]);
        },
      ));
    }

    if (widget._onBestAvailableSelected != null) {
      channels.add(JavascriptChannel(
        name: "onBestAvailableSelected",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onBestAvailableSelected callback message: ${message.message}");
          // todo: Get array_of_objects and nextToEachOther from message
          final objects = SeatsioObject.arrayFromJson(message.message);
          if (objects != null) {
            widget._onBestAvailableSelected?.call(objects, true);
          } else {
            widget._onBestAvailableSelected?.call([], true);
          }
        },
      ));
    }

    if (widget._onBestAvailableSelectionFailed != null) {
      channels.add(JavascriptChannel(
        name: "onBestAvailableSelectionFailed",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onBestAvailableSelectionFailed callback message: ${message.message}");
          widget._onBestAvailableSelectionFailed?.call();
        },
      ));
    }

    if (widget._onHoldSucceeded != null) {
      channels.add(JavascriptChannel(
        name: "onHoldSucceeded",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onHoldSucceeded callback message: ${message.message}");
          // todo: get objects and types from message
          widget._onHoldSucceeded?.call([], null);
        },
      ));
    }

    if (widget._onHoldFailed != null) {
      channels.add(JavascriptChannel(
        name: "onHoldFailed",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onHoldFailed callback message: ${message.message}");
          // todo: get objects and types from message
          widget._onHoldFailed?.call([], null);
        },
      ));
    }

    if (widget._onReleaseHoldSucceeded != null) {
      channels.add(JavascriptChannel(
        name: "onReleaseHoldSucceeded",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onReleaseHoldSucceeded callback message: ${message.message}");
          // todo: get objects and types from message
          widget._onReleaseHoldSucceeded?.call([], null);
        },
      ));
    }

    if (widget._onReleaseHoldFailed != null) {
      channels.add(JavascriptChannel(
        name: "onReleaseHoldFailed",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onReleaseHoldFailed callback message: ${message.message}");
          // todo: get objects and types from message
          widget._onReleaseHoldFailed?.call([], null);
        },
      ));
    }

    if (widget._onSelectedObjectBooked != null) {
      channels.add(JavascriptChannel(
        name: "onSelectedObjectBooked",
        onMessageReceived: (JavascriptMessage message) {
          if (widget._enableDebug)
            debugPrint(
                "[Seatsio]-> onSelectedObjectBooked callback message: ${message.message}");
          final object = SeatsioObject.fromJson(message.message);
          if (object != null) {
            widget._onSelectedObjectBooked?.call(object);
          }
        },
      ));
    }

    return channels;
  }
}
