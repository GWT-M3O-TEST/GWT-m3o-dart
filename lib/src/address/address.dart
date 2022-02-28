import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../client/client.dart';

part 'address.freezed.dart';
part 'address.g.dart';

class AddressService {
  final Options opts;
  var _client;

  AddressService(this.opts) {
    _client = Client(opts);
  }

  /// Lookup a list of UK addresses by postcode
  Future<LookupPostcodeResponse> lookupPostcode(
      LookupPostcodeRequest req) async {
    Request request = Request(
      service: 'address',
      endpoint: 'LookupPostcode',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return LookupPostcodeResponse.Merr(body: err.b);
      }
      return LookupPostcodeResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@Freezed()
class LookupPostcodeRequest with _$LookupPostcodeRequest {
  const factory LookupPostcodeRequest({
    /// UK postcode e.g SW1A 2AA
    String? postcode,
  }) = _LookupPostcodeRequest;
  factory LookupPostcodeRequest.fromJson(Map<String, dynamic> json) =>
      _$LookupPostcodeRequestFromJson(json);
}

@Freezed()
class LookupPostcodeResponse with _$LookupPostcodeResponse {
  const factory LookupPostcodeResponse({
    List<Record>? addresses,
  }) = LookupPostcodeResponseData;
  const factory LookupPostcodeResponse.Merr({Map<String, dynamic>? body}) =
      LookupPostcodeResponseMerr;
  factory LookupPostcodeResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupPostcodeResponseFromJson(json);
}

@Freezed()
class Record with _$Record {
  const factory Record({
    /// line one of address
    String? line_one,

    /// line two of address
    String? line_two,

    /// dependent locality
    String? locality,

    /// street name
    String? street,

    /// the complete address
    String? summary,

    /// the county
    String? county,

    /// organisation if present
    String? organisation,

    /// the postcode
    String? postcode,

    /// the premise
    String? premise,

    /// post town
    String? town,

    /// building name
    String? building_name,
  }) = _Record;
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}