import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../client/client.dart';

part 'time.freezed.dart';
part 'time.g.dart';

class TimeService {
  final Options opts;
  var _client;

  TimeService(this.opts) {
    _client = Client(opts);
  }

  /// Get the current time
  Future<NowResponse> now(NowRequest req) async {
    Request request = Request(
      service: 'time',
      endpoint: 'Now',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return NowResponse.Merr(body: err.b);
      }
      return NowResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Get the timezone info for a specific location
  Future<ZoneResponse> zone(ZoneRequest req) async {
    Request request = Request(
      service: 'time',
      endpoint: 'Zone',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return ZoneResponse.Merr(body: err.b);
      }
      return ZoneResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@Freezed()
class NowRequest with _$NowRequest {
  const factory NowRequest({
    /// optional location, otherwise returns UTC
    String? location,
  }) = _NowRequest;
  factory NowRequest.fromJson(Map<String, dynamic> json) =>
      _$NowRequestFromJson(json);
}

@Freezed()
class NowResponse with _$NowResponse {
  const factory NowResponse({
    /// the timezone as BST
    String? timezone,

    /// the unix timestamp
    int? unix,

    /// the current time as HH:MM:SS
    String? localtime,

    /// the location as Europe/London
    String? location,

    /// timestamp as 2006-01-02T15:04:05.999999999Z07:00
    String? timestamp,
  }) = NowResponseData;
  const factory NowResponse.Merr({Map<String, dynamic>? body}) =
      NowResponseMerr;
  factory NowResponse.fromJson(Map<String, dynamic> json) =>
      _$NowResponseFromJson(json);
}

@Freezed()
class ZoneRequest with _$ZoneRequest {
  const factory ZoneRequest({
    /// location to lookup e.g postcode, city, ip address
    String? location,
  }) = _ZoneRequest;
  factory ZoneRequest.fromJson(Map<String, dynamic> json) =>
      _$ZoneRequestFromJson(json);
}

@Freezed()
class ZoneResponse with _$ZoneResponse {
  const factory ZoneResponse({
    /// the local time
    String? localtime,

    /// location requested
    String? location,

    /// e.g -0.37
    double? longitude,

    /// e.g 51.42
    double? latitude,

    /// country of the timezone
    String? country,

    /// is daylight savings
    bool? dst,

    /// region of timezone
    String? region,

    /// the timezone e.g Europe/London
    String? timezone,

    /// the abbreviated code e.g BST
    String? abbreviation,
  }) = ZoneResponseData;
  const factory ZoneResponse.Merr({Map<String, dynamic>? body}) =
      ZoneResponseMerr;
  factory ZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$ZoneResponseFromJson(json);
}