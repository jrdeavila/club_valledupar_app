abstract class HttpClient {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<T> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
