import 'package:flutter_app/models/author.dart';

class PostComment {
  String commentId, comment;
  Author author;

  PostComment(this.commentId, comment);

  PostComment.fromJson(Map<String, dynamic> jsonObject) {
    this.commentId = jsonObject['comment_id'].toString();
    this.comment = jsonObject['comment'].toString();
    this.author = Author.fromJson(jsonObject['author']);
  }
}