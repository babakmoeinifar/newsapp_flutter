import 'package:http/http.dart' as http;
import 'api_util.dart';
import 'dart:convert';
import 'package:flutter_app/models/post.dart';

class PostsApi {
  Future<List<Post>> fetchRecentPosts() async {
    String postsUrl = ApiUtil.MAIN_API_URL + ApiUtil.RECENT_POSTS;

    Map<String, String> headers = {
      'Accept': 'application/json'
    };

    var response = await http.get(postsUrl, headers: headers);
    List<Post> posts = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var item in body['data']) {
        Post post = Post.fromJson(item);
        posts.add(post);
      }
    }
    return posts;
  }
}