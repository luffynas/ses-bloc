import 'package:flutter/material.dart';
import 'package:network/model/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Post",),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(post.title, style: TextStyle(fontSize: 22, color: Colors.blue)),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text('Post ID : ${post.id}'),
          ),
          Text(post.body),
        ],
      ),
      )
    );
  }
}