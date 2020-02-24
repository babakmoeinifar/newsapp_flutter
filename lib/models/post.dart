import 'package:flutter_app/models/author.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/post_comment.dart';
import 'package:flutter_app/models/post_image.dart';
import 'package:flutter_app/models/post_tag.dart';

class Post {
  String post_id, post_title, post_content, post_type, updated_at;

  List<PostImage> images;
  List<PostTag> tags;
  List<PostComment> comments;
  Category category;
  Author author;

  Post(
      this.post_id,
      this.post_title,
      this.post_content,
      this.post_type,
      this.images,
      this.tags,
      this.comments,
      this.updated_at,
      this.category,
      this.author);

  Post.fromJson(Map<String, dynamic> jsonObject) {
    this.post_id = jsonObject['post_id'].toString();
    this.post_title = jsonObject['post_title'].toString();
    this.post_content = jsonObject['post_content'].toString();
    this.post_type = jsonObject['post_type'].toString();
    this.updated_at = jsonObject['updated_at'];
    this.category = Category.fromJson(jsonObject['category']);
    this.author = Author.fromJson(jsonObject['author']);

    this.images = [];
    for(var item in jsonObject['images']) {
      images.add(PostImage.fromJson(item));
    }

    this.tags = [];
    for(var item in jsonObject['tags']) {
      tags.add(PostTag.fromJson(item));
    }

    this.comments = [];
    for(var item in jsonObject['comments']) {
      comments.add(PostComment.fromJson(item));
    }
  }
}
