import 'package:http/http.dart' as http;
import 'api_util.dart';

class CategoriesApi {

  fetchAllCategories() async{
    String allCategories = ApiUtil.MAIN_API_URL + ApiUtil.ALL_CATEGORIES;
    Map<String,String> headers = {
      'Accept' : 'application/json'
    };
    var response = await http.get(allCategories, headers: headers);
    
    print(response.statusCode);
    print(response.body);
  }
}