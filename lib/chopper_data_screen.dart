import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'post_service.dart';

class ChopperDataScreen extends StatelessWidget {
  final postService = PostService.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chopper Data")),
      body: FutureBuilder<Response>(
        future: postService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data?.body as List;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(posts[index]['title']),
                subtitle: Text(posts[index]['body']),
              ),
            );
          }
        },
      ),
    );
  }
}
