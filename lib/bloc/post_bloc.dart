import 'dart:convert';

import 'package:http/http.dart';
import 'package:network/model/post.dart';
import 'package:network/repository/post_repository.dart';
import 'package:rxdart/rxdart.dart';


class PostBloc {
  final postRepository = PostRepository();
  final _postsFetcher = PublishSubject<PostResponse>();

  Observable<PostResponse> get posts => _postsFetcher.stream;
  
  void fetchPost() async {
    var response = await postRepository.fetchPost();
    print("object =>> $response");

    //Parsing data
    var data = PostResponse.fromJson(json.decode(response.body));
    data.listPost.forEach((f) => print("Data ${f.title}"));
    
    //data ditambahkan ke dalam Stream/Pipeline/Pipa
    //data ini akan ditangkap pada halaman post_list_screen.dart
    //pada deklarasi [listen]
    _postsFetcher.sink.add(data);
  }

  void dispose(){
    _postsFetcher.close();
  }
}

final postBloc =PostBloc();