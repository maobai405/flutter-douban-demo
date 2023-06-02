int counter = 1;

// 定义电影列表模型
class MovieItem {
  late int rank; // 排名
  late String imageUrl; // 图片地址
  late String title; // 电影名称
  late String pubDate; // 上映日期
  late double rating; // 评分
  late List<String> genres; // 类型
  late List<Actor> casts; // 演员
  late List<Director> director; // 导演
  late String originalTitle; // 原始名称

  MovieItem.formMap(Map<String, dynamic> json) {
    rank = counter++;
    imageUrl = json['images']['medium'] ?? '';
    title = json['title'] ?? '';
    pubDate = json['year'] ?? '';
    rating = json['rating']?['average'] ?? 0.0;
    genres = json['genres'].cast<String>() ?? '';
    casts = (json['casts'] as List<dynamic>)
        .map((item) => Actor.formMap(item))
        .toList();
    director = (json['directors'] as List<dynamic>)
        .map((item) => Director.formMap(item))
        .toList();
    originalTitle = json['original_title'] ?? '';
  }
}

class Person {
  late String name; // 姓名
  late String avatarUrl; // 头像地址

  Person.formMap(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    avatarUrl = json['avatars']?['medium'] ?? '';
  }
}

class Actor extends Person {
  Actor.formMap(Map<String, dynamic> json) : super.formMap(json);

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}

class Director extends Person {
  Director.formMap(Map<String, dynamic> json) : super.formMap(json);
}
