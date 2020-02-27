import 'package:flutter/material.dart';
import '../models/post.dart';


class PostCard extends StatelessWidget {
  
  final Post post;

  PostCard(this.post);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          //
        },
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(post.images[0]),
            ),
          ],
        ),
      ),
    );
  }
}