class IUser {
  String? uid;
  String? nickName;
  String? thumbnail;
  String? description;

  IUser({
    this.uid,
    this.nickName,
    this.thumbnail,
    this.description,
  });

  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickName: json['nickName'] == null ? '' : json['uid'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['uid'] as String,
      description: json['description'] == null ? '' : json['uid'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickName': nickName,
      'thumbnail': thumbnail,
      'description': description,
    };
  }
}
