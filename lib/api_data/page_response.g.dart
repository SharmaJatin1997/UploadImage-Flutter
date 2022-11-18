// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponse<TModel> _$PageResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    PageResponse<TModel>(
      success: json['success'] as int?,
      status: json['status'] as int?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonTModel).toList(),
      currentPage: json['currentPage'] as int?,
      totalPage: json['totalPage'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$PageResponseToJson<TModel>(
  PageResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('success', instance.success);
  writeNotNull('status', instance.status);
  writeNotNull('statusCode', instance.statusCode);
  writeNotNull('message', instance.message);
  writeNotNull('data', instance.data?.map(toJsonTModel).toList());
  writeNotNull('currentPage', instance.currentPage);
  writeNotNull('totalPage', instance.totalPage);
  writeNotNull('limit', instance.limit);
  return val;
}
