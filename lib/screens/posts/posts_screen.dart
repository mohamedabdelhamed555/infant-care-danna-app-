// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:graduation/widget/posts/posts_list_view.dart';

class postScreen extends StatefulWidget {
  const postScreen({super.key});

  @override
  State<postScreen> createState() => _postScreenState();
}

class _postScreenState extends State<postScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff32AA90),
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const PostsListView(),
    );
  }
}
