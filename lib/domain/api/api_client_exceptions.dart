/* 
  1) нет сети
  2) нет ответа, таймаут соединения

  3) сервер не доступен
  4) сервер не может обработать запрос
  5) сервер ответил не то что мы ожидали

  6) сервер ответил ожидаемой ошибкой
*/

/// [network] - SocketException
/// 
/// [auth] - 401
/// 
enum ApiClientExceptionType { network, auth, other, sessionExpired }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}
