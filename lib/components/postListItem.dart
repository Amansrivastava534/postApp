import 'package:flutter/material.dart';
import 'package:flutter_posts_app/components/postController.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  PostListItem({required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.find<PostController>();

    return GestureDetector(
      onTap: () {
        // Mark as read when tapped
        postController.markAsRead(post);
        onTap(); // Call the onTap callback for navigation or other actions
      },
      child: Container(
        decoration: BoxDecoration(
            color: post.isRead ?? false ? Colors.white : Colors.yellow[100],
            borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ]
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(post.title, maxLines: 2, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
