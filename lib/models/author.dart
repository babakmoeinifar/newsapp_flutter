class Author {
  String authorId, name, authorEmail, avatar;

  Author(this.authorId, this.name, this.authorEmail, this.avatar);

  Author.fromJson(Map<String, dynamic> jsonObject){
    this.authorId = jsonObject['author_id'].toString();
    this.name = jsonObject['name'].toString();
    this.authorEmail = jsonObject['author_email'].toString();
    this.avatar = jsonObject['avatar'].toString();
  }
}