import 'package:flutter/material.dart';
import 'package:flutter_posts_app/screens/postDetails.dart';
import 'package:get/get.dart';
import '../components/postController.dart';
import '../components/postListItem.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: Obx(() {
        if (postController.posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());  // Show loading indicator if no posts are fetched
        } else {
          return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              var post = postController.posts[index];
              return PostListItem(
                post: post,
                onTap: () {
                  // Navigate to post detail screen
                  Get.to(PostDetailScreen(postId: post.id))?.then((_) {
                    // After returning from the detail screen, refresh the list
                    postController.fetchPosts(context);
                  });
                },
              );
            },
          );
        }
      }),
    );
  }
}
