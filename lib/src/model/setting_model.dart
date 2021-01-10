// To parse this JSON data, do
//
//     final settingtModel = settingtModelFromJson(jsonString);

import 'dart:convert';

SettingtModel settingtModelFromJson(String str) => SettingtModel.fromJson(json.decode(str));

String settingtModelToJson(SettingtModel data) => json.encode(data.toJson());

class SettingtModel {
    SettingtModel({
        this.message,
        this.data,
    });

    String message;
    List<Datum> data;

    factory SettingtModel.fromJson(Map<String, dynamic> json) => SettingtModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.userId,
        this.appColor,
        this.appTextColor,
        this.appIconColor,
        this.appName,
        this.tabColor,
        this.rateUsLink,
        this.shareLink,
        this.shareSubject,
        this.imageUrl,
        this.privacyPolicyLink,
        this.termsConditionLink,
        this.disclaimerLink,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int userId;
    var appColor;
    var appTextColor;
    var appIconColor;
    String appName;
    var tabColor;
    String rateUsLink;
    String shareLink;
    String shareSubject;
    String imageUrl;
    String privacyPolicyLink;
    String termsConditionLink;
    String disclaimerLink;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        appColor: json["app_color"],
        appTextColor: json["app_text_color"],
        appIconColor: json["app_icon_color"],
        appName: json["app_name"],
        tabColor: json["tab_color"],
        rateUsLink: json["rate_us_link"],
        shareLink: json["share_link"],
        shareSubject: json["share_subject"],
        imageUrl: json["image_url"],
        privacyPolicyLink: json["privacy_policy_link"],
        termsConditionLink: json["terms_condition_link"],
        disclaimerLink: json["disclaimer_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "app_color": appColor,
        "app_text_color": appTextColor,
        "app_icon_color": appIconColor,
        "app_name": appName,
        "tab_color": tabColor,
        "rate_us_link": rateUsLink,
        "share_link": shareLink,
        "share_subject": shareSubject,
        "image_url": imageUrl,
        "privacy_policy_link": privacyPolicyLink,
        "terms_condition_link": termsConditionLink,
        "disclaimer_link": disclaimerLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
