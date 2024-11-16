import 'package:flutter/material.dart';
import 'package:flutter_posts_app/components/postController.dart';
import 'package:flutter_posts_app/screens/postListPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the PostController and fetch posts when the app starts
    final PostController postController = Get.put(PostController());
    postController.fetchPosts(context);  // Fetch the posts on app start
  }

  @override
  Widget build(BuildContext context) {
    return PostListScreen();
  }
}
