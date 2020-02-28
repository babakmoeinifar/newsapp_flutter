import 'package:flutter/material.dart';
import 'package:flutter_app/models/author.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/post_comment.dart';
import 'package:flutter_app/models/post_image.dart';
import 'package:flutter_app/models/post_tag.dart';

class Post {
  String postId, postTitle, postContent, postType, updatedAt;

  List<PostImage> images;
  List<PostTag> tags;
  List<PostComment> comments;
  Category category;
  Author author;

  Post(
      this.postId,
      this.postTitle,
      this.postContent,
      this.postType,
      this.images,
      this.tags,
      this.comments,
      this.updatedAt,
      this.category,
      this.author);

  Post.fromJson(Map<String, dynamic> jsonObject) {
    this.postId = jsonObject['post_id'].toString();
    this.postTitle = jsonObject['post_title'].toString();
    this.postContent = jsonObject['post_content'].toString();
    this.postType = jsonObject['post_type'].toString();
    this.updatedAt = jsonObject['updated_at'];
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

  String getFeaturedImage() {
    if(this.images.length > 0) {
      return this.images[0].imageUrl;
    }
    return null;
  }

    ImageProvider getPostImage() {
    if(this.getFeaturedImage() == null) {
      return ExactAssetImage('assets/images/placehoder.webp');
    }
    return NetworkImage(this.getFeaturedImage());
  }
}
