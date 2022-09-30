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
      nickName: json['nickName'] == null ? '' : json['nickName'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
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

  IUser copyWith({
    String? uid,
    String? nickName,
    String? thumbnail,
    String? description,
  }) {
    return IUser(
      uid: uid ?? this.uid,
      nickName: nickName ?? this.nickName,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
