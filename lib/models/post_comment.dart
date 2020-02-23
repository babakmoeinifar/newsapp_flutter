import 'package:flutter_app/models/author.dart';

class PostComment {
  String comment_id, comment;
  Author author;

  PostComment(this.comment_id, comment) 

  PostComment.fromJson(Map<String, dynamic> jsonObject) {
    this.comment_id = jsonObject['comment_id'].toString();
    this.comment = jsonObject['comment'].toString();
    this.author = Author.fromJson(jsonObject['author']);
  }
}