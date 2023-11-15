import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'pricing_for_category.dart';
import 'seating_chart.dart';
import 'seatsio_category.dart';
import 'seatsio_object.dart';
import 'seatsio_ticket_type.dart';

part 'seating_chart_config.g.dart';

typedef VoidCallback = void Function();
typedef SeatsioObjectCallback = void Function(SeatsioObject);
typedef SeatingChartCallback = void Function(SeatingChart);
typedef SeatsioCategoryListCallback = void Function(
    BuiltList<SeatsioCategory>?);
typedef SelectionValidatorTypesCallback = void Function(
    List<SelectionValidatorType>);
typedef SeatsioObjectsBoolCallback = void Function(List<SeatsioObject>, bool);
typedef SeatsioObjectTicketTypeCallback = void Function(
    SeatsioObject, SeatsioTicketType?);
typedef SeatsioObjectsTicketTypesCallback = void Function(
    List<SeatsioObject>, List<SeatsioTicketType>?);

enum SelectionValidatorType {
  consecutiveSeats,
  noOrphanSeats,
}

abstract class SeatingChartConfig
    implements Built<SeatingChartConfig, SeatingChartConfigBuilder> {
  SeatingChartConfig._();

  factory SeatingChartConfig([updates(SeatingChartConfigBuilder b)]) =
      _$SeatingChartConfig;

  /// The workspace key for the workspace in which the chart was created.
  /// You can find it on your workspace settings page.
  /// This parameter used to be called [publicKey]
  @BuiltValueField(wireName: 'publicKey')
  String get workspaceKey;

  /// The key of the event for which you want to render the seating chart.
  /// Either [events] or [event] must be passed in, but not both.
  /// Currently the Channels functionality is not supported when using multiple events.
  @BuiltValueField(wireName: 'event')
  String get eventKey;

  /// I can't find accurate documentation for [chart]
  /// Maybe this, https://docs.seats.io/docs/embedded-designer/configuration-chartkey/
  String? get chart;

  /// The [region] need to be specified, have four region options:
  /// [region] = 'eu'
  /// [region] = 'na'
  /// [region] = 'sa'
  /// [region] = 'oc'
  /// Maybe this, https://docs.seats.io/docs/embedded-designer/introduction
  String? get region;

  /// Sets the [language] of the designer.
  /// Currently supported languages are:
  /// English ('en')
  /// Spanish ('es')
  /// French ('fr')
  /// Portuguese ('pt')
  /// German ('de').
  /// For the list of supported languages, check this page.
  /// https://support.seats.io/en/articles/2074430-translating-embedded-floor-plans-i18n
  String? get language;

  /// Seats supports two types of pricing: simple pricing and multi-level pricing.
  /// Both are defined using the pricing configuration parameter
  /// Detail: https://docs.seats.io/docs/renderer/config-pricing/
  BuiltList<PricingForCategory>? get pricing;

  /// Activates one-click selection mode.
  /// If you pass in numberOfPlacesToSelect: 3,
  /// the ticket buyer only needs to click once to select 3 places.
  /// Previously selected places are deselected automatically.
  int? get numberOfPlacesToSelect;

  /// If set to false,
  /// objects that don't have pricing information will be rendered as not selectable (i.e. greyed out).
  /// Defaults to true.
  bool? get objectWithoutPricingSelectable;

  /// If set to false,
  /// objects that don't have a category will be rendered as not selectable (i.e. greyed out).
  /// Defaults to true.
  bool? get objectWithoutCategorySelectable;

  /// Render the chart with the specified objects selected (if they are still free).
  /// Detail: https://docs.seats.io/docs/renderer/config-selectedobjects/
  BuiltList<SelectedObject>? get selectedObjects;

  /// Allows to toggle on or off some features of the cursor tooltip,
  /// displayed when hovering objects on mouse-input devices like laptops and desktop computers.
  /// Detail: https://docs.seats.io/docs/renderer/config-objecttooltip/
  ObjectTooltip? get objectTooltip;

  /// https://docs.seats.io/docs/renderer/stylepreset/
  /// Possible values: 'balance', 'bubblegum', 'flathead', 'bezels', 'leaf'
  String? get themePreset;

  /// https://docs.seats.io/docs/renderer/colorscheme/
  /// Possible values: 'light', 'dark',
  String? get themeColor;

  BuiltMap<String, String>? get messages;

  String? get priceLevelsTooltipMessage;

  /// See more: https://docs.seats.io/docs/renderer/config-maxselectedobjects/
  int? get maxSelectedObjects;

  /// If [maxSelectedObjectList] is not null, it replaces [maxSelectedObjectList].
  List<Map<String, dynamic>>? get maxSelectedObjectList;

  /// See more: https://docs.seats.io/docs/renderer/availablecategories/
  BuiltList<String>? get availableCategories;

  BuiltList<String>? get unavailableCategories;

  BestAvailable? get selectBestAvailable;

  bool? get alwaysShowSectionContents;

  String? get showSectionContents;

  /// If true, a legend with the category names and colors is rendered at the top of the chart.
  /// https://docs.seats.io/docs/renderer/config-legend
  bool? get showLegend;

  LegendForCategory? get legend;

  /// When zoomed in on a chart with sections,
  /// a minimap is shown so ticket buyers have a better sense which seats they're looking at.
  /// You can hide this minimap by passing showMinimap: false.
  /// https://docs.seats.io/docs/renderer/config-showminimap
  bool? get showMinimap;

  /// On mobile, when displaying a chart with sections,
  /// a tooltip is shown at the bottom of the screen with the section name and pricing.
  /// You can hide this tooltip on mobile by passing showActiveSectionTooltipOnMobile: false.
  @BuiltValueField(wireName: 'showActiveSectionTooltipOnMobile')
  bool? get showActiveSectionTooltip;

  /// On mobile, a view from seat thumbnail is displayed on the top left of the screen.
  /// Tapping this image will expand the thumbnail.
  /// You can hide this thumbnail on mobile by passing showViewFromYourSeatOnMobile: false.
  @BuiltValueField(wireName: 'showViewFromYourSeatOnMobile')
  bool? get showViewFromYourSeat;

  BuiltList<SelectionValidator>? get selectionValidators;

  BuiltList<SeatsioCategory>? get categories;

  BuiltMap<String, String>? get objectCategories;

  /// This parameter supports three values:
  /// normal: the default setting. Objects are selectable, and zooming and panning are enabled
  /// static: objects are not selectable, but zooming and panning is enabled
  /// print: objects are not selectable and zooming and panning is disabled
  /// spotlight: shows selected objects while dimming all others. Navigation controls are enabled but interaction is disabled.
  /// To use spotlight mode, you should set [session] to 'none' and set [holdToken] to null.
  /// https://docs.seats.io/docs/renderer/config-mode
  String? get mode;

  /// This parameter allows you to override the default seats.io spinner
  /// that is shown while the floor plan is being loaded.
  ///  The value can contain (valid) html, like so: "<div class='loader'>Loading...</div>"
  /// https://docs.seats.io/docs/renderer/config-loading/
  String? get loading;

  /// If [showLoadingAnimation] is false,
  /// will set [loading] is "<div class='loader'></div>"
  bool get showLoadingAnimation;

  /// https://docs.seats.io/docs/renderer/config-ticketlistings/
  List<TicketListing>? get ticketListings;

  bool? get holdOnSelectForGAs;

  /// https://docs.seats.io/docs/renderer/config-holdtoken
  String? get holdToken;

  /// https://docs.seats.io/docs/renderer/config-session
  /// Possible values: 'continue', 'start', 'manual', 'none' Default: 'none'
  String? get session;

  String? get objectLabel;

  /// [objectIcon] must be used with [extraConfig], otherwise it will not take effect.
  String? get objectIcon;

  String? get isObjectVisible;

  String? get isObjectSelectable;

  String? get objectColor;

  String? get sectionColor;

  /// https://docs.seats.io/docs/renderer/config-extraconfig
  BuiltMap<String, String>? get extraConfig;

  bool? get showFullScreenButton;

  BuiltList<String>? get channels;

  bool get enableChartRenderedCallback;

  bool get enableChartRenderingFailedCallback;

  bool get enableObjectClickedCallback;

  bool get enableObjectSelectedCallback;

  bool get enableObjectDeselectedCallback;

  bool get enableSelectionValidCallback;

  bool get enableSelectionInvalidCallback;

  bool get enableBestAvailableSelectedCallback;

  bool get enableBestAvailableSelectionFailedCallback;

  bool get enableHoldSucceededCallback;

  bool get enableHoldFailedCallback;

  bool get enableReleaseHoldSucceededCallback;

  bool get enableReleaseHoldFailedCallback;

  bool get enableSelectedObjectBookedCallback;

  factory SeatingChartConfig.init() {
    return SeatingChartConfig((b) => b
      ..workspaceKey = ""
      ..eventKey = ""
      ..region = 'eu'
      ..language = 'en'
      ..showLoadingAnimation = true
      ..enableChartRenderedCallback = true
      ..enableChartRenderingFailedCallback = true
      ..enableObjectClickedCallback = true
      ..enableObjectSelectedCallback = true
      ..enableObjectDeselectedCallback = true
      ..enableSelectionValidCallback = false
      ..enableSelectionInvalidCallback = false
      ..enableBestAvailableSelectedCallback = false
      ..enableBestAvailableSelectionFailedCallback = false
      ..enableHoldSucceededCallback = false
      ..enableHoldFailedCallback = false
      ..enableReleaseHoldSucceededCallback = false
      ..enableReleaseHoldFailedCallback = false
      ..enableSelectedObjectBookedCallback = false);
  }

  // todo: Miss some key-values
  /// Convert chart config info to a map
  Map<String, Object?> toMap() {
    final configMap = {
      "workspaceKey": workspaceKey,
      "event": eventKey,
      "region": region ?? "eu",
      "language": language ?? "en",
      "holdToken": holdToken ?? "",
      "session": session ?? "none",
      "mode": mode,
      "showLegend": showLegend ?? true,
      "showFullScreenButton": showFullScreenButton ?? false,
      "showMinimap": showMinimap ?? true,
      "showActiveSectionTooltipOnMobile": showActiveSectionTooltip ?? true,
      "showViewFromYourSeatOnMobile": showViewFromYourSeat ?? true,
      "showSectionContents": showSectionContents ?? "auto",
    };

    if (pricing != null) {
      configMap["pricing"] = pricing?.toList();
    }

    if (loading != null) {
      configMap["loading"] = loading;
    }

    if (!showLoadingAnimation) {
      configMap["loading"] = "<div class='loader'></div>";
    }

    if (objectIcon != null) {
      configMap["objectIcon"] = objectIcon;
      if (extraConfig == null) {
        configMap["extraConfig"] = {};
      }
    }

    if (maxSelectedObjectList != null) {
      configMap["maxSelectedObjects"] = maxSelectedObjectList;
    } else if (maxSelectedObjects != null) {
      configMap["maxSelectedObjects"] = maxSelectedObjects;
    }

    if (extraConfig != null) {
      configMap["extraConfig"] = extraConfig!.toMap().toString();
    }

    if (availableCategories != null && availableCategories!.isNotEmpty) {
      configMap["availableCategories"] = availableCategories!.toList();
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

    if (numberOfPlacesToSelect != null) {
      configMap["numberOfPlacesToSelect"] = numberOfPlacesToSelect;
    }

    if (selectedObjects != null) {
      configMap["selectedObjects"] = selectedObjects!.map((obj) {
        if (obj.ticketType != null) {
          final Map<String, dynamic> map = {
            "label": obj.label,
            "ticketType": obj.ticketType.toString(),
          };
          if (obj.amount != null) {
            map["amount"] = obj.amount!;
          }
          return map;
        } else {
          return obj.label;
        }
      }).toList();
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

  String get label;

  String? get ticketType;

  int? get amount;

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
