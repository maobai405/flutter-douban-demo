import 'package:dio/dio.dart';

class Fetch {
  static Future request(String url,
      {String method = 'get', Map<String, dynamic>? params}) async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'http://api.douban.com/v2',
      connectTimeout: const Duration(milliseconds: 5000),
      validateStatus: (status) => true, // 忽略http状态码的验证
    );
    // 创建dio实例
    Dio dio = Dio(baseOptions);

    // 发送网络请求
    Options options = Options(
      method: method,
    );
    try {
      final result =
          await dio.request(url, queryParameters: params, options: options);
      return result;
    } on DioError catch (error) {
      rethrow;
    }
  }
}
