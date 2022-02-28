import 'dart:io';

import 'package:m3o/src/client/client.dart';
import 'package:m3o/src/file/file.dart';

void main() async {
  final token = Platform.environment['M3O_API_TOKEN']!;
  final ser = FileService(
    Options(
      token: token,
      address: liveAddress,
    ),
  );

  final payload = <String, dynamic>{
    "path": "/document/text-files/file.txt",
    "project": "examples",
  };

  ReadRequest req = ReadRequest.fromJson(payload);

  try {
    ReadResponse res = await ser.read(req);

    res.map((value) => print(value),
        Merr: (ReadResponseMerr err) => print(err.body!['body']));
  } catch (e) {
    print(e);
  } finally {
    exit(0);
  }
}