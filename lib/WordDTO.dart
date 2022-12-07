import 'package:freezed_annotation/freezed_annotation.dart';

part 'WordDTO.g.dart';

@JsonSerializable()
class WordDTO {

  WordDTO(this.uid, this.author, this.content, this.latitude, this.longitude);

  final int? uid;
  final String? author;
  final String? content;
  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toJson() => _$WordDTOToJson(this);

  factory WordDTO.fromJson(Map<String, dynamic> json) => _$WordDTOFromJson(json);

  static fromMap(Map<String, Object?> map) => WordDTO.fromJson(map);
}