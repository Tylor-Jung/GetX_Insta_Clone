import 'package:get/get.dart';
import 'package:instargram_clone/src/model/post.dart';
import 'package:instargram_clone/src/repository/post_repository.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }

  void _loadFeedList() async {
    PostRepository.loadFeedList();
    var feedList = await PostRepository.loadFeedList();
    postList.addAll(feedList);
    print(feedList.length);
  }
}
