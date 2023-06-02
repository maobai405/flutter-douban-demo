import 'package:flutter/material.dart';
import 'package:douban_app/models/home_model.dart';
// 引入虚线组件
import 'package:douban_app/components/dashed_line.dart';
// 引入StartRating组件
import 'package:douban_app/components/star_rating.dart';

class HomeListItem extends StatelessWidget {
  // 定义电影列表模型
  final MovieItem item;

  const HomeListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 10,
            color: Color(0xffe2e2e2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1.1 渲染电影排名
          renderRankWidget(),
          const SizedBox(height: 10),
          // 1.2 渲染电影详情
          renderDetailWidget(),
          const SizedBox(height: 10),
          // 1.3 渲染电影原始名称
          renderOriginTitleWidget(),
        ],
      ),
    );
  }

  // 1.1定义渲染电影列表的方法
  Widget renderRankWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        'No.${item.rank}',
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131, 95, 36),
        ),
      ),
    );
  }

  // 1.2定义渲染电影详情的方法
  Widget renderDetailWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1.2.1 渲染电影图片
        renderImageWidget(),
        // 1.2.2 渲染电影信息
        renderMovieInfoWidget(),
        // 1.2.3 渲染虚线
        renderDashedWidget(),
        // 1.2.4 渲染想看
        renderWishWidget(),
      ],
    );
  }

  // 1.2.1 定义渲染电影图片的方法
  Widget renderImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(item.imageUrl, height: 150),
    );
  }

  // 1.2.2 定义渲染电影信息的方法
  Widget renderMovieInfoWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // 垂直居中
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        // 图标
                        const WidgetSpan(
                          child: Icon(Icons.play_circle_outline,
                              color: Colors.red, size: 22),
                        ),
                        // 电影名称
                        TextSpan(
                          text: item.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        // 电影上映时间
                        TextSpan(
                          text: '(${item.pubDate})',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 电影评分
            Row(
              children: [
                MBStartRating(
                  rating: item.rating,
                  size: 20,
                ),
                Text(item.rating.toString(),
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            renderMovieSummaryWidget(),
          ],
        ),
      ),
    );
  }

  // 1.2.2-2 定义渲染电影简介的方法
  Widget renderMovieSummaryWidget() {
    final genresString = item.genres.join(' ');
    final directorString = item.director[0].name;
    final actorString = item.casts.join(' ');

    return Text(
      '$genresString / $directorString / $actorString',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, color: Colors.black54),
    );
  }

  // 1.2.3定义渲染虚线的方法
  Widget renderDashedWidget() {
    return const SizedBox(
      width: 1,
      height: 150,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: 1,
        dashedHeight: 10,
        count: 10,
      ),
    );
  }

  // 1.2.4 定义渲染想看的方法
  Widget renderWishWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            'assets/images/home/wish.png',
            width: 32,
          ),
          const SizedBox(height: 8),
          const Text(
            '想看',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 236, 168, 54),
            ),
          )
        ],
      ),
    );
  }

  // 1.3定义渲染电影原始名称的方法
  Widget renderOriginTitleWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 241, 245),
      ),
      child: Text(
        item.originalTitle,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }
}
