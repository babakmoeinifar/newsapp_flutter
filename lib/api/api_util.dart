class ApiUtil {

  static const String MAIN_API_URL = 'localhost:8000/api';
  static const String ALL_CATEGORIES = '/categories';

  static String categoryPosts(String categoryId) {
    return MAIN_API_URL + ALL_CATEGORIES + '/' +  categoryId + '/posts';
  }
}
