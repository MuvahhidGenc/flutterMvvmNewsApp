class ModelNewsArticle{
  String title;
  String publishedAt;
  String description;
  String url;
  String urlToImage;


  ModelNewsArticle({this.title,this.description,this.url,this.urlToImage,this.publishedAt});

  factory ModelNewsArticle.fromJson(Map<String,dynamic> json){
    return ModelNewsArticle(
      title: json["title"],
      publishedAt: json["publishedAt"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"]
    );
  }


}