class PostImage {
  String imageId, imageDescription, imageUrl, postId, isFeatured;

  PostImage(this.imageId, this.imageDescription, this.imageUrl, this.postId, this.isFeatured);

  PostImage.fromJson(Map<String, dynamic> jsonObject) {
    this.imageId = jsonObject['image_id'].toString();
    this.imageDescription = jsonObject['image_description'].toString();
    this.imageUrl = jsonObject['image_url'].toString();
    this.postId = jsonObject['post_id'].toString();
    this.isFeatured = jsonObject['is_featured'];
  }
}