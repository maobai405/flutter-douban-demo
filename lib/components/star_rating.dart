import 'package:flutter/material.dart';

class MBStartRating extends StatefulWidget {
  final double rating; // 评分
  final double maxRating; // 最大评分
  final Widget unselectedWidget; // 未选中的Widget
  final Widget selectedWidget; // 选中的Wiget
  final int number; // 评分个数
  final double size; // 评分大小
  final Color unselectedColor; // 默认icon时,未选中的颜色
  final Color selectedColor; // 默认icon时选中的颜色

  MBStartRating({
    Key? key,
    required this.rating,
    this.maxRating = 10,
    Widget? unselectedWidget,
    Widget? selectedWidget,
    this.number = 5,
    this.size = 30,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.orange,
  })  : unselectedWidget = unselectedWidget ??
            Icon(Icons.star, size: size, color: unselectedColor),
        selectedWidget = selectedWidget ??
            Icon(Icons.star, size: size, color: selectedColor),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MBStarRatingState();
  }
}

class _MBStarRatingState extends State<MBStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 渲染未选中Start
        renderUnSelectedStar(),
        // 渲染选中start
        renderSelectedStar(),
      ],
    );
  }

  // 渲染未选中Start
  Widget renderUnSelectedStar() {
    return Row(
      children: List.generate(widget.number, (index) {
        return widget.unselectedWidget;
      }),
    );
  }

  // 渲染选中start
  Widget renderSelectedStar() {
    // 计算整数部分
    int entireNumber =
        (widget.rating / widget.maxRating * widget.number).floor();

    // 计算小数部分
    double decimalNumber = (widget.rating / widget.maxRating * widget.number) -
        (widget.rating / widget.maxRating * widget.number).floor();

    // 计算小数部分的宽度
    double decimalWidth = decimalNumber * widget.size;

    return Row(
      children: List.generate(entireNumber + 1, (index) {
        if (index < entireNumber) return widget.selectedWidget;
        return ClipRect(
          clipper: MyClipper(width: decimalWidth),
          child: widget.selectedWidget,
        );
      }),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  double width;

  MyClipper({
    this.width = 0,
  });

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return width != (oldClipper as MyClipper).width;
  }
}
