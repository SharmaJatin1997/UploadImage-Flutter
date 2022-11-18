class UserModel {
  String? image;
  String? fileName;
  String? thumbnail;
  UserModel(this.image, this.fileName, this.thumbnail,);

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    fileName = json['fileName'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['fileName'] = this.fileName;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
