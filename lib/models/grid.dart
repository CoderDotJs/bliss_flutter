import 'dart:convert';

class Grid {
    final int? userId;
    final int? id;
    final String? title;
    final bool? completed;

    Grid({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory Grid.fromRawJson(String str) => Grid.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Grid.fromJson(Map<String, dynamic> json) => Grid(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
