import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_dto.g.dart';

// flutter pub run build_runner build
@JsonSerializable()
class VersionDTO {
  VersionDTO(this.version);

  final String version;

  static VersionDTO fromJson(json) => _$VersionDTOFromJson(json);
}