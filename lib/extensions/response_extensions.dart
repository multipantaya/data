import 'package:data/data.dart';
import 'package:dio/dio.dart';

extension ResponseExtension on DioException {
  DataException errorFromDio() {
    dynamic data = response;
    // print(StringUtils.notNullError(
    //     data?.data is String ? data?.data : data?.data["error"]));
    return DataException(
        error: StringUtils.notNullError(
            data?.data is String ? data?.data : data?.data["error"]));
  }
}
