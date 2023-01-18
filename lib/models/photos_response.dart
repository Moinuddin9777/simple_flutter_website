// To parse this JSON data, do
//
//     final photosResponse = photosResponseFromJson(jsonString);

import 'dart:convert';

List<PhotosResponse> photosResponseFromJson(String str) =>
    List<PhotosResponse>.from(
        json.decode(str).map((x) => PhotosResponse.fromJson(x)));

String photosResponseToJson(List<PhotosResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosResponse {
  PhotosResponse({
    this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int? albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotosResponse.fromJson(Map<String, dynamic> json) => PhotosResponse(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
