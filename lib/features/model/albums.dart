import 'package:json_annotation/json_annotation.dart';
part 'albums.g.dart';

@JsonSerializable()
class Albums {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Albums({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Albums.fromJson(Map<String, dynamic> json) => _$AlbumsFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsToJson(this);
}
