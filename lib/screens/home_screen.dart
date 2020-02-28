import 'package:flutter/material.dart';
import 'package:flutter_app/shared_ui/list_posts.dart';
import '../api/posts_api.dart';
import '../models/post.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text('Header'),
            ),
          ListTile(
            title: Text('Categories'),
            onTap: () {
              Navigator.of(context).pop(); /*closes drawer in back button*/
              Navigator.pushNamed(context, '/categories'); /* naming route*/
              },
              ),
          ],
          ),
        ),
      body: FutureBuilder(
        future: postsApi.fetchRecentPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
            if(!snapshot.hasData){
              return _error('No data Fetched yet!');
            }
            if(snapshot.hasData){
              return _drawPostsList(snapshot.data, context);
            }
            break;
          }
          return Container();
          },
          ),
      );
  }
}

Widget _drawPostsList(List<Post> data, context) {
  List<Post> postsWithImages = [];
  for(Post post in data){
    if(post.images.length > 0) {
      postsWithImages.add(post);
    }
  }

  return Column(
    children: <Widget>[
    _slider(postsWithImages, context),
    _postsList(data),
    ],
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

Widget _slider(List<Post> data, context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    child:PageView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int position){
        return InkWell(
          onTap: () {
            // TODO
            },
            child: Stack(
              children: <Widget>[
              Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  data[position].images[0].imageUrl
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom:8),
                    color: Colors.grey.withAlpha(80),
                    child: Text(data[position].postTitle, style: TextStyle(fontSize:18),),
                    ),
                  ),
              ],
              ),
            );
        },
        ),
    );
}

Widget _postsList(List<Post> data){
  return Flexible( 
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int position) {
          return PostCard(data[position]);
          onTap:
              () {
            //TODO
          };
        }
            ),
      ),
    );
}