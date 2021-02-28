
class NewsApiModel {
  String Status;
  int TotalResults;
  List<Articles> ArticlesList;


  NewsApiModel(this.Status, this.TotalResults, this.ArticlesList);

  NewsApiModel.fromjson(Map<String, dynamic>map){
    var mapArticles = map['articles'] as List;
    Status = map["status"];
    TotalResults = map["totalResults"];
    ArticlesList = mapArticles.map((jason) => Articles.fromjson(jason)).toList();
  }
}

class Articles {
  Source source;
  String Author;
  String Title;
  String Description;
  String Url;
  String UrlToImage;
  String PublishedAt;
  String Content;

  Articles(this.source, this.Author, this.Title, this.Description, this.Url,
      this.UrlToImage, this.PublishedAt, this.Content);

  Articles.fromjson(Map<String, dynamic>map){
    source =  Source.fromjson(map['source']);
    Author = map["author"];
    Title = map["title"];
    Description = map["description"];
    Url = map["url"];
    UrlToImage = map["urlToImage"];
    PublishedAt = map["publishedAt"];
    Content = map["content"];
  }

  //PARA LA CLASE DE LISTA DE FAVORITOS
  Map<String, dynamic> toJson() => {
    "source": this.source.toJson(),
    "author": this.Author,
    "title":this.Title,
    "description": this.Description,
    "url": this.Url,
    "urlToImage": this.UrlToImage,
    "publishedAt": this.PublishedAt,
    "content": this.Content
  };

}

class Source {
  String Id;
  String Name;

  Source(this.Id, this.Name);

  Source.fromjson(Map<String, dynamic>map){
    Id = map["id"];
    Name = map["name"];
  }

  Map<String, dynamic> toJson() => {
    "id": this.Id,
    "name": this.Name,
  };
}