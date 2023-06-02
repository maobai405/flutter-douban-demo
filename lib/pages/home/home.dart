import 'package:flutter/material.dart';
// 引入models下的movie.dart文件 用于定义电影模型
import 'package:douban_app/models/home_model.dart';
// 引入services下的home.dart文件 用于发送网络请求
import 'package:douban_app/services/home.dart';
// 引入子组件home_list_item.dart
import 'children/home_list_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // 初始化HomeRequest类
  HomeRequest homeRequest = HomeRequest();
  // 定义请求开始的索引
  int start = 0;
  // 定义请求结束的索引
  int end = 10;

  // 定义电影列表
  List<MovieItem> movies = [];

  // 定义请求电影列表的方法
  void getHomeList() async {
    // 发送网络请求
    final result = await homeRequest.getHomeList();
    print(result);
    // 将网络请求的结果转换成模型
    setState(() {
      movies.addAll(result);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 调用请求电影列表的方法
    getHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return HomeListItem(movies[index]);
        },
      ),
    );
  }
}
