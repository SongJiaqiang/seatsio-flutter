import '../models/seating_chart_config.dart';

class SeatsioJsBridge {
  /// 将callback转成字符串
  static List<String> buildCallbacksConfiguration(
      SeatingChartConfig chartConfig) {
    final List<String> callbacks = [];

    if (chartConfig.enableChartRenderedCallback) {
      final callbackString = buildCallbackConfigAsJS("onChartRendered");
      callbacks.add(callbackString);
    }

    if (chartConfig.enableObjectClickedCallback) {
      final callbackString = buildCallbackConfigAsJS("onObjectClicked");
      callbacks.add(callbackString);
    }

    if (chartConfig.enableObjectSelectedCallback) {
      final callbackString = buildCallbackConfigAsJS("onObjectSelected");
      callbacks.add(callbackString);
    }

    if (chartConfig.enableObjectDeselectedCallback) {
      final callbackString = buildCallbackConfigAsJS("onObjectDeselected");
      callbacks.add(callbackString);
    }

    // todo(sjq): 更多callback放到SDK中再做支持

    return callbacks;
  }

  static String buildCallbackConfigAsJS(String name) {
    return '$name: object => $name.postMessage(JSON.stringify(object))';
  }

  static String seatsioInjectString(String selectedFeature) {
    return "(object, dfValue, extraConfig) => {if(extraConfig[object.label] == 'true') {return '$selectedFeature'} else {return dfValue}}";
  }
}
