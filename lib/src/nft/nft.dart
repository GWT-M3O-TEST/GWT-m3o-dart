import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../client/client.dart';

part 'nft.freezed.dart';
part 'nft.g.dart';

class NftService {
  final Options opts;
  var _client;

  NftService(this.opts) {
    _client = Client(opts);
  }

  /// Return a list of assets
  Future<AssetsResponse> assets(AssetsRequest req) async {
    Request request = Request(
      service: 'nft',
      endpoint: 'Assets',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return AssetsResponse.Merr(body: err.b);
      }
      return AssetsResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Get a list of collections
  Future<CollectionsResponse> collections(CollectionsRequest req) async {
    Request request = Request(
      service: 'nft',
      endpoint: 'Collections',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return CollectionsResponse.Merr(body: err.b);
      }
      return CollectionsResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Create your own NFT (coming soon)
  Future<CreateResponse> create(CreateRequest req) async {
    Request request = Request(
      service: 'nft',
      endpoint: 'Create',
      body: req.toJson(),
    );

    try {
      Response res = await _client.call(request);
      if (isError(res.body)) {
        final err = Merr(res.toJson());
        return CreateResponse.Merr(body: err.b);
      }
      return CreateResponseData.fromJson(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@Freezed()
class Asset with _$Asset {
  const factory Asset({
    /// number of sales
    int? sales,

    /// Creator of the NFT
    User? creator,

    /// last time sold
    Sale? last_sale,

    /// Owner of the NFT
    User? owner,

    /// id of the asset
    int? id,

    /// listing date
    String? listing_date,

    /// the token id
    String? token_id,

    /// asset contract
    Contract? contract,

    /// the permalink
    String? permalink,

    /// name of the asset
    String? name,

    /// is it a presale
    bool? presale,

    /// associated collection
    Collection? collection,

    /// related description
    String? description,

    /// the image url
    String? image_url,
  }) = _Asset;
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@Freezed()
class AssetsRequest with _$AssetsRequest {
  const factory AssetsRequest({
    /// offset for pagination
    int? offset,

    /// order "asc" or "desc"
    String? order,

    /// order by "sale_date", "sale_count", "sale_price", "total_price"
    String? order_by,

    /// limit to members of a collection by slug name (case sensitive)
    String? collection,

    /// limit returned assets
    int? limit,
  }) = _AssetsRequest;
  factory AssetsRequest.fromJson(Map<String, dynamic> json) =>
      _$AssetsRequestFromJson(json);
}

@Freezed()
class AssetsResponse with _$AssetsResponse {
  const factory AssetsResponse({
    /// list of assets
    List<Asset>? assets,
  }) = AssetsResponseData;
  const factory AssetsResponse.Merr({Map<String, dynamic>? body}) =
      AssetsResponseMerr;
  factory AssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetsResponseFromJson(json);
}

@Freezed()
class Collection with _$Collection {
  const factory Collection({
    String? description,
    String? image_url,
    String? name,
    String? payout_address,
    String? slug,
    String? created_at,
  }) = _Collection;
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@Freezed()
class CollectionsRequest with _$CollectionsRequest {
  const factory CollectionsRequest({
    int? limit,
    int? offset,
  }) = _CollectionsRequest;
  factory CollectionsRequest.fromJson(Map<String, dynamic> json) =>
      _$CollectionsRequestFromJson(json);
}

@Freezed()
class CollectionsResponse with _$CollectionsResponse {
  const factory CollectionsResponse({
    List<Collection>? collections,
  }) = CollectionsResponseData;
  const factory CollectionsResponse.Merr({Map<String, dynamic>? body}) =
      CollectionsResponseMerr;
  factory CollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseFromJson(json);
}

@Freezed()
class Contract with _$Contract {
  const factory Contract({
    /// payout address
    String? payout_address,

    /// aka "ERC1155"
    String? schema,

    /// seller fees
    String? seller_fees,

    /// related symbol
    String? symbol,

    /// type of contract e.g "semi-fungible"
    String? type,

    /// ethereum address
    String? address,

    /// timestamp of creation
    String? created_at,

    /// name of contract
    String? name,

    /// description of contract
    String? description,

    /// owner id
    int? owner,
  }) = _Contract;
  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
}

@Freezed()
class CreateRequest with _$CreateRequest {
  const factory CreateRequest({
    /// data if not image
    String? data,

    /// description
    String? description,

    /// image data
    String? image,

    /// name of the NFT
    String? name,
  }) = _CreateRequest;
  factory CreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestFromJson(json);
}

@Freezed()
class CreateResponse with _$CreateResponse {
  const factory CreateResponse({
    Asset? asset,
  }) = CreateResponseData;
  const factory CreateResponse.Merr({Map<String, dynamic>? body}) =
      CreateResponseMerr;
  factory CreateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseFromJson(json);
}

@Freezed()
class Sale with _$Sale {
  const factory Sale({
    String? event_type,
    Token? payment_token,
    int? asset_decimals,
    String? created_at,
    String? event_timestamp,
    String? quantity,
    String? total_price,
    Transaction? transaction,
    String? asset_token_id,
  }) = _Sale;
  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);
}

@Freezed()
class Token with _$Token {
  const factory Token({
    int? id,
    String? image_url,
    String? name,
    String? symbol,
    String? usd_price,
    String? address,
    int? decimals,
    String? eth_price,
  }) = _Token;
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@Freezed()
class Transaction with _$Transaction {
  const factory Transaction({
    String? transaction_index,
    String? block_hash,
    String? block_number,
    User? from_account,
    int? id,
    String? timestamp,
    User? to_account,
    String? transaction_hash,
  }) = _Transaction;
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@Freezed()
class User with _$User {
  const factory User({
    String? username,
    String? address,
    String? profile_url,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}