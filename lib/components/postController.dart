import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/post_model.dart';

class PostController extends GetxController {
  // Observable list of posts
  RxList<Post> posts = <Post>[].obs;
  RxMap<int, Timer> timers = <int, Timer>{}.obs;

  // Fetch the list of posts from the API
  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      posts.value = data.map((item) => Post.fromJson(item)).toList();
      await _loadReadStatus();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Load the read status of posts from local storage
  Future<void> _loadReadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    for (var post in posts) {
      bool isRead = prefs.getBool('post_${post.id}_read') ?? false;
      post.isRead = isRead;
    }
    update(); // Notify listeners that data has changed
  }

  // Mark a post as read and update local storage
  Future<void> markAsRead(Post post) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('post_${post.id}_read', true);
    post.isRead = true;
    update();
  }
}