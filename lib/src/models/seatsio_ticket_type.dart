import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seatsio_ticket_type.g.dart';

abstract class SeatsioTicketType
    implements Built<SeatsioTicketType, SeatsioTicketTypeBuilder> {
  const SeatsioTicketType._();

  factory SeatsioTicketType([updates(SeatsioTicketTypeBuilder b)]) = _$SeatsioTicketType;

  double get price;

  String get ticketType;

  static Serializer<SeatsioTicketType> get serializer => _$seatsioTicketTypeSerializer;
}
