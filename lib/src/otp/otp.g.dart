// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenerateRequest _$$_GenerateRequestFromJson(Map<String, dynamic> json) =>
    _$_GenerateRequest(
      expiry: json['expiry'] as int?,
      id: json['id'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$$_GenerateRequestToJson(_$_GenerateRequest instance) =>
    <String, dynamic>{
      'expiry': instance.expiry,
      'id': instance.id,
      'size': instance.size,
    };

_$GenerateResponseData _$$GenerateResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$GenerateResponseData(
      code: json['code'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateResponseDataToJson(
        _$GenerateResponseData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$GenerateResponseMerr _$$GenerateResponseMerrFromJson(
        Map<String, dynamic> json) =>
    _$GenerateResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateResponseMerrToJson(
        _$GenerateResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };

_$_ValidateRequest _$$_ValidateRequestFromJson(Map<String, dynamic> json) =>
    _$_ValidateRequest(
      code: json['code'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ValidateRequestToJson(_$_ValidateRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
    };

_$ValidateResponseData _$$ValidateResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$ValidateResponseData(
      success: json['success'] as bool?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ValidateResponseDataToJson(
        _$ValidateResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'runtimeType': instance.$type,
    };

_$ValidateResponseMerr _$$ValidateResponseMerrFromJson(
        Map<String, dynamic> json) =>
    _$ValidateResponseMerr(
      body: json['body'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ValidateResponseMerrToJson(
        _$ValidateResponseMerr instance) =>
    <String, dynamic>{
      'body': instance.body,
      'runtimeType': instance.$type,
    };
