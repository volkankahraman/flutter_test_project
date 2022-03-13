import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post extends Equatable {
  const Post({
    required this.id,
    required this.image,
    required this.title,
    required this.body,
    required this.firstName,
    required this.lastName,
    required this.created,
  });

  final int id;
  final String image;
  final String title;
  final String body;
  final String firstName;
  final String lastName;
  final String created;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        body: json["body"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "body": body,
        "first_name": firstName,
        "last_name": lastName,
        "created": created,
      };
  Post copyWith(
          {int? id,
          String? image,
          String? title,
          String? body,
          String? firstName,
          String? lastName,
          String? created}) =>
      Post(
          id: id ?? this.id,
          body: body ?? this.body,
          created: created ?? this.body,
          firstName: firstName ?? this.firstName,
          image: image ?? this.firstName,
          lastName: lastName ?? this.lastName,
          title: title ?? this.title);

  @override
  List<Object?> get props =>
      [id, image, title, body, firstName, lastName, created];
}
