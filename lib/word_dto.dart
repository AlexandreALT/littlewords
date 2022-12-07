import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_dto.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable() // Va permettre de genere des methodes from et toJson
class WordDTO {

  // Constructeur
  WordDTO(this.uid, this.author, this.content, this.latitude, this.longitude);

  // Attributs
  final int? uid;
  final String? author;
  final String? content;
  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toJson() => _$WordDTOToJson(this);

  factory WordDTO.fromJson(Map<String, dynamic> json) => _$WordDTOFromJson(json);

  static fromMap(Map<String, Object?> map) => WordDTO.fromJson(map);
}