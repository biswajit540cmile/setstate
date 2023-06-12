class GetResponse {
  int userId;
  int id;
  String title;

  GetResponse({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory GetResponse.fromJson(Map<String, dynamic> json) => GetResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}