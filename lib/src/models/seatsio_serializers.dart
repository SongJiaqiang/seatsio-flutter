import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'pricing_for_category.dart';
import 'seating_chart_config.dart';
import 'seatsio_category.dart';
import 'seatsio_label.dart';
import 'seatsio_object.dart';
import 'seatsio_point.dart';

part 'seatsio_serializers.g.dart';

@SerializersFor([
  SeatingChartConfig,
  SelectedObject,
  PricingForCategory,
  SeatsioCategory,
  TicketTypePricing,
  SeatsioObject,
  SeatsioLabel,
  SeatsioPoint,
])
final Serializers serializers = _$serializers;
