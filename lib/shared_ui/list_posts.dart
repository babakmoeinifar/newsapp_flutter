import 'package:flutter/material.dart';
import 'package:flutter_app/screens/single_post.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SinglePostScreen(post)),
            );
          },
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16),
                width: MediaQuery.of(context).size.width * 0.25,
                child: Image(
                  image: post.getPostImage(),
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.postTitle,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          post.author.name,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          post.updatedAt,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
