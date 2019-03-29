import 'package:http/http.dart' as http;

class PostRepository {
  
  Future fetchPost() async{
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    return response;
  }
}