// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      created_at: json['created_at'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      private: json['private'] as bool?,
      followers: json['followers'] as int?,
      image_url: json['image_url'] as String?,
      username: json['username'] as String?,
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'created_at': instance.created_at,
      'description': instance.description,
      'id': instance.id,
      'location': instance.location,
      'name': instance.name,
      'private': instance.private,
      'followers': instance.followers,
      'image_url': instance.image_url,
      'username': instance.username,
      'verified': instance.verified,
    };

_$_SearchRequest _$$_SearchRequestFromJson(Map<String, dynamic> json) =>
    _$_SearchRequest(
      limit: json['limit'] as int?,
      query: json['query'] as String?,
    );

Map<String, dynamic> _$$_SearchRequestToJson(_$_SearchRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'query': instance.query,
    };

_$SearchResponseData _$$SearchResponseDataFromJson(Map<String, dynamic> json) =>
    _$SearchResponseData(
      tweets: (json['tweets'] as List<dynamic>?)
          ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SearchResponseDataToJson(
        _$SearchResponseData instance) =>
    <String, dynamic>{
      'tweets': instance.tweets,
      'runtimeType': instance.$type,
    };

_$SearchResponseMerr _$$SearchResponseMerrFromJson(Map<String, dynamic> json) =>
    _$SearchResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SearchResponseMerrToJson(
        _$SearchResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };

_$_TimelineRequest _$$_TimelineRequestFromJson(Map<String, dynamic> json) =>
    _$_TimelineRequest(
      limit: json['limit'] as int?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_TimelineRequestToJson(_$_TimelineRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'username': instance.username,
    };

_$TimelineResponseData _$$TimelineResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$TimelineResponseData(
      tweets: (json['tweets'] as List<dynamic>?)
          ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimelineResponseDataToJson(
        _$TimelineResponseData instance) =>
    <String, dynamic>{
      'tweets': instance.tweets,
      'runtimeType': instance.$type,
    };

_$TimelineResponseMerr _$$TimelineResponseMerrFromJson(
        Map<String, dynamic> json) =>
    _$TimelineResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimelineResponseMerrToJson(
        _$TimelineResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };

_$_Trend _$$_TrendFromJson(Map<String, dynamic> json) => _$_Trend(
      name: json['name'] as String?,
      tweet_volume: json['tweet_volume'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_TrendToJson(_$_Trend instance) => <String, dynamic>{
      'name': instance.name,
      'tweet_volume': instance.tweet_volume,
      'url': instance.url,
    };

_$_TrendsRequest _$$_TrendsRequestFromJson(Map<String, dynamic> json) =>
    _$_TrendsRequest();

Map<String, dynamic> _$$_TrendsRequestToJson(_$_TrendsRequest instance) =>
    <String, dynamic>{};

_$TrendsResponseData _$$TrendsResponseDataFromJson(Map<String, dynamic> json) =>
    _$TrendsResponseData(
      trends: (json['trends'] as List<dynamic>?)
          ?.map((e) => Trend.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TrendsResponseDataToJson(
        _$TrendsResponseData instance) =>
    <String, dynamic>{
      'trends': instance.trends,
      'runtimeType': instance.$type,
    };

_$TrendsResponseMerr _$$TrendsResponseMerrFromJson(Map<String, dynamic> json) =>
    _$TrendsResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TrendsResponseMerrToJson(
        _$TrendsResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      id: json['id'] as int?,
      retweeted_count: json['retweeted_count'] as int?,
      text: json['text'] as String?,
      username: json['username'] as String?,
      created_at: json['created_at'] as String?,
      favourited_count: json['favourited_count'] as int?,
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'retweeted_count': instance.retweeted_count,
      'text': instance.text,
      'username': instance.username,
      'created_at': instance.created_at,
      'favourited_count': instance.favourited_count,
    };

_$_UserRequest _$$_UserRequestFromJson(Map<String, dynamic> json) =>
    _$_UserRequest(
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_UserRequestToJson(_$_UserRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

_$UserResponseData _$$UserResponseDataFromJson(Map<String, dynamic> json) =>
    _$UserResponseData(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Tweet.fromJson(json['status'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserResponseDataToJson(_$UserResponseData instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'status': instance.status,
      'runtimeType': instance.$type,
    };

_$UserResponseMerr _$$UserResponseMerrFromJson(Map<String, dynamic> json) =>
    _$UserResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserResponseMerrToJson(_$UserResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };