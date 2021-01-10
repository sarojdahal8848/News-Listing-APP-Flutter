// To parse this JSON data, do
//
//     final youtubeTrendingVideoModel = youtubeTrendingVideoModelFromJson(jsonString);

import 'dart:convert';

List<YoutubeTrendingVideoModel> youtubeTrendingVideoModelFromJson(String str) => List<YoutubeTrendingVideoModel>.from(json.decode(str).map((x) => YoutubeTrendingVideoModel.fromJson(x)));

String youtubeTrendingVideoModelToJson(List<YoutubeTrendingVideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YoutubeTrendingVideoModel {
    YoutubeTrendingVideoModel({
        this.title,
        this.videoId,
        this.thumbnail,
    });

    String title;
    String videoId;
    String thumbnail;

    factory YoutubeTrendingVideoModel.fromJson(Map<String, dynamic> json) => YoutubeTrendingVideoModel(
        title: json["title"],
        videoId: json["video_id"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "video_id": videoId,
        "thumbnail": thumbnail,
    };
}
