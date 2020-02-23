import 'package:flutter_app/models/author.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/post_comment.dart';
import 'package:flutter_app/models/post_image.dart';
import 'package:flutter_app/models/post_tag.dart';

class Post {
  String post_id, post_title, post_content, post_type;
  DateTime updated_at;

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
    this.updated_at = DateTime.parse(jsonObject['updated_at']);

    this.images = jsonObject['images'].map((Map<String, dynamic> jsonImage) {
      return PostImage.fromJson(jsonImage);
    }).toList();

    this.tags = jsonObject['tags'].map((Map<String, dynamic> jsonTag) {
      return PostTag.fromJson(jsonTag);
    }).toList();

    this.comments =
        jsonObject['comments'].map((Map<String, dynamic> jsonComment) {
      return PostComment.fromJson(jsonComment);
    }).toList();

    this.category = Category.fromJson(jsonObject['category']);
    this.author = Author.fromJson(jsonObject['author']);
  }
}
