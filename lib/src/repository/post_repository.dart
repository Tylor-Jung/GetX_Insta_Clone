import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instargram_clone/src/model/post.dart';

class PostRepository {
  static Future<void> updatePost(Post postData) async {
    await FirebaseFirestore.instance.collection('posts').add(postData.toMap());
  }

  static Future<List<Post>> loadFeedList() async {
    var documnet = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createAt', descending: true)
        .limit(10);
    var data = await documnet.get();
    return data.docs.map<Post>((e) => Post.fromJson(e.id, e.data())).toList();
  }
}
