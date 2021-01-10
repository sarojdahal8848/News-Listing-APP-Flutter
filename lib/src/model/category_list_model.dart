// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

List<CategoryListModel> categoryListModelFromJson(String str) => List<CategoryListModel>.from(json.decode(str).map((x) => CategoryListModel.fromJson(x)));

String categoryListModelToJson(List<CategoryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListModel {
    CategoryListModel({
        this.id,
        this.mediaId,
        this.title,
        this.newsUrl,
    });

    int id;
    int mediaId;
    String title;
    String newsUrl;

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        id: json["id"],
        mediaId: json["media_id"],
        title: json["title"],
        newsUrl: json["news_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media_id": mediaId,
        "title": title,
        "news_url": newsUrl,
    };
}
