import 'package:flutter/material.dart';
import 'package:network/bloc/post_bloc.dart';
import 'package:network/model/post.dart';
import 'package:network/screen/post_detail_screen.dart';

class PostListScreen extends StatefulWidget {
  final Widget child;

  PostListScreen({Key key, this.child}) : super(key: key);

  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    postBloc.fetchPost();
    postBloc.posts.listen((onData) {
      onData.listPost.forEach((f) => print("Data Listen :+>> ${f.title}"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
      ),
      body: Container(
          child: StreamBuilder(
        stream: postBloc.posts,
        builder: (context, AsyncSnapshot<PostResponse> snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemCount: snap.data.listPost.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: snap.data.listPost[index]),
                      ),
                    );
                  },
                  title: Text(snap.data.listPost[index].title),
                );
              },
            );
          } else {
            return Container(
              child: Text("No data"),
            );
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.fetchPost();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
