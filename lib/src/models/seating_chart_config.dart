import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'seating_chart.dart';

import 'pricing_for_category.dart';
import 'seatsio_category.dart';
import 'seatsio_object.dart';

part 'seating_chart_config.g.dart';

typedef VoidCallback = void Function();
typedef SeatsioObjectCallback = void Function(SeatsioObject);
typedef SeatingChartCallback = void Function(SeatingChart);
typedef SeatsioCategoryListCallback = void Function(
    BuiltList<SeatsioCategory>?);

abstract class SeatingChartConfig
    implements Built<SeatingChartConfig, SeatingChartConfigBuilder> {
  SeatingChartConfig._();

  factory SeatingChartConfig([updates(SeatingChartConfigBuilder b)]) =
      _$SeatingChartConfig;

  factory SeatingChartConfig.init() {
    return SeatingChartConfig((b) => b
      ..publicKey = ""
      ..events = ListBuilder()
      ..showLegend = false
      ..mode = "static" // 设置成静态模式，禁止前端占座，由后端派座
      ..showFullScreenButton = false // 不显示seatsio自带的区域图标
      ..showMinimap = false // 不显示右下角小地图
      ..showActiveSectionTooltip = false // 不显示右下角section信息
      ..loading = "<div class='loader'></div>" // 不显示官方loading动画
      ..enableObjectClickedCallback = true
      ..enableChartRenderedCallback = true);
  }

  String get publicKey;

  BuiltList<String?> get events;

  String? get chart;

  BuiltList<PricingForCategory>? get pricing;

  int? get numberOfPlacesToSelect;

  bool? get objectWithoutPricingSelectable;

  bool? get objectWithoutCategorySelectable;

  BuiltList<SelectedObject>? get selectedObjects;

  ObjectTooltip? get objectTooltip;

  /// https://docs.seats.io/docs/renderer/stylepreset/
  /// Possible values: 'balance', 'bubblegum', 'flathead', 'bezels', 'leaf'
  String? get themePreset;

  /// https://docs.seats.io/docs/renderer/colorscheme/
  /// Possible values: 'light', 'dark',
  String? get themeColor;

  String? get language;

  BuiltMap<String, String>? get messages;

  String? get priceLevelsTooltipMessage;

  int? get maxSelectedObjects;

  BuiltList<String>? get unavailableCategories;

  BestAvailable? get selectBestAvailable;

  bool? get alwaysShowSectionContents;

  String? get showSectionContents;

  /// https://docs.seats.io/docs/renderer/config-legend
  /// Default value: false
  bool? get showLegend;

  LegendForCategory? get legend;

  /// https://docs.seats.io/docs/renderer/config-showminimap
  /// Default value: true
  bool? get showMinimap;

  @BuiltValueField(wireName: 'showActiveSectionTooltipOnMobile')
  bool? get showActiveSectionTooltip;

  @BuiltValueField(wireName: 'showViewFromYourSeatOnMobile')
  bool? get showViewFromYourSeat;

  BuiltList<SelectionValidator>? get selectionValidators;

  BuiltList<SeatsioCategory>? get categories;

  BuiltMap<String, String>? get objectCategories;

  /// https://docs.seats.io/docs/renderer/config-mode
  /// Possible values: 'normal', 'static', 'print'
  String? get mode;

  String? get loading;

  /// https://docs.seats.io/docs/renderer/config-ticketlistings/
  List<TicketListing>? get ticketListings;

  bool? get holdOnSelectForGAs;

  /// https://docs.seats.io/docs/renderer/config-holdtoken
  String? get holdToken;

  /// https://docs.seats.io/docs/renderer/config-session
  /// Possible values: 'continue', 'start', 'manual', 'none' Default: 'none'
  String? get session;

  String? get objectLabel;

  String? get objectIcon;

  String? get isObjectVisible;

  String? get isObjectSelectable;

  String? get canGASelectionBeIncreased;

  String? get objectColor;

  String? get sectionColor;

  /// https://docs.seats.io/docs/renderer/config-extraconfig
  BuiltMap<String, String>? get extraConfig;

  bool? get showFullScreenButton;

  BuiltList<String>? get channels;

  bool get enableObjectClickedCallback;

  bool get enableChartRenderedCallback;

  Map<String, Object?> toMap() {
    final configMap = {
      "publicKey": publicKey,
      "events": events.toList(),
      "holdToken": holdToken ?? "",
      "session": session,
      "mode": mode,
      "showLegend": showLegend ?? true,
      "showFullScreenButton": showFullScreenButton ?? true,
      "showMinimap": showMinimap ?? true,
    };

    if (loading != null) {
      configMap["loading"] = loading;
    }

    if (objectIcon != null) {
      configMap["objectIcon"] = objectIcon;
      // objectIcon必需配合extraConfig使用，否则不生效
      if (extraConfig == null) {
        configMap["extraConfig"] = {};
      }
    }

    if (extraConfig != null) {
      configMap["extraConfig"] = extraConfig!.toMap().toString();
    }

    if (unavailableCategories != null && unavailableCategories!.isNotEmpty) {
      configMap["unavailableCategories"] = unavailableCategories?.toList();
    }

    if (Platform.isAndroid) {
      configMap["_client"] = "android";
    }

    if (Platform.isIOS) {
      configMap["_library"] = "ios";
    }

    return configMap;
  }

  static Serializer<SeatingChartConfig> get serializer =>
      _$seatingChartConfigSerializer;
}

abstract class SelectedObject
    implements Built<SelectedObject, SelectedObjectBuilder> {
  SelectedObject._();

  factory SelectedObject([updates(SelectedObjectBuilder b)]) = _$SelectedObject;

  String get ticketType;

  int get amount;

  String get label;

  static Serializer<SelectedObject> get serializer =>
      _$selectedObjectSerializer;
}

abstract class ObjectTooltip
    implements Built<ObjectTooltip, ObjectTooltipBuilder> {
  ObjectTooltip._();

  factory ObjectTooltip([updates(ObjectTooltipBuilder b)]) = _$ObjectTooltip;

  bool get showActionHint;

  bool get showAvailability;

  bool get showCategory;

  bool get showLabel;

  bool get showPricing;

  bool get showUnavailableNotice;

  bool get stylizedLabel;

  bool get confirmSelectionOnMobile;

  static Serializer<ObjectTooltip> get serializer => _$objectTooltipSerializer;
}

abstract class LegendForCategory
    implements Built<LegendForCategory, LegendForCategoryBuilder> {
  LegendForCategory._();

  factory LegendForCategory([updates(LegendForCategoryBuilder b)]) =
      _$LegendForCategory;

  bool get hideNonSelectableCategories;

  bool get hidePricing;

  static Serializer<LegendForCategory> get serializer =>
      _$legendForCategorySerializer;
}

abstract class BestAvailable
    implements Built<BestAvailable, BestAvailableBuilder> {
  BestAvailable._();

  factory BestAvailable([updates(BestAvailableBuilder b)]) = _$BestAvailable;

  int get number;

  BuiltList<String> get category;

  TicketTypePricing get ticketTypes;

  bool get clearSelection;

  static Serializer<BestAvailable> get serializer => _$bestAvailableSerializer;
}

abstract class SelectionValidator
    implements Built<SelectionValidator, SelectionValidatorBuilder> {
  SelectionValidator._();

  factory SelectionValidator([updates(SelectionValidatorBuilder b)]) =
      _$SelectionValidator;

  /// https://docs.seats.io/docs/renderer/config-selectionvalidators
  /// Possible values: 'noOrphanSeats', 'consecutiveSeats'
  String get type;

  static Serializer<SelectionValidator> get serializer =>
      _$selectionValidatorSerializer;
}

abstract class TicketListing
    implements Built<TicketListing, TicketListingBuilder> {
  TicketListing._();

  factory TicketListing([updates(TicketListingBuilder b)]) = _$TicketListing;

  String get section;

  int get quantity;

  double get price;

  static Serializer<TicketListing> get serializer => _$ticketListingSerializer;
}
