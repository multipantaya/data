import 'package:data/data.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await TokenRepository().getAccessToken();
    // print(accessToken);

    if (accessToken != null) {
      /*String? expiration =
          await TokenRepository().getAccessTokenRemainingTime();

      if (int.parse(expiration!) < 60) {
        dio.interceptors.requestLock.lock();

        // Call the refresh endpoint to get a new token
        autenticationRemote.refreshToken().then((response) async {
          await TokenRepository().setAccessToken(response.accessToken);
          accessToken = response.accessToken;
        }).catchError((error, stackTrace) {
          handler.reject(error, true);
        }).whenComplete(() => dio.interceptors.requestLock.unlock());
      }*/

      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  /*@override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
          case 502:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }*/
}
