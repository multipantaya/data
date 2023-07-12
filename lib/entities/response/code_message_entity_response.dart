import 'dart:convert';

class ResponseCodeMessageEntity {
    ResponseCodeMessageEntity({
        this.result,
        this.message,
       
    });

    String ?result;
    String ?message;
 

    factory ResponseCodeMessageEntity.fromRawJson(String str) => ResponseCodeMessageEntity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseCodeMessageEntity.fromJson(Map<String, dynamic> json) => ResponseCodeMessageEntity(
        result: json["result"],
        message: json["message"],
        
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
       
    };
}