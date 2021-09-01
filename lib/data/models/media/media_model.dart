
class MediaModel {
  String? id;
  String? name;

  MediaModel({
    this.id,
    this.name,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] ?? "",
      name: json['name'] ?? ""
    );
  }
}
