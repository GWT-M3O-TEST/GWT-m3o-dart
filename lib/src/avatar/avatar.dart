import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../client/client.dart';

part 'avatar.freezed.dart';
part 'avatar.g.dart';

class AvatarService {
  final Options opts;
  var _client;

  AvatarService(this.opts) {
    _client = Client(opts);
  }

  /// Generate an unique avatar
  Future<GenerateResponse> generate(GenerateRequest req) async {
    Request request = Request(
      service: 'avatar',
      endpoint: 'Generate',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return GenerateResponse.Merr(body: err.b);
      }
      return GenerateResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@Freezed()
class GenerateRequest with _$GenerateRequest {
  const factory GenerateRequest({
    /// encode format of avatar image, `png` or `jpeg`, default is `jpeg`
    String? format,

    /// avatar's gender, `male` or `female`, default is `male`
    String? gender,

    /// if upload to m3o CDN, default is `false`
    /// if update = true, then it'll return the CDN url
    bool? upload,

    /// avatar's username, unique username will generates the unique avatar;
    /// if username == "", will generate a random avatar in every request
    /// if upload == true, username will be used as CDN filename rather than a random uuid string
    String? username,
  }) = _GenerateRequest;
  factory GenerateRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateRequestFromJson(json);
}

@Freezed()
class GenerateResponse with _$GenerateResponse {
  const factory GenerateResponse({
    /// base64encode string of the avatar image
    String? base64,

    /// Micro's CDN url of the avatar image
    String? url,
  }) = GenerateResponseData;
  const factory GenerateResponse.Merr({Map<String, dynamic>? body}) =
      GenerateResponseMerr;
  factory GenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateResponseFromJson(json);
}
