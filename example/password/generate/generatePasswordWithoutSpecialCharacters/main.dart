import 'dart:io';

import 'package:m3o/src/client/client.dart';
import 'package:m3o/src/password/password.dart';

void main() async {
  final token = Platform.environment['M3O_API_TOKEN']!;
  final ser = PasswordService(
    Options(
      token: token,
      address: liveAddress,
    ),
  );

  final payload = <String, dynamic>{
    "length": 16,
    "lowercase": true,
    "numbers": true,
    "special": false,
    "uppercase": true,
  };

  GenerateRequest req = GenerateRequest.fromJson(payload);

  try {
    GenerateResponse res = await ser.generate(req);

    res.map((value) => print(value),
        Merr: (GenerateResponseMerr err) => print(err.body!['body']));
  } catch (e, stack) {
    print(e);
    print(stack);
  } finally {
    exit(0);
  }
}