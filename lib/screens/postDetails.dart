import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/snackBar.dart';
import '../model/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;

  PostDetailScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: FutureBuilder(
        future: fetchPostDetails(postId,context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var post = snapshot.data as Post;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(post.body),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<Post> fetchPostDetails(int postId,BuildContext context) async {
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));
      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load post details');
      }
    }on SocketException catch(e){
      showCustomSnackBar(context,e.toString(),isError:false);
      rethrow;
    }
    catch(e){
      showCustomSnackBar(context,'Unexpected error: $e',isError:false);
      rethrow;
    }

  }
}
