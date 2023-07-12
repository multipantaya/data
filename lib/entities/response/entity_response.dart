import 'code_message_entity_response.dart';

class EntityResponse {
  dynamic data;

  ResponseCodeMessageEntity? codeMessage;
  String? message;

  EntityResponse({
    this.data,
    this.codeMessage,
    this.message,
  });
}
