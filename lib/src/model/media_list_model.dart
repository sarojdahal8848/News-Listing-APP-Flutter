// To parse this JSON data, do
//
//     final mediaListModel = mediaListModelFromJson(jsonString);

import 'dart:convert';

List<MediaListModel> mediaListModelFromJson(String str) => List<MediaListModel>.from(json.decode(str).map((x) => MediaListModel.fromJson(x)));

String mediaListModelToJson(List<MediaListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MediaListModel {
    MediaListModel({
        this.id,
        this.userId,
        this.name,
        this.imageUrl,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int userId;
    String name;
    String imageUrl;
    String type;
    DateTime createdAt;
    DateTime updatedAt;

    factory MediaListModel.fromJson(Map<String, dynamic> json) => MediaListModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "image_url": imageUrl,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
