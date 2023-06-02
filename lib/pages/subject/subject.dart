import 'package:flutter/material.dart';
// 引入components下的dashed_line.dart文件
import 'package:douban_app/components/dashed_line.dart';

class Subject extends StatelessWidget {
  const Subject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书影音'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: const DashedLine(
            axis: Axis.horizontal,
            dashedWidth: 8,
            dashedHeight: 3,
            count: 20,
          ),
        ),
      ),
    );
  }
}
