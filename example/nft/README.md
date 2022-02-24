# Nft

An [m3o.com](https://m3o.com) API. For example usage see [m3o.com/nft/api](https://m3o.com/nft/api).

Endpoints:

## Collections

Get a list of collections


[https://m3o.com/nft/api#Collections](https://m3o.com/nft/api#Collections)

```dart
import 'dart:io';

import 'package:m3o/src/client/client.dart';
import 'package:m3o/src/nft/nft.dart';

void main() async {
  final token = Platform.environment['M3O_API_TOKEN']!;
  final ser = NftService(
    Options(
      token: token,
      address: liveAddress,
    ),
  );
 
  final payload = <String, dynamic>{
  "limit": 1
,};

  CollectionsRequest req = CollectionsRequest.fromJson(payload);

  
  try {

	CollectionsResponse res = await ser.collections(req);

    res.map((value) => print(value),
	  Merr: (CollectionsResponseMerr err) => print(err.body!['body']));	
  
  } catch (e) {
    print(e);
  } finally {
    exit(0);
  }
}
```
## Assets

Return a list of assets


[https://m3o.com/nft/api#Assets](https://m3o.com/nft/api#Assets)

```dart
import 'dart:io';

import 'package:m3o/src/client/client.dart';
import 'package:m3o/src/nft/nft.dart';

void main() async {
  final token = Platform.environment['M3O_API_TOKEN']!;
  final ser = NftService(
    Options(
      token: token,
      address: liveAddress,
    ),
  );
 
  final payload = <String, dynamic>{
  "limit": 1,
  "order_by": "sale_date"
,};

  AssetsRequest req = AssetsRequest.fromJson(payload);

  
  try {

	AssetsResponse res = await ser.assets(req);

    res.map((value) => print(value),
	  Merr: (AssetsResponseMerr err) => print(err.body!['body']));	
  
  } catch (e) {
    print(e);
  } finally {
    exit(0);
  }
}
```
## Create

Create your own NFT (coming soon)


[https://m3o.com/nft/api#Create](https://m3o.com/nft/api#Create)

```dart
import 'dart:io';

import 'package:m3o/src/client/client.dart';
import 'package:m3o/src/nft/nft.dart';

void main() async {
  final token = Platform.environment['M3O_API_TOKEN']!;
  final ser = NftService(
    Options(
      token: token,
      address: liveAddress,
    ),
  );
 
  final payload = <String, dynamic>{
  "description": "The epic monkey island character",
  "name": "Guybrush Threepwood"
,};

  CreateRequest req = CreateRequest.fromJson(payload);

  
  try {

	CreateResponse res = await ser.create(req);

    res.map((value) => print(value),
	  Merr: (CreateResponseMerr err) => print(err.body!['body']));	
  
  } catch (e) {
    print(e);
  } finally {
    exit(0);
  }
}
```
