import 'package:dio/dio.dart';
import 'api_interceptors.dart';
import 'constant/constant_api.dart';
import 'response_interceptors.dart';

class Api {
  final dio = createDio();
  final tokenDio = createtokenDio();
  final dioFormData = createDioFormData();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createtokenDio() {
    var dio = Dio(BaseOptions(
      baseUrl: ConstantApi.urlBaseDev,
      receiveTimeout: const Duration(seconds:15),
      connectTimeout: const Duration(seconds:15),
      sendTimeout: const Duration(seconds:15),
    ));

    dio.interceptors.addAll({AppInterceptors(dio), ResponseInterceptors(dio)});
    return dio;
  }

  static Dio createDioFormData() {
    var dio = Dio(BaseOptions(
        baseUrl: ConstantApi.urlBaseDev,
        connectTimeout: const Duration(seconds:15),
        receiveTimeout: const Duration(seconds:15),
        sendTimeout: const Duration(seconds:15),
        validateStatus: (status) {
          return (status ?? 0) <= 500;
        }));

    dio.interceptors.addAll({AppInterceptors(dio), ResponseInterceptors(dio)});
    return dio;
  }

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: ConstantApi.urlBaseDev,
        receiveTimeout: const Duration(seconds:15),
        connectTimeout: const Duration(seconds:15),
        sendTimeout: const Duration(seconds:15),
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.jsonContentType,
        }));

    dio.interceptors.addAll({
      ResponseInterceptors(dio),
    });
    return dio;
  }
}
