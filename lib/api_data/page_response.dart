import 'package:json_annotation/json_annotation.dart';

part 'page_response.g.dart';

@JsonSerializable(genericArgumentFactories: true,includeIfNull: false, explicitToJson: true)
class PageResponse<TModel>{

  int? success;
  int? status;
  int? statusCode;
  String? message;
  List<TModel>? data;
  int? currentPage;
  int? totalPage;
  int? limit;

  PageResponse({this.success, this.status, this.statusCode, this.message, this.data,this.currentPage,this.totalPage,this.limit});

  factory PageResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$PageResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$PageResponseToJson(this, toJsonT);
}