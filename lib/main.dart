import 'package:flutter/material.dart';
import 'screens/categories_list.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
     home: HomeScreen(),
      routes: {
        // '/' => HomeScreen(),
        '/categories' : (BuildContext context) => CategoriesList(),
      },
    );
  }
}

/*
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
          return InkWell(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data[position].title),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPosts(data[position].id)
              ));
            },
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
*/
