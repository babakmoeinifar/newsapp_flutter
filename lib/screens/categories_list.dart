 import 'package:flutter/material.dart';
import 'package:flutter_app/api/categories_api.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/category_posts.dart';
 
  class CategoriesList extends StatefulWidget{
    @override
    _CategoriesListState createState() => _CategoriesListState();
  }
 
  class _CategoriesListState extends State<CategoriesList> {
    CategoriesApi categoriesApi = CategoriesApi();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('categories'),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: FutureBuilder(
            future: categoriesApi.fetchAllCategories(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return _loading();
                  break;

                case ConnectionState.none:
                  return _error('No connection has been made!');
                  break;

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return _error(snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return _drawCategoriesList(snapshot.data, context);
                  }
                  break;
              }
              return Container();
            },
          ),
        ),
      );
    }

    Widget _drawCategoriesList(List<Category> data, BuildContext context) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int position) {
          String hexColor = data[position].color.replaceAll('#', '0xFF');
          return Card(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 2,
                    child: Container(
                      color: Color(int.parse(hexColor)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPosts(data[position].id)
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(data[position].title, style: TextStyle(
                        fontSize: 22
                    ),),
                  ),
                ),
              ],
            ),
          );
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
  }
 