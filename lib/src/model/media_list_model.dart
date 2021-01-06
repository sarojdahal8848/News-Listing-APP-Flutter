// To parse this JSON data, do
//
//     final mediaListModel = mediaListModelFromJson(jsonString);

import 'dart:convert';

List<MediaListModel> mediaListModelFromJson(String str) => List<MediaListModel>.from(json.decode(str).map((x) => MediaListModel.fromJson(x)));

String mediaListModelToJson(List<MediaListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MediaListModel {
    MediaListModel({
        this.id,
        this.name,
        this.imageUrl,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String imageUrl;
    String type;
    dynamic createdAt;
    dynamic updatedAt;

    factory MediaListModel.fromJson(Map<String, dynamic> json) => MediaListModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
