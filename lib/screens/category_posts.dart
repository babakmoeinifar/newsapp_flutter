import 'package:flutter/material.dart';
import 'package:flutter_app/api/categories_api.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/shared_ui/list_posts.dart';

class CategoryPosts extends StatefulWidget{
  final String categoryId;

  CategoryPosts(this.categoryId);

  @override
  _CategoryPostState createState() => _CategoryPostState();
  }
  
  class _CategoryPostState extends State<CategoryPosts> {

  CategoriesApi categoriesApi = CategoriesApi();

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: categoriesApi.fetchPostsForCategory(widget.categoryId),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.none:
                  return _error('No Connection made!');
                  break;

                case ConnectionState.waiting:
                case ConnectionState.active:
                  return _loading();
                  break;

                case ConnectionState.done:
                  if(snapshot.hasError){
                    return _error(snapshot.error.toString());
                  }
                  if(snapshot.hasData){
                    return _darwPostsList(snapshot.data);
                  }
                  break;
              }
              return Container();
            },
          ),
        ),
      );
    }

}

Widget _darwPostsList(List<Post> data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int position) {
      return PostCard(data[position]);
    },
  );
}

Widget _loading() {
  return Container(
    child: Center(child: CircularProgressIndicator()),
  );
}

Widget _error(String error) {
  return Container(
    child: Center(
        child: Text(
          error,
          style: TextStyle(color: Colors.red),
        )),
  );
}