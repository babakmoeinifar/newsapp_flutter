class Category {

  String id, title, color;

  // first constructor
  Category(this.id, this.title, this.color);

  // second constructor
  Category.fromJson(Map<String, dynamic> jsonObject){
      this.id = jsonObject['category_id'].toString();
      this.title = jsonObject['category_title'].toString();
      this.color = jsonObject['category_color'].toString();
  }

}