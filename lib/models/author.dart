class Author {
  String author_id, name, author_email, avatar;

  Author(this.author_id, this.name, this.author_email, this.avatar);

  Author.fromJson(Map<String, dynamic> jsonObject){
    this.author_id = jsonObject['author_id'].toString();
    this.name = jsonObject['name'].toString();
    this.author_email = jsonObject['author_email'].toString();
    this.avatar = jsonObject['avatar'].toString();
  }
}