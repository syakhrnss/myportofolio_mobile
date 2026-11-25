import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Proyek portofolio yang disinkronkan dengan API Django REST Framework.
///
/// Field mengikuti ProjectSerializer di backend: id, title, subtitle,
/// image, description. Field lain dari API (star_count dan sebagainya)
/// diabaikan.
@JsonSerializable()
class Project {
  const Project({
    this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    this.image = '',
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// Dibuat oleh server, jadi tidak ikut dikirim saat POST.
  /// Di backend ini id berupa angka, jadi diubah menjadi String.
  @JsonKey(includeToJson: false, fromJson: _idFromJson)
  final String? id;
  final String title;
  final String subtitle;
  final String description;

  /// URL gambar (opsional). Jika kosong/null dari server, nilainya jadi ''.
  @JsonKey(defaultValue: '')
  final String image;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

String? _idFromJson(Object? value) => value?.toString();
