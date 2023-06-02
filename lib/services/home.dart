// 引入models下的movie.dart文件 用于定义电影模型
import 'package:douban_app/models/home_model.dart';
// 引入utils下的fetch.dart文件 用于发送网络请求
import 'package:douban_app/utils/fetch.dart';

class HomeRequest {
  Future<List<MovieItem>> getHomeList() async {
    // 发送网络请求
    final result = await Fetch.request(
      '/movie/new_movies?apikey=0df993c66c0c636e29ecbb5344252a4a',
    );
    // 将网络请求的结果转换成模型
    final subjects = result.data['subjects'];
    // 定义电影列表
    List<MovieItem> movies = [];
    // 遍历subjects
    for (var item in subjects) {
      movies.add(MovieItem.formMap(item));
    }
    return movies;
  }
}
