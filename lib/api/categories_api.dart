import 'package:http/http.dart' as http;
import 'api_util.dart';
import 'dart:convert';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/post.dart';

class CategoriesApi {

  Future<List<Category>> fetchAllCategories() async{
    String allCategories = ApiUtil.MAIN_API_URL + ApiUtil.ALL_CATEGORIES;
    Map<String,String> headers = {
      'Accept' : 'application/json'
    };
    var response = await http.get(allCategories, headers: headers);
    List<Category> categories = [];

    if(response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var item in body['data']){
        Category category = Category.fromJson(item);
        categories.add(category);
      }
    }
      return categories;
  }

  Future<List<Post>> fetchPostsForCategory(String categoryId) async{
    String categoryPosts = ApiUtil.MAIN_API_URL + ApiUtil.categoryPosts(categoryId);
    Map<String,String> headers = {
      'Accept' : 'application/json'
    };
    var response = await http.get(categoryPosts, headers: headers);
    List<Post> posts = [];

    if(response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var item in body['data']) {
        Post post = Post.fromJson(item);
        posts.add(post);
      }
    }
    return posts;
  }
}
