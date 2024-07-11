// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:graduation/models/post_model.dart';
import 'package:graduation/services/community_service.dart';
import 'package:graduation/widget/posts/post_card.dart';
import 'package:dio/dio.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({super.key});

  @override
  _PostsListViewState createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  final ArticleServices articleServices = ArticleServices(Dio());
  late Future<List<ArticleModel>> articles;

  @override
  void initState() {
    super.initState();
    articles = articleServices.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FutureBuilder<List<ArticleModel>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No articles found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PostCard(
                  post: snapshot.data![index].toPostModel(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
