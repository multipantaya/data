import 'package:dio/dio.dart';
import 'api_error.dart';

class ResponseInterceptors extends Interceptor {
  final Dio dio;

  ResponseInterceptors(this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // response.data = InterceptorEntityResponse(
    //         status: ConstantApi.typeSuccess, data: response.data)
    //     .toJson();
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return handler.next(err);
      case DioExceptionType.sendTimeout:
        return handler.next(err);

      case DioExceptionType.receiveTimeout:
        return handler.next(err);

      // case DioExceptionType.response:
      //   switch (err.response?.statusCode) {
      //     case 400:
      //       // err.response!.data = InterceptorEntityResponse(
      //       //         data: err.response?.data, status: ConstantApi.typeError)
      //       //     .toJson();
      //       return handler.next(err);
      //     case 403:
      //       // err.response!.data = InterceptorEntityResponse(
      //       //         data: err.response?.data, status: ConstantApi.typeError)
      //       //     .toJson();
      //       return handler.next(err);
      //     case 404:
      //       // err.response!.data = InterceptorEntityResponse(
      //       //         data: err.response?.data, status: ConstantApi.typeError)
      //       //     .toJson();
      //       return handler.next(err);
      //     //throw BadRequestException(err.requestOptions);
      //     case 401:
      //       throw UnauthorizedException(err.requestOptions);
      //     /*case 404:
      //       throw NotFoundException(err.requestOptions);*/
      //     case 409:
      //       throw ConflictException(err.requestOptions);
      //     case 500:
      //       return handler.next(err);
      //     // throw InternalServerErrorException(err.requestOptions);
      //   }
      //   break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:

        break;
      case DioExceptionType.badResponse:

        break;
      case DioExceptionType.connectionError:
      
        break;
    }

    //return handler.next(err);
  }
}
