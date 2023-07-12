import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenRepository {
  FlutterSecureStorage? _storage;

  static final TokenRepository _instance = TokenRepository._internal();

  factory TokenRepository() {
    return _instance;
  }

  Future<void> setInfo(String key, String value) async {
    await _storage!.write(key: key, value: value.toString());
  }
  Future<String> getInfo(String key) async {
    String value = "";
    var data = await _storage!.read(key: key);
    if(data != "") {
      value = data!.toString();
    }
    return value;
  }

  TokenRepository._internal() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> setAccessToken(String token) async {
    await _storage!.write(key: "token", value: token);
  }

  Future<void> setRememberme(bool rememberme) async {
    await _storage!.write(key: "rememberme", value: rememberme.toString());
    if (!rememberme) {
      await _storage!.write(key: "amountOfLogin", value: "1");
    }
  }

  Future<bool> getRememberme() async {
    var data = await _storage!.read(key: "rememberme");
    if (data == "true") return true;

    var amountString = await _storage!.read(key: "amountOfLogin");

    if (amountString != null) {
      int amount = int.parse(amountString);
      if (amount > 0) {
        await _storage!.write(key: "amountOfLogin", value: "${amount - 1}");
        return true;
      }
    }

    return false;
  }

  Future<String?> getAccessToken() async {
    return await _storage!.read(key: "token");
  }

  Future<bool?> tokenExists() async {
    try {
      var data = await _storage!.read(key: "token");

      return data == null ? false : true;
    } catch (e) {
      return false;
    }

    //return await _storage!.read(key: "session");
  }

  Future<String?> getAccessTokenRemainingTime() async {
    return await _storage!.read(key: "token_remaining_time");
  }

  Future<void> setAccessTokenRemainingTime(String time) async {
    await _storage!.write(key: "token_remaining_time", value: time);
  }

  Future<void> deleteSession() async {
    await _storage!.delete(key: "token");
    await _storage!.delete(key: "rememberme");
  }
}
