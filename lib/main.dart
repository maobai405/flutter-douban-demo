import 'package:flutter/material.dart';
import 'package:douban_app/components/tabbar.dart'; // 导入自定义的Tabbar组件
import 'package:douban_app/pages/home/home.dart'; // 导入自定义的Home组件
import 'package:douban_app/pages/subject/subject.dart'; // 导入自定义的Subject组件
import 'package:douban_app/pages/group/group.dart'; // 导入自定义的Group组件
import 'package:douban_app/pages/mall/mall.dart'; // 导入自定义的Mall组件
import 'package:douban_app/pages/profile/profile.dart'; // 导入自定义的Profile组件

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '豆瓣App',
      // 修改主题颜色
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.green,
        ), // 用于导航栏、FloatingActionButton等的背景色
        highlightColor: Colors.transparent, // 高亮颜色
        splashColor: Colors.transparent, // 水波纹颜色
      ),
      home: const MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  const MyStackPage({super.key});

  @override
  State<StatefulWidget> createState() => MyStackPageState();
}

class MyStackPageState extends State<MyStackPage> {
  int _currentIndex = 0;

  // 定义底部导航栏的数据
  List tabbarList = [
    {"iconName": "home", "labelName": "首页"},
    {"iconName": "subject", "labelName": "书影音"},
    {"iconName": "group", "labelName": "小组"},
    {"iconName": "mall", "labelName": "市集"},
    {"iconName": "profile", "labelName": "我的"},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 当前选中项的索引
        selectedFontSize: 12, // 选中时的字体大小
        // 固定底部导航栏
        type: BottomNavigationBarType.fixed,
        items: [
          // 遍历TabbarList，生成底部导航栏
          for (var item in tabbarList)
            Tabbar(item['iconName'], item['labelName']),
        ],
        onTap: (int index) => {
          setState(() {
            _currentIndex = index;
          })
        },
      ),
      // 使用IndexedStack来实现页面切换
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile(),
        ],
      ),
    );
  }
}
