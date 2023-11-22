import '../models/seating_chart_config.dart';

class SeatsioJsBridge {
  /// 将callback转成字符串
  static List<String> buildCallbacksConfiguration(
      SeatingChartConfig chartConfig) {
    final List<String> callbacks = [];

    if (chartConfig.enableChartRenderedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onChartRendered"));
    }

    if (chartConfig.enableChartRenderingFailedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onChartRenderingFailed"));
    }

    if (chartConfig.enableObjectClickedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onObjectClicked"));
    }

    if (chartConfig.enableObjectSelectedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onObjectSelected"));
    }

    if (chartConfig.enableObjectDeselectedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onObjectDeselected"));
    }

    if (chartConfig.enableSelectionValidCallback) {
      callbacks.add(buildCallbackConfigAsJS("onSelectionValid"));
    }

    if (chartConfig.enableSelectionInvalidCallback) {
      callbacks.add(buildCallbackConfigAsJS("onSelectionInvalid"));
    }

    if (chartConfig.enableBestAvailableSelectedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onBestAvailableSelected"));
    }

    if (chartConfig.enableBestAvailableSelectionFailedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onBestAvailableSelectionFailed"));
    }

    if (chartConfig.enableHoldSucceededCallback) {
      callbacks.add(buildCallbackConfigAsJS("onHoldSucceeded"));
    }

    if (chartConfig.enableHoldFailedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onHoldFailed"));
    }

    if (chartConfig.enableHoldTokenExpiredCallback) {
      callbacks.add(buildCallbackConfigAsJS("onHoldTokenExpired"));
    }

    if (chartConfig.enableSessionInitializedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onSessionInitialized"));
    }

    if (chartConfig.enableReleaseHoldSucceededCallback) {
      callbacks.add(buildCallbackConfigAsJS("onReleaseHoldSucceeded"));
    }

    if (chartConfig.enableReleaseHoldFailedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onReleaseHoldFailed"));
    }

    if (chartConfig.enableSelectedObjectBookedCallback) {
      callbacks.add(buildCallbackConfigAsJS("onSelectedObjectBooked"));
    }

    return callbacks;
  }

  static String buildCallbackConfigAsJS(String name) {
    return '$name: object => $name.postMessage(JSON.stringify(object))';
  }

  static String seatsioInjectString(String selectedFeature) {
    return "(object, dfValue, extraConfig) => {if(extraConfig[object.label] == 'true') {return '$selectedFeature'} else {return dfValue}}";
  }
}
