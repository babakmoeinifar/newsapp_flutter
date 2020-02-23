import 'package:flutter/material.dart';
import 'api/categories_api.dart';
import 'models/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: 'NewsApp'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoriesApi categoriesApi;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: FutureBuilder(
          future: categoriesApi.fetchAllCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return _loading();
                break;

              case ConnectionState.waiting:
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
                  return _drawCategoriesList(snapshot.data);
                }
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _drawCategoriesList(List<Category> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categories[position].title),
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
