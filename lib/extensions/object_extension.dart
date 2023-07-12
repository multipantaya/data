import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

extension ObjectExtension on Object {
  Left<E, B> unknownError<E, B>() =>
      Left(DataException(error: toString())) as Left<E, B>;
}
