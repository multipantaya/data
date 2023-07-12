class DataException implements Exception {
  final String? statusCode;
  final String? error;
  final String? message; //este campo tiene que ser removido en el transcurso
  final String? explanation;
  final dynamic extra;
  
  const DataException({
    this.error,
    this.extra,
    this.message,
    this.statusCode,
    this.explanation,
  });

  // ignore: annotate_overrides
  String toString() => '${error.toString()}: $error';
}
